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
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(5, 35, 107, 0.722),
        title: const Text('Verify Email'),
      ),
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromRGBO(2, 99, 118, 0.616),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            'Verify Your Email Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'We have sent a verification email to your email address. Please check your inbox and click on the verification link to activate your account.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              sendVerificationEmail();
            },
            child: const Text('Resend verification email'),
          ),
          const SizedBox(height: 26),
          TextButton(
            onPressed: () async {
              //await AuthService.firebase().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text('Verified? Go back to the login page'),
          ),
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
    timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await checkEmailVerified();
    });
  }
}
