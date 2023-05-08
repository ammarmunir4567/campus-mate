// import 'package:flutter/material.dart';
// import '/constants/routes.dart';
// import '/services/auth/auth_service.dart';

// class VerifyEmailView extends StatefulWidget {
//   const VerifyEmailView({Key? key}) : super(key: key);

//   @override
//   _VerifyEmailViewState createState() => _VerifyEmailViewState();
// }

// class _VerifyEmailViewState extends State<VerifyEmailView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Verify email'),
//       ),
//       body: Column(
//         children: [
//           const Text(
//               "We've sent you an email verification. Please open it to verify your account."),
//           const Text(
//               "If you haven't received a verification email yet, press the button below"),
//           TextButton(
//             onPressed: () async {
//               await AuthService.firebase().sendEmailVerification();
//             },
//             child: const Text('Send email verification'),
//           ),
//           TextButton(
//             onPressed: () async {
//               await AuthService.firebase().logOut();
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                 registerRoute,
//                 (route) => false,
//               );
//             },
//             child: const Text('Restart'),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '/constants/routes.dart';
import '/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "We've sent you an email verification. Please open it to verify your account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "If you haven't received a verification email yet, press the button below.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Resend Verification Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: Text(
                'Restart',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
