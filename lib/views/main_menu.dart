import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/views/SGPA.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';
import 'package:url_launcher/url_launcher.dart';
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SGPA()));
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
          TextButton(
            onPressed: () {
              _launchURL;
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

_launchURL() async {
  const url =
      'https://drive.google.com/drive/u/0/folders/1-xpPH-aPjhV2BLGp2pdk1inPcwiEpM-c';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
