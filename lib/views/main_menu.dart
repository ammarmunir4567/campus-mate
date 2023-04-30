import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/views/SGPA.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';

import 'package:newapp/utilities/dialogs/logout_dialog.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Main Menu'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                  }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                    value: MenuAction.logout, child: Text('Logout'))
              ];
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, gpaRoute);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate, size: 100),
                SizedBox(height: 16),
                Text('GPA Calculator'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, sgpaRoute);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyAppSGPA()));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calculate_outlined,
                  size: 100,
                ),
                SizedBox(height: 16),
                Text('SGPA Calculator'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, timeTableRoute);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 100,
                  color: Colors.green,
                ),
                SizedBox(height: 16),
                Text('Timetable'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/maps');
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 100,
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                Text('Map'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, resourceRoute);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.library_books,
                  size: 100,
                  color: Colors.brown,
                ),
                SizedBox(height: 16),
                Text('Course Resource'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/peering');
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  size: 100,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text('Peering'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, notesRoute);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note,
                  size: 100,
                  color: Colors.purple,
                ),
                SizedBox(height: 16),
                Text('Notes'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GpaPage extends StatelessWidget {
  const GpaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Calculator'),
      ),
      body: const Center(
        child: Text('GPA Calculator Page'),
      ),
    );
  }
}

class SgpaPage extends StatelessWidget {
  const SgpaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SGPA Calculator'),
      ),
      body: const Center(
        child: Text('SGPA Calculator Page'),
      ),
    );
  }
}

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: const Center(
        child: Text('Timetable Page'),
      ),
    );
  }
}

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: const Center(
        child: Text('Maps Page'),
      ),
    );
  }
}

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resources/library');
              },
              child: const Text('Library'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resources/computer-lab');
              },
              child: const Text('Computer Lab'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resources/sports-facilities');
              },
              child: const Text('Sports Facilities'),
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: const Center(
        child: Text('Library Page'),
      ),
    );
  }
}

class ComputerLabPage extends StatelessWidget {
  const ComputerLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Lab'),
      ),
      body: const Center(
        child: Text('Computer Lab Page'),
      ),
    );
  }
}

class SportsFacilitiesPage extends StatelessWidget {
  const SportsFacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Facilities'),
      ),
      body: const Center(
        child: Text('Sports Facilities Page'),
      ),
    );
  }
}
