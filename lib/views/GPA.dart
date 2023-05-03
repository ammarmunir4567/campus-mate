// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyAppGPA extends StatefulWidget {
//   const MyAppGPA({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class Constants {
//   static const String FirstItem = '1';
//   static const String SecondItem = '3';

//   static const List<String> choices = <String>[
//     FirstItem,
//     SecondItem,
//   ];
// }

// class _MyAppState extends State<MyAppGPA> {
//   final List<String> _inputs = [];
//   final List<String> _credit = [];
//   String in2 = '0';
//   double _gpa = 0.0;
//   var i = -1;
//   void _calculateGPA() {
//     List<double> lint = _inputs.map(double.parse).toList();
//     List<int> lcred = _credit.map(int.parse).toList();

//     for (int j = 0; j < _inputs.length; j++) {
//       lint[j] = lint[j] * lcred[j];
//     }

//     double total = lint.reduce((a, b) => a + b);
//     int t = lcred.reduce((a, b) => a + b);
//     _gpa = total / t;
//   }

//   void choiceAction(String choice) {
//     if (choice == Constants.FirstItem) {
//       in2 = '1';
//     } else if (choice == Constants.SecondItem) {
//       in2 = '3';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Variable Inputs Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Card(
//                   color: Colors.amber,
//                   child: Text('GPA: ${_gpa.toStringAsFixed(2)}', style: style)),
//               ..._inputs.asMap().entries.map(
//                     (entry) => Text(
//                       'Course ${entry.key + 1}: ${entry.value} , Credit Hours: ${_credit[entry.key]}',
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         String in1 = '';

//                         List<String> inputs = await showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text('Enter two inputs'),
//                             content: Column(
//                               children: [
//                                 TextFormField(
//                                   autofocus: true,
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.allow(
//                                         RegExp(r"[0-9.]")),
//                                     TextInputFormatter.withFunction(
//                                         (oldValue, newValue) {
//                                       try {
//                                         final text = newValue.text;
//                                         if (text.isNotEmpty) double.parse(text);
//                                         return newValue;
//                                       } catch (e) {}
//                                       return oldValue;
//                                     }),
//                                   ],
//                                   decoration:
//                                       const InputDecoration(labelText: 'GPA'),
//                                   onChanged: (value) {
//                                     in1 = value;
//                                   },
//                                 ),
//                                 // TextFormField(
//                                 //   keyboardType: TextInputType.number,
//                                 //   decoration: InputDecoration(
//                                 //       labelText: 'Credit Hours'),
//                                 //   onChanged: (value) {
//                                 //     in2 = value;
//                                 //   },
//                                 // ),
//                                 const Text('Choose Credit Hours:'),
//                                 PopupMenuButton<String>(
//                                   onSelected: choiceAction,
//                                   itemBuilder: (BuildContext context) {
//                                     return Constants.choices
//                                         .map((String choice) {
//                                       return PopupMenuItem<String>(
//                                         value: choice,
//                                         child: Text(choice),
//                                       );
//                                     }).toList();
//                                   },
//                                 )
//                               ],
//                             ),
//                             actions: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop([in1, in2]);
//                                 },
//                                 child: const Text('Submit'),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.of(context)
//                                       .pop(); // Close the dialog without saving inputs
//                                 },
//                                 child: const Text('Close'),
//                               ),
//                             ],
//                           ),
//                         );
//                         if (inputs[1].isNotEmpty && inputs[0].isNotEmpty) {
//                           setState(() {
//                             // Use inputs[0] and inputs[1] for input values
//                             _inputs.add(inputs[0]);
//                             _credit.add(inputs[1]);
//                             inputs.clear();
//                             in1 = '';
//                             in2 = '';
//                             i += 1;
//                           });
//                         }
//                       },
//                       child: const Text('Add inputs'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         _calculateGPA();
//                         setState(() {});
//                       },
//                       child: const Text('Calculate'),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   setState(() {
//                     _inputs.clear();
//                     _credit.clear();
//                     _gpa = 0.0;
//                   });
//                 },
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.red)),
//                 child: const Text('Clear'),
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// class Semester {
//   String name;
//   double creditHours;
//   double gpa;

