import 'package:flutter/material.dart';

import '../utilities/format.dart';

class Course {
  String name;
  String grade;
  double creditHours;

  Course({required this.name, required this.grade, required this.creditHours});
}

class SGPA extends StatefulWidget {
  const SGPA({super.key});

  @override
  _SGPAState createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  List<Course> courses = [
    Course(name: '', grade: 'Select', creditHours: 0.0),
    Course(name: '', grade: 'Select', creditHours: 0.0),
    Course(name: '', grade: 'Select', creditHours: 0.0),
    Course(name: '', grade: 'Select', creditHours: 0.0),
    Course(name: '', grade: 'Select', creditHours: 0.0),
  ];

  List<String> grades = [
    'Select',
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F'
  ];

  double sgpa = 0.0;

  void calculateSGPA() {
    double totalCreditHours = 0.0;
    double totalPoints = 0.0;

    for (int i = 0; i < courses.length; i++) {
      // if (courses[i].name != '' &&
      //     courses[i].grade != 'Select' &&
      //     courses[i].creditHours != 0.0)
      {
        totalCreditHours += courses[i].creditHours;

        switch (courses[i].grade) {
          case 'Select':
            //courses[i].creditHours = 0.0;
            totalPoints += courses[i].creditHours * 0.0;
            break;
          case 'A+':
            totalPoints += courses[i].creditHours * 4.0;
            break;
          case 'A':
            totalPoints += courses[i].creditHours * 3.75;
            break;
          case 'A-':
            totalPoints += courses[i].creditHours * 3.5;
            break;
          case 'B+':
            totalPoints += courses[i].creditHours * 3.25;
            break;
          case 'B':
            totalPoints += courses[i].creditHours * 3.0;
            break;
          case 'B-':
            totalPoints += courses[i].creditHours * 2.75;
            break;
          case 'C+':
            totalPoints += courses[i].creditHours * 2.5;
            break;
          case 'C':
            totalPoints += courses[i].creditHours * 2.25;
            break;
          case 'C-':
            totalPoints += courses[i].creditHours * 2.0;
            break;
          case 'D+':
            totalPoints += courses[i].creditHours * 1.75;
            break;
          case 'D':
            totalPoints += courses[i].creditHours * 1.5;
            break;
          case 'F':
            totalPoints += courses[i].creditHours * 0.0;
            break;
        }
      }
    }

    if (totalCreditHours > 0.0) {
      setState(() {
        sgpa = totalPoints / totalCreditHours;
      });
    } else {
      setState(() {
        sgpa = 0.0;
      });
    }
  }

  final Map<String, double> _gradePoints = {
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'F': 0.0,
    'Select': 0.0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SGPA Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Course 1',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[0].name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField(
                value: courses[0].grade,
                onChanged: (value) {
                  setState(() {
                    courses[0].grade = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: grades
                    .map((grade) => DropdownMenuItem(
                          value: grade,
                          child: Text(grade),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[0].creditHours = double.parse(value);
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Credit Hours',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Course 2',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[1].name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField(
                value: courses[1].grade,
                onChanged: (value) {
                  setState(() {
                    courses[1].grade = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: grades
                    .map((grade) => DropdownMenuItem(
                          value: grade,
                          child: Text(grade),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[1].creditHours = double.parse(value);
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Credit Hours',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Course 3',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[2].name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField(
                value: courses[2].grade,
                onChanged: (value) {
                  setState(() {
                    courses[2].grade = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: grades
                    .map((grade) => DropdownMenuItem(
                          value: grade,
                          child: Text(grade),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[2].creditHours = double.parse(value);
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Credit Hours',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Course 4',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[3].name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField(
                value: courses[3].grade,
                onChanged: (value) {
                  setState(() {
                    courses[3].grade = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: grades
                    .map((grade) => DropdownMenuItem(
                          value: grade,
                          child: Text(grade),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[3].creditHours = double.parse(value);
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Credit Hours',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Course 5',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[4].name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField(
                value: courses[4].grade,
                onChanged: (value) {
                  setState(() {
                    courses[4].grade = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: grades
                    .map((grade) => DropdownMenuItem(
                          value: grade,
                          child: Text(grade),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    courses[4].creditHours = double.parse(value);
                  });
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  DecimalTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Credit Hours',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  double totalCredits = 0;
                  double totalGradePoints = 0;
                  for (var course in courses) {
                    totalCredits += course.creditHours;
                    totalGradePoints +=
                        _gradePoints[course.grade]! * course.creditHours;
                  }
                  double Sgpa = totalGradePoints / totalCredits;

                  setState(() {
                    sgpa = Sgpa;
                  });
                },
                child: const Text('Calculate SGPA'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'SGPA: $sgpa',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
