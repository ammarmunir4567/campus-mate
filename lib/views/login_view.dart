import 'package:flutter/material.dart';
import '/constants/routes.dart';
import '/services/auth/auth_exceptions.dart';
import '/services/auth/auth_service.dart';
import '/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(94, 115, 255, 1),
                Color.fromRGBO(93, 41, 142, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'img/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Campus Mate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    await AuthService.firebase().logIn(
                      email: email,
                      password: password,
                    );
                    final user = AuthService.firebase().currentUser;
                    if (user?.isEmailVerified ?? false) {
                      // user's email is verified
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        mainMenuRoute,
                        (route) => false,
                      );
                    } else {
                      // user's email is NOT verified
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyEmailRoute,
                        (route) => false,
                      );
                    }
                  } on UserNotFoundAuthException {
                    await showErrorDialog(
                      context,
                      'User not found',
                    );
                  } on WrongPasswordAuthException {
                    await showErrorDialog(
                      context,
                      'Wrong credentials',
                    );
                  } on GenericAuthException {
                    await showErrorDialog(
                      context,
                      'Authentication error',
                    );
                  }
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 96, 189, 14)),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    registerRoute,
                    (route) => false,
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Not registered yet? Register here!'),
              )
            ],
          ),
        ));
  }
}
