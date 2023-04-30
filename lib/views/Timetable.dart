import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MyAppTimeTable extends StatelessWidget {
  const MyAppTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Time Table Demo'),
        ),
        body: const ExcelScreen(),
      ),
    );
  }
}

class ExcelScreen extends StatefulWidget {
  const ExcelScreen({super.key});

  @override
  _ExcelScreenState createState() => _ExcelScreenState();
}

class _ExcelScreenState extends State<ExcelScreen> {
  late Excel _excel;
  late Sheet _sheet;
  late String input;
  late List<DataColumn> columns = [];
  late List<DataRow> rows = [];
  final _formKey = GlobalKey<FormState>();
  //Monday
  final _sub1M = TextEditingController();
  final _sub2M = TextEditingController();
  final _sub3M = TextEditingController();
  final _sub4M = TextEditingController();
  final _sub5M = TextEditingController();
  final _sub6M = TextEditingController();
  //Tuesday
  final _sub1T = TextEditingController();
  final _sub2T = TextEditingController();
  final _sub3T = TextEditingController();
  final _sub4T = TextEditingController();
  final _sub5T = TextEditingController();
  final _sub6T = TextEditingController();
  //Wednesday
  final _sub1W = TextEditingController();
  final _sub2W = TextEditingController();
  final _sub3W = TextEditingController();
  final _sub4W = TextEditingController();
  final _sub5W = TextEditingController();
  final _sub6W = TextEditingController();
  //Thursday
  final _sub1H = TextEditingController();
  final _sub2H = TextEditingController();
  final _sub3H = TextEditingController();
  final _sub4H = TextEditingController();
  final _sub5H = TextEditingController();
  final _sub6H = TextEditingController();
  //Friday
  final _sub1F = TextEditingController();
  final _sub2F = TextEditingController();
  final _sub3F = TextEditingController();
  final _sub4F = TextEditingController();
  final _sub5F = TextEditingController();
  final _sub6F = TextEditingController();
  //Saturday
  final _sub1S = TextEditingController();
  final _sub2S = TextEditingController();
  final _sub3S = TextEditingController();
  final _sub4S = TextEditingController();
  final _sub5S = TextEditingController();
  final _sub6S = TextEditingController();

  @override
  void initState() {
    super.initState();
    _excel = Excel.createExcel();
    _sheet = _excel['Sheet1'];
  }

  Future<File> _saveFile(List<int> bytes) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath/updated_file.xlsx');
    //print('$tempPath/updated_file.xlsx');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<File> saveExcelFile(Excel excel, String fileName) async {
    // Get the directory for saving files
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;

    // Create a File object for the Excel file
    File excelFile = File('$appDocumentsPath/$fileName.xlsx');

    // Write the Excel data to the file
    excelFile.writeAsBytesSync(_excel.encode() as List<int>);

