import 'package:campussathi/views/campussathi_view.dart';
import 'package:campussathi/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';
import '../utilities/show_error_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      appBar: AppBar(
        title: Text(
          'Campussathi',
          style: GoogleFonts.pacifico(),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(5, 35, 107, 0.724),
        //leading: const Icon(Icons.person),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 60,
              color: Color.fromARGB(255, 78, 53, 176),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.lato(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _password,
                enableSuggestions: false,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.lato(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromRGBO(5, 35, 107, 0.5), // foreground color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 25), // button padding
              ),
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
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   campussathiRoute,
                    //   (route) => false,
                    // );
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const Campussathi();
                        }, //let this be there for the time being;
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  } else {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   verifyemailroute,
                    //   (route) => false,
                    // );

                    //Navigator.pushNamed(context, registerRoute);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const RegisterView();
                        }, //let this be there for the time being;
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                } on UserNotFoundAuthException {
                  await showErrorDialog(
                    context,
                    'user not found',
                  );
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                    context,
                    'wrong password',
                  );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Authentication failed',
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    //horizontal: 16,
                    //vertical: 10,   //avoided to get smooth transition
                    ),
                child: Text(
                  'Login',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromRGBO(142, 5, 5, 0.7), // foreground color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 25), // button padding
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return RegisterView();
                    }, //let this be there for the time being;
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Need an account? sign up'),
            )
          ],
        ),
      ),
    );
  }
}
