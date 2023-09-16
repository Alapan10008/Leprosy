// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/main.dart';
import 'package:varun_s_application1/utils/api_list.dart';
import 'package:varun_s_application1/widgets/custom_button.dart';

class ScannerScreen extends StatefulWidget {
  late String kit;
  late String clientName;
  late String phoneNumber;
  ScannerScreen(
      {Key? key,
      required this.kit,
      required this.clientName,
      required this.phoneNumber})
      : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool imageCaptured = false;
  late String imagePath;
  bool showLoader = false;
  int listImageCount = 100;

  List imageList = [];

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.veryHigh,
    );

    _controller.setFlashMode(FlashMode.off);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Column(
          children: [
            (imageCaptured == false)
                ? FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the Future is complete, display the preview.
                        return CameraPreview(_controller);
                      } else {
                        // Otherwise, display a loading indicator.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                : Image.file(
                    File(imagePath),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                  ),
            (imageCaptured == true)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            imagePath = '';
                            imageCaptured = false;
                          });
                        },
                        child: CustomButton(
                          height: getVerticalSize(
                            45,
                          ),
                          width: getHorizontalSize(
                            143,
                          ),
                          text: "lbl_retake".tr,
                          margin: getMargin(
                            top: 20,
                          ),
                          variant: ButtonVariant.OutlineBluegray500,
                          padding: ButtonPadding.PaddingT13,
                          fontStyle:
                              ButtonFontStyle.RobotoRomanMedium16Black90084,
                          prefixWidget: Container(
                            margin: getMargin(
                              right: 9,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgCamera,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Do you want to upload images for ${widget.kit}"),
                                  actions: [
                                    OutlinedButton(
                                        onPressed: () async {
                                          // Navigator.pop(context);
                                          setState(() {
                                            showLoader = true;
                                          });
                                          (showLoader == true)
                                              ? showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      title: Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    );
                                                  })
                                              : Container();
                                          for (var s in imageList) {
                                            try {
                                              var request =
                                                  http.MultipartRequest(
                                                      'POST',
                                                      Uri.http(API.baseUrl,
                                                          API.uploadUrl));
                                              request.files.add(await http
                                                      .MultipartFile
                                                  .fromPath(
                                                      "file", File(s).path));
                                              request.fields["kit"] =
                                                  widget.kit;
                                              request.fields["client_name"] =
                                                  "${widget.clientName.replaceAll(" ", "")}";
                                              request.fields["phlebo_no"] =
                                                  widget.phoneNumber;
                                              print(request.fields.toString());
                                              var responseCustomerProfileImage =
                                                  await request.send();
                                              if (responseCustomerProfileImage
                                                      .statusCode ==
                                                  200) {
                                                print("Upload Success Profile");
                                              } else {
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: ((context) {
                                                      return AlertDialog(
                                                        title: const Icon(
                                                          Icons.cancel,
                                                          size: 56,
                                                          color: Colors.red,
                                                        ),
                                                        content: Text(
                                                            "Request Profile Image failed with status: ${responseCustomerProfileImage.statusCode}."),
                                                        actions: [
                                                          OutlinedButton(
                                                              onPressed: (() {
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                              child: const Text(
                                                                  "Dismiss"))
                                                        ],
                                                      );
                                                    }));
                                              }
                                            } on PlatformException {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: ((context) {
                                                    return AlertDialog(
                                                      title: const Icon(
                                                        Icons.cancel,
                                                        size: 56,
                                                        color: Colors.red,
                                                      ),
                                                      content: const Text(
                                                          'Failed to get platform version.'),
                                                      actions: [
                                                        OutlinedButton(
                                                            onPressed: (() {
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                            child: const Text(
                                                                "Dismiss"))
                                                      ],
                                                    );
                                                  }));
                                            }
                                          }
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: ((context) {
                                                return AlertDialog(
                                                  title: const Icon(
                                                    Icons.check,
                                                    size: 56,
                                                    color: Colors.green,
                                                  ),
                                                  content: Text(
                                                      "Upload Success Image"),
                                                  actions: [
                                                    OutlinedButton(
                                                        onPressed: (() {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        child: const Text(
                                                            "Dismiss"))
                                                  ],
                                                );
                                              }));
                                        },
                                        child: Text("Yes")),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No"))
                                  ],
                                );
                              });
                        },
                        child: CustomButton(
                          height: getVerticalSize(
                            45,
                          ),
                          width: getHorizontalSize(
                            142,
                          ),
                          text: "lbl_submit".tr,
                          margin: getMargin(
                            top: 20,
                            right: 7,
                          ),
                        ),
                      )
                    ],
                  )
                : ((showLoader == false)
                    ? Expanded(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 4),
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                  side: BorderSide(
                                      width: 5.0, color: Colors.white),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    showLoader = true;
                                  });
                                  var list = [
                                    for (var i = 1.221;
                                        i <= 1.500;
                                        i = i + 0.005)
                                      double.parse(i.toStringAsPrecision(4))
                                  ];
                                  for (var i = 0; i < list.length; i++) {
                                    try {
                                      // Ensure that the camera is initialized.
                                      await _initializeControllerFuture;

                                      // Attempt to take a picture and then get the location
                                      // where the image file is saved.

                                      // var rnd = new Random();
                                      // var r = list[rnd.nextInt(list.length)];
                                      // print(r);
                                      var r = list[i];
                                      _controller.setExposureOffset(r);

                                      final image =
                                          await _controller.takePicture();
                                      print(image.path);

                                      String trmpName = image.path;
                                      String extension = trmpName
                                          .split('/')
                                          .last
                                          .split('.')
                                          .last;
                                      print(extension);

                                      String fileName = trmpName
                                          .split('/')
                                          .last
                                          .split('.')
                                          .first;
                                      String fileNameNew =
                                          "${widget.clientName}_${DateTime.now()}_${r.toString().replaceAll('.', '_')}.$extension";
                                      var path = image.path;
                                      var lastSeparator = path
                                          .lastIndexOf(Platform.pathSeparator);
                                      var newPath =
                                          path.substring(0, lastSeparator + 1) +
                                              fileNameNew;
                                      File(image.path).rename(newPath);

                                      print(path);
                                      print(newPath);
// /data/user/0/com.varunsapplication.app/cache/

                                      setState(() {
                                        imagePath = newPath;
                                        imageList.add(newPath);
                                      });
                                    } catch (e) {
                                      // If an error occurs, log the error to the console.
                                      print(e);
                                    }
                                  }
                                  setState(() {
                                    showLoader = false;
                                    imageCaptured = true;
                                  });

                                  print("List of Images:- ${imageList.length}");
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ))
                    : Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
