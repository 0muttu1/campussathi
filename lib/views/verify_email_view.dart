import 'dart:async';
import 'package:campussathi/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';
import 'campussathi_view.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late Timer timer;
  final user = AuthService.firebase().currentUser;

  @override
  void initState() {
    super.initState();
    sendVerificationEmail();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
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
          TextButton(
              onPressed: () {
                sendVerificationEmail();
              },
              child: const Text('Send email verification')),
          TextButton(
              onPressed: () async {
                //await AuthService.firebase().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Restart')),
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    await user!.reload();
    if (user!.emailVerified ?? false) {
      timer.cancel();
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Campussathi();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => false,
      );
    }
  }

  void sendVerificationEmail() async {
    await AuthService.firebase().sendEmailVerification();
  }

  void startTimer() async {
    timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      await checkEmailVerified();
    });
  }
}
