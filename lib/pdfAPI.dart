import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

List<String> tableData = [
  'Name of the state',
  'Name of the District',
  'Name of the Bock',
  'Name of the Village',
  'Name of the Suspect',
  'Address and telephone number',
  'Date of screening',
  'Referred to CHO-HWC/[PHC/UPHC name'
      'Name and Signature of the Female/Male FLW',
];

class Invoice {
  final String customer;
  final String address;
  final List<LineItem> items;
  Invoice(this.customer, this.address, this.items);
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

class PdfApi {
  static Future<File> generateTable() async {
    final pdf = Document();

    final headers = ['Name', 'Age'];

    final users = [
      User(name: 'James', age: 19),
      User(name: 'Sarah', age: 21),
      User(name: 'Emma', age: 28),
    ];
    final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    print("openfile");
    await OpenFile.open(url);
  }
}
