import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppGPA extends StatefulWidget {
  const MyAppGPA({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class Constants {
  static const String FirstItem = '1';
  static const String SecondItem = '3';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
  ];
}

class _MyAppState extends State<MyAppGPA> {
  final List<String> _inputs = [];
  final List<String> _credit = [];
  String in2 = '0';
  double _gpa = 0.0;
  var i = -1;
  void _calculateGPA() {
    List<double> lint = _inputs.map(double.parse).toList();
    List<int> lcred = _credit.map(int.parse).toList();

    for (int j = 0; j < _inputs.length; j++) {
      lint[j] = lint[j] * lcred[j];
    }

    double total = lint.reduce((a, b) => a + b);
    int t = lcred.reduce((a, b) => a + b);
    _gpa = total / t;
  }

  void choiceAction(String choice) {
    if (choice == Constants.FirstItem) {
      in2 = '1';
    } else if (choice == Constants.SecondItem) {
      in2 = '3';
    }
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
                      'Course ${entry.key + 1}: ${entry.value} , Credit Hours: ${_credit[entry.key]}',
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
                        String in1 = '';

                        List<String> inputs = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Enter two inputs'),
                            content: Column(
                              children: [
                                TextFormField(
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
                                  decoration: const InputDecoration(labelText: 'GPA'),
                                  onChanged: (value) {
                                    in1 = value;
                                  },
                                ),
                                // TextFormField(
                                //   keyboardType: TextInputType.number,
                                //   decoration: InputDecoration(
                                //       labelText: 'Credit Hours'),
                                //   onChanged: (value) {
                                //     in2 = value;
                                //   },
                                // ),
                                const Text('Choose Credit Hours:'),
                                PopupMenuButton<String>(
                                  onSelected: choiceAction,
                                  itemBuilder: (BuildContext context) {
                                    return Constants.choices
                                        .map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                )
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop([in1, in2]);
                                },
                                child: const Text('Submit'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog without saving inputs
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                        if (inputs[1].isNotEmpty && inputs[0].isNotEmpty) {
                          setState(() {
                            // Use inputs[0] and inputs[1] for input values
                            _inputs.add(inputs[0]);
                            _credit.add(inputs[1]);
                            inputs.clear();
                            in1 = '';
                            in2 = '';
                            i += 1;
                          });
                        }
                      },
                      child: const Text('Add inputs'),
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
                    _credit.clear();
                    _gpa = 0.0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('Clear'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
