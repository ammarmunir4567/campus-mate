import 'package:flutter/material.dart';
import 'package:newapp/views/GPA.dart';
import 'package:newapp/views/SGPA.dart';
import 'package:newapp/views/Timetable.dart';
import 'package:newapp/views/main_menu.dart';
import 'package:newapp/views/resource.dart';
import '/constants/routes.dart';
import '/services/auth/auth_service.dart';
import '/views/login_view.dart';
import '/views/notes/create_update_note_view.dart';
import '/views/notes/notes_view.dart';
import '/views/register_view.dart';
import '/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
        mainMenuRoute: (context) => const MainMenu(),
        sgpaRoute: (context) => const MyAppSGPA(),
        gpaRoute: (context) => const MyAppGPA(),
        timeTableRoute: (context) => const ExcelScreen(),
        resourceRoute: (context) => const resource(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified == true) {
                return const MainMenu();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