    return excelFile;
  }

  Future<String> _Save() async {
    var outputBytes = _excel.encode();

    //File updatedFile = await _saveFile(outputBytes as List<int>); //save temp
    File updatedFile =
        await saveExcelFile(_excel, 'example'); //save permanently
    return updatedFile.path;
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You can find your file here:'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _addDataToExcel() {
    for (int i = 1; i < _sheet.maxRows; i++) {
      _sheet.clearRow(i);
    }

    // Add row to sheet
    _sheet.appendRow([
      'Time/Day',
      '8:30-10:00',
      '10:00-11:30',
      '11:30-1:00',
      '1:00-2:30',
      '2:30-4:00',
      '4:00-5:30'
    ]);
    var sub1 = _sub1M.text;
    var sub2 = _sub2M.text;
    var sub3 = _sub3M.text;
    var sub4 = _sub4M.text;
    var sub5 = _sub5M.text;
    var sub6 = _sub6M.text;
    _sheet
        .insertRowIterables(['Monday', sub1, sub2, sub3, sub4, sub5, sub6], 1);

    //_sheet.appendRow(['Monday', sub1, sub2, sub3, sub4, sub5, sub6]);
    _sheet.insertRowIterables([
      'Tuesday',
      _sub1T.text,
      _sub2T.text,
      _sub3T.text,
      _sub4T.text,
      _sub5T.text,
      _sub6T.text
    ], 2);
    _sheet.insertRowIterables([
      'Wednesday',
      _sub1W.text,
      _sub2W.text,
      _sub3W.text,
      _sub4W.text,
      _sub5W.text,
      _sub6W.text
    ], 3);
    _sheet.insertRowIterables([
      'Thursday',
      _sub1H.text,
      _sub2H.text,
      _sub3H.text,
      _sub4H.text,
      _sub5H.text,
      _sub6H.text
    ], 4);
    _sheet.insertRowIterables([
      'Friday',
      _sub1F.text,
      _sub2F.text,
      _sub3F.text,
      _sub4F.text,
      _sub5F.text,
      _sub6F.text
    ], 5);
    _sheet.insertRowIterables([
      'Saturday',
      _sub1S.text,
      _sub2S.text,
      _sub3S.text,
      _sub4S.text,
      _sub5S.text,
      _sub6S.text
    ], 6);

    // Save excel file

    List<int> fileBytes = _excel.encode()!;
    // Write file to device's local storage
    var file = File('assets/timetable.xlsx');
    file.writeAsBytes(fileBytes);
    // ...
  }

  Future<void> uploadexcel() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('excelFilePath', 'C:/Users/del/Documents/example.xlsx');
    // String? filePath = prefs.getString('excelFilePath');
    columns.clear();
    rows.clear();
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    var bytes = File('$appDocumentsPath/example.xlsx').readAsBytesSync();
    var excel2 = Excel.decodeBytes(bytes);
    var sheet = excel2['Sheet1'];
    for (var cell in sheet.rows.first) {
      columns.add(DataColumn(
        label: Text(cell!.value.toString()),
      ));
    }
    for (var i = 1; i < sheet.rows.length; i++) {
      List<DataCell> cells = [];
      for (var cell in sheet.rows[i]) {
        cells.add(DataCell(Text(cell!.value.toString())));
      }
      rows.add(DataRow(cells: cells));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Excel Demo'),
      ),
      body: Center(
        key: _formKey,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child: Text(
                              'Monday',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1M,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2M,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3M,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4M,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5M,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6M,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child: Text('Tuesday', textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1T,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2T,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3T,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4T,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5T,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6T,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Wednesday
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child:
                                Text('Wednesday', textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1W,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2W,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3W,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4W,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5W,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6W,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Thursday
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child:
                                Text('Thursday', textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1H,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2H,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3H,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4H,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5H,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6H,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Friday
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child:
                                Text('Thursday', textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1F,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2F,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3F,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4F,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5F,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6F,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Saturday
                    Column(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Card(
                            color: Colors.amberAccent,
                            child:
                                Text('Saturday', textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub1S,
                            decoration: const InputDecoration(
                              labelText: '8:30-10:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub2S,
                            decoration: const InputDecoration(
                              labelText: '10:00-11:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub3S,
                            decoration: const InputDecoration(
                              labelText: '11:30-1:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub4S,
                            decoration: const InputDecoration(
                              labelText: '1:00-2:30',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub5S,
                            decoration: const InputDecoration(
                              labelText: '2:30-4:00',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _sub6S,
                            decoration: const InputDecoration(
                              labelText: '4:00-5:30',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _addDataToExcel,
                              child: const Text('Add Data to Excel'),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () async {
                                input = await _Save();
                                _showAlertDialog(context, input);
                                print(input);
                              },
                              child: const Text('Download'),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () async {
                                await uploadexcel();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: DataTable(
                                            columns: columns,
                                            rows: rows,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text('View Timetable'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
