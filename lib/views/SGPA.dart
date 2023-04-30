import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppSGPA extends StatefulWidget {
  const MyAppSGPA({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppSGPA> {
  final List<String> _inputs = [];
  double _gpa = 0.0;
  var i = 0;
  void _calculateGPA() {
    List<double> lint = _inputs.map(double.parse).toList();

    double total = lint.reduce((a, b) => a + b);
    _gpa = total / _inputs.length;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Variable Inputs Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  color: Colors.amber,
                  child: Text('GPA: ${_gpa.toStringAsFixed(2)}', style: style)),
              ..._inputs.asMap().entries.map(
                    (entry) => Text(
                      'Semester ${entry.key + 1}: ${entry.value}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        String input = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Enter input'),
                            content: TextField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  try {
                                    final text = newValue.text;
                                    if (text.isNotEmpty) double.parse(text);
                                    return newValue;
                                  } catch (e) {}
                                  return oldValue;
                                }),
                              ],
                              onSubmitted: (value) {
                                Navigator.of(context).pop(value);
                              },
                            ),
                          ),
                        );
                        if (input.isNotEmpty) {
                          setState(() {
                            _inputs.add(input);
                            i = i + 1;
                          });
                        }
                      },
                      child: const Text('Add input'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _calculateGPA();
                        setState(() {});
                      },
                      child: const Text('Calculate'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _inputs.clear();
                    _gpa = 0.0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('Clear'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushAndRemoveUntil(mainMenuRoute, (route) => false);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
