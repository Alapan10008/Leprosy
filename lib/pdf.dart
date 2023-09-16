import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

Future<File> createPDF() async {
  final pdf = pw.Document();

  // Add a page to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Center(
              child:
                  pw.Text('Referral slip', style: pw.TextStyle(fontSize: 50)),
            ),
            pw.SizedBox(height: 50),
            pw.Text('Name of the State :', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Name of the District: ',
                style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Name of the Block: ', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Name of the Village:', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Name of the Suspect:', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Address and telephone no:',
                style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Date of screening:', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Reffered to CHO-HWC/PHC/UPHC name:',
                style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Name and Signature of the Female /Male FLW:',
                style: pw.TextStyle(fontSize: 20)),
          ],
        );
      },
    ),
  );

  // Save the PDF document to a file
  final outputDir = await getTemporaryDirectory();
  final outputFile = File('${outputDir.path}/Referral_Slip.pdf');
  await outputFile.writeAsBytes(await pdf.save());

  return outputFile;
}

void openPDF(File file) {
  OpenFile.open(file.path);
}
