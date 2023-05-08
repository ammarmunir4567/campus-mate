// import 'package:flutter/material.dart';
// import '/constants/routes.dart';
// import '/services/auth/auth_exceptions.dart';
// import '/services/auth/auth_service.dart';
// import '/utilities/dialogs/error_dialog.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({Key? key}) : super(key: key);

//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _email,
//             enableSuggestions: false,
//             autocorrect: false,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               hintText: 'Enter your email here',
//             ),
//           ),
//           TextField(
//             controller: _password,
//             obscureText: true,
//             enableSuggestions: false,
//             autocorrect: false,
//             decoration: const InputDecoration(
//               hintText: 'Enter your password here',
//             ),
//           ),
//           TextButton(
//             onPressed: () async {
//               final email = _email.text;
//               final password = _password.text;
//               try {
//                 await AuthService.firebase().createUser(
//                   email: email,
//                   password: password,
//                 );
//                 AuthService.firebase().sendEmailVerification();
//                 Navigator.of(context).pushNamed(verifyEmailRoute);
//               } on WeakPasswordAuthException {
//                 await showErrorDialog(
//                   context,
//                   'Weak password',
//                 );
//               } on EmailAlreadyInUseAuthException {
//                 await showErrorDialog(
//                   context,
//                   'Email is already in use',
//                 );
//               } on InvalidEmailAuthException {
//                 await showErrorDialog(
//                   context,
//                   'This is an invalid email address',
//                 );
//               } on GenericAuthException {
//                 await showErrorDialog(
//                   context,
//                   'Failed to register',
//                 );
//               }
//             },
//             child: const Text('Register'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                 loginRoute,
//                 (route) => false,
//               );
//             },
//             child: const Text('Already registered? Login here!'),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:newapp/constants/routes.dart';

import '../utilities/dialogs/error_dialog.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;
  late final TextEditingController? _password2Controller;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _password2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    _password2Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Color.fromARGB(159, 19, 42, 143),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(43, 63, 128, 1),
              Color.fromRGBO(94, 115, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
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
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
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
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _password2Controller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController?.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController!.text;
                final password = _passwordController!.text;
                final pass2 = _password2Controller!.text;

                if (password != pass2) {
                  showErrorDialog(context, 'Password does not match');
                } else {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);

                    //devtool.log(userCredential.toString());
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      await showErrorDialog(
                        context,
                        'Weak Password',
                      );
                    } else if (e.code == 'email-already-in-use') {
                      await showErrorDialog(
                        context,
                        'Email already in use',
                      );
                    } else if (e.code == 'invalid-email') {
                      await showErrorDialog(
                        context,
                        'invalid email',
                      );
                    } else {
                      await showErrorDialog(
                        context,
                        'Error : ${e.code}',
                      );
                    }
                  } catch (e) {
                    await showErrorDialog(
                      context,
                      e.toString(),
                    );
                  }
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Go back to login')),
          ],
        ),
      ),
    );
  }
}
