import 'package:campussathi/constants/routes.dart';
import 'package:campussathi/services/auth/auth_exceptions.dart';
import 'package:campussathi/services/auth/auth_service.dart';
import 'package:campussathi/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    //_username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    //_username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Register',
      style : GoogleFonts.pacifico(),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[800],),
      body: Column(
        children: [
          //create text fields using TextField(),
          //TextField(
          //controls: _username,),
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email address',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Create password',
            ),
          ),
          TextButton(
            onPressed: () async {
              //using the test editng as a proxy to access the testfield/on pressed it should connedt to fire base so wait for some time ..async
              final email = _email.text;
              final password = _password.text;

              //creating a user with the email and password
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                AuthService.firebase().sendEmailVerification();
              } on WeakPasswordAuthException {
                await showErrorDialog(
                  context,
                  'Weak password',
                );
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(
                  context,
                  'Email already in use',
                );
              } on InvalidEmailAuthException {
                await showErrorDialog(
                  context,
                  'Invalid email',
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  'Failed to register user',
                );
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Already registered? Login here'))
        ],
      ),
    );
  }
}
