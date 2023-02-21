import 'dart:async';

import 'package:campussathi/constants/routes.dart';
import 'package:campussathi/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'campussathi_view.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void intiState() {
    user = auth.currentUser;
    user?.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text("We've sent a verification link to your email address."),
          const Text("If not recieved alerady then press the button below"),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text('Send email verification')),
          // TextButton(
          //     onPressed: () async {
          //       await AuthService.firebase().logOut();
          //       Navigator.of(context)
          //           .pushNamedAndRemoveUntil(registerRoute, (route) => false);
          //     },
          //     child: const Text('Restart')),
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user?.reload();
    if (user?.emailVerified ?? false) {
      timer?.cancel();
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil(campussathiRoute, (route) => false);
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Campussathi();
          }, //let this be there for the time being;
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }
}