//   Semester({
//     required this.name,
//     required this.creditHours,
//     required this.gpa,
//   });
// }

// class CGPA extends StatefulWidget {
//   @override
//   _CGPAState createState() => _CGPAState();
// }

// class _CGPAState extends State<CGPA> {
//   List<Semester> semesters = [
//     Semester(name: '', creditHours: 0.0, gpa: 0.0),
//     Semester(name: '', creditHours: 0.0, gpa: 0.0)
//   ];

//   double cgpa = 0.0;

//   void calculateCGPA() {
//     double totalCreditHours = 0.0;
//     double totalPoints = 0.0;

//     for (int i = 0; i < semesters.length; i++) {
//       if (semesters[i].creditHours != 0.0 && semesters[i].gpa != 0.0) {
//         totalCreditHours += semesters[i].creditHours;
//         totalPoints += semesters[i].gpa * semesters[i].creditHours;
//       }
//     }

//     if (totalCreditHours > 0.0) {
//       setState(() {
//         cgpa = totalPoints / totalCreditHours;
//       });
//     } else {
//       setState(() {
//         cgpa = 0.0;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('CGPA Calculator'),
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Semester 1',
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[0].name = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[0].creditHours = double.parse(value);
//                     });
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'Credit Hours',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[0].gpa = double.parse(value);
//                     });
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'GPA',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'CGPA: ${cgpa.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Semester 2',
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[1].name = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[1].creditHours = double.parse(value);
//                     });
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'Credit Hours',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       semesters[1].gpa = double.parse(value);
//                     });
//                   },
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'GPA',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: calculateCGPA,
//                   child: Text('Calculate CGPA'),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'CGPA: ${cgpa.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16.0),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: semesters.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         title: Text(semesters[index].name),
//                         subtitle: Text(
//                           'Credit Hours: ${semesters[index].creditHours}, GPA: ${semesters[index].gpa}',
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 CustomPaint(
//                   size: Size(MediaQuery.of(context).size.width, 100),
//                   painter: CurvePainter(),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Developed by Your Name',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//               ],
//             ),
//           ),
//         )));
//   }
// }

class Course {
  double creditHours;
  double gpa;

  Course({required this.creditHours, required this.gpa});
}

class CGPA extends StatefulWidget {
  const CGPA({super.key});

  @override
  _CGPAState createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> {
  double ans = 0;
  List<Course> courses = [
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
    Course(creditHours: 0.0, gpa: 0.0),
  ];

  double cgpa = 0.0;

  void calculateCGPA() {
    double totalCreditHours = 0.0;
    double totalGradePoints = 0.0;

    for (int i = 0; i < courses.length; i++) {
      if (courses[i].creditHours != 0.0 && courses[i].gpa != 0.0) {
        totalCreditHours += courses[i].creditHours;
        totalGradePoints += courses[i].creditHours * courses[i].gpa;
      }
    }

    if (totalCreditHours > 0.0) {
      setState(() {
        cgpa = totalGradePoints / totalCreditHours;
      });
    } else {
      setState(() {
        cgpa = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CGPA Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 1',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[0].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[0].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 2',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[1].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[1].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 3',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[2].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[2].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),

//sem 4
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 4',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[3].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[3].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),

//sem5
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 5',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[4].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[4].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),

//sem6
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 3',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[5].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[5].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),

                //sem7
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 3',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[6].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[6].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),

                //sem8
                const SizedBox(height: 16.0),
                const Text(
                  'Semester 3',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[7].creditHours = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hours',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      courses[7].gpa = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ans = calculateGPA();
                    });
                  },
                  child: const Text('Calculate GPA'),
                ),
                Text(
                  'GPA: $ans',
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }

  double calculateGPA() {
    double totalCreditHours = 0;
    double totalQualityPoints = 0;
    for (int i = 0; i < courses.length; i++) {
      if (courses[i].creditHours != 0.0 && courses[i].gpa != 0.0) {
        double creditHours = courses[i].creditHours;
        double points = courses[i].gpa;
        totalCreditHours += creditHours;
        totalQualityPoints += (creditHours * points);
      }
    }

    if (totalCreditHours == 0) {
      return 0;
    }

    double gpa = totalQualityPoints / totalCreditHours;

    return gpa;
  }
}
