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

class ScannerVideoScreen extends StatefulWidget {
  late String kit;
  late String clientName;
  late String phoneNumber;
  late String TestType;

  ScannerVideoScreen(
      {Key? key,
      required this.kit,
      required this.clientName,
      required this.phoneNumber,
      required this.TestType})
      : super(key: key);

  @override
  State<ScannerVideoScreen> createState() => _ScannerVideoScreenState();
}

class _ScannerVideoScreenState extends State<ScannerVideoScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  bool imageCaptured = false;
  late String imagePath;
  bool showLoader = false;
  late String filepath;
  late Timer mytimer;
  bool showFocusCircle = true;
  double x = 0;
  double y = 0;

  bool _isRecordingInProgress = false;

  final resolutionPresets = ResolutionPreset.values;

  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (controller!.value.isRecordingVideo) {
      // A recording has already started, do nothing.
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      setState(() {
        _isRecordingInProgress = true;
        print(_isRecordingInProgress);
      });
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
    return;
  }

  Future<XFile?> stopVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }

    try {
      XFile file = await controller.stopVideoRecording();
      setState(() {
        _isRecordingInProgress = false;
      });
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  Future<void> _onTap(TapUpDetails details) async {
    if (controller.value.isInitialized) {
      showFocusCircle = true;
      x = details.localPosition.dx;
      y = details.localPosition.dy;

      double fullWidth = MediaQuery.of(context).size.width;
      double cameraHeight = fullWidth * controller.value.aspectRatio;

      double xp = x / fullWidth;
      double yp = y / cameraHeight;

      Offset point = Offset(xp, yp);
      print("point : $point");

      // Manually focus
      await controller.setFocusPoint(point);

      // Manually set light exposure
      //controller.setExposurePoint(point);

      setState(() {
        Future.delayed(const Duration(seconds: 2)).whenComplete(() {
          setState(() {
            showFocusCircle = false;
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    // getPermissionStatus();
    controller = CameraController(
        // Get a specific camera from the list of available cameras.
        cameras.first,
        ResolutionPreset.veryHigh,
        enableAudio: false);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = controller.initialize().then((value) {
      controller.setZoomLevel(0.6);
      controller.setExposureOffset(1.1);
      setState(() {
        x = MediaQuery.of(context).size.width / 2;
        y = MediaQuery.of(context).size.height / 2;
        showFocusCircle = true;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    if (mytimer != null) {
      mytimer.cancel();
    }
    controller?.dispose();
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
                        return Stack(children: [
                          CameraPreview(
                            controller!,
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return GestureDetector(
                                  // behavior: HitTestBehavior.opaque,
                                  onTapUp: (details) {
                                _onTap(details);
                              });
                            }),
                          ),
                          if (showFocusCircle)
                            Positioned(
                                top: y - 20,
                                left: x - 20,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 1.5)),
                                ))
                          // Container(
                          //   margin: EdgeInsets.all(0),
                          //   padding: EdgeInsets.all(0),
                          //   height: MediaQuery.of(context).size.height * 0.8,
                          //   width: MediaQuery.of(context).size.width * 0.306,
                          //   color: Colors.black.withOpacity(0.8),
                          // ),
                          // // CustomPaint(
                          // //   painter: OpenPainter(),
                          // // ),
                          // Positioned(
                          //   left: MediaQuery.of(context).size.width * 0.7,
                          //   child: Container(
                          //     margin: EdgeInsets.all(0),
                          //     padding: EdgeInsets.all(0),
                          //     height: MediaQuery.of(context).size.height * 0.8,
                          //     width: MediaQuery.of(context).size.width * 0.306,
                          //     color: Colors.black.withOpacity(0.8),
                          //   ),
                          // ),
                          // Positioned(
                          //   top: MediaQuery.of(context).size.height * 0.7,
                          //   left: MediaQuery.of(context).size.width * 0.3049,
                          //   child: Container(
                          //     margin: EdgeInsets.all(0),
                          //     padding: EdgeInsets.all(0),
                          //     height: MediaQuery.of(context).size.height * 0.8,
                          //     width: MediaQuery.of(context).size.width * 0.395,
                          //     color: Colors.black.withOpacity(0.8),
                          //   ),
                          // ),
                          // Positioned(
                          //   top: 0,
                          //   left: MediaQuery.of(context).size.width * 0.3049,
                          //   child: Container(
                          //     margin: EdgeInsets.all(0),
                          //     padding: EdgeInsets.all(0),
                          //     height: MediaQuery.of(context).size.height * 0.1,
                          //     width: MediaQuery.of(context).size.width * 0.395,
                          //     color: Colors.black.withOpacity(0.8),
                          //   ),
                          // ),
                        ]);
                      } else {
                        // Otherwise, display a loading indicator.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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

                                          try {
                                            var request = http.MultipartRequest(
                                                'POST',
                                                Uri.http(API.baseUrl,
                                                    API.uploadUrl));
                                            request.files.add(
                                                await http.MultipartFile
                                                    .fromPath("file",
                                                        File(imagePath).path));
                                            request.fields["kit"] = widget.kit;
                                            request.fields["client_name"] =
                                                "${widget.clientName}"
                                                    .replaceAll(" ", "");

                                            "${widget.clientName}"
                                                .replaceAll(" ", "");
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
                        child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Click on screen to focus strip'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.white, width: 4),
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

                                      try {
                                        // Ensure that the camera is initialized.
                                        await _initializeControllerFuture;

                                        await startVideoRecording();
                                        print("video_recording started");
                                        double value = 0.6;
                                        mytimer = Timer.periodic(
                                            Duration(milliseconds: 34),
                                            (timer) async {
                                          if (value <= 1.5) {
                                            setState(() {
                                              value = value + 0.001;
                                              print(value);
                                            });
                                            await controller!
                                                .setExposureOffset(value);
                                          } else {
                                            XFile? image =
                                                await stopVideoRecording();
                                            print(image?.path);

                                            String trmpName = image!.path;
                                            String extension = trmpName
                                                .split('/')
                                                .last
                                                .split('.')
                                                .last;
                                            print(extension);
                                            DateTime now = DateTime.now();
                                            String fileNameNew =
                                                "${widget.clientName}_${widget.TestType}.$extension";
                                            var path = image.path;
                                            var lastSeparator =
                                                path.lastIndexOf(
                                                    Platform.pathSeparator);
                                            var newPath = path.substring(
                                                    0, lastSeparator + 1) +
                                                fileNameNew;
                                            File(image.path).rename(newPath);

                                            print(path);
                                            print(newPath);
                                            setState(() {
                                              imagePath = newPath;
                                              showLoader = false;
                                              imageCaptured = true;
                                            });

                                            timer.cancel();
                                          }
                                        });
                                      } catch (e) {
                                        // If an error occurs, log the error to the console.
                                        print(e);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
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

// class OpenPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double height = size.height;
//     double width = size.width;
//
//     var paint1 = Paint()
//       ..color = Color(0xffaeafb2)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3;
//
//     canvas.drawRect(
//         Offset(width * 0.1, height * 0.2) & Size(width * 0.5, height * 0.7),
//         paint1);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
