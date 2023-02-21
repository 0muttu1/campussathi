import 'package:campussathi/constants/routes.dart';
import 'package:campussathi/services/auth/auth_service.dart';
import 'package:campussathi/views/campussathi_view.dart';
import 'package:campussathi/views/decorated_login_page.dart';
//import 'package:campussathi/views/login_view.dart';
import 'package:campussathi/views/register_view.dart';
import 'package:campussathi/views/verify_email_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Campussathi',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomePage(),
      routes: {
        //loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        campussathiRoute: (context) => const Campussathi(),
        verifyemailroute: (context) => const VerifyEmailView(),
        loginRouteDecorated: (context) => const LoginPage(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    {}
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;

            if (user != null) {
              if (user.isEmailVerified) {
                return const Campussathi();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginPage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
