import 'package:campussathi/services/auth/auth_service.dart';
import 'package:campussathi/views/decorated_login_page.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';
import '../enums/menu_action.dart';

class Campussathi extends StatefulWidget {
  const Campussathi({super.key});

  @override
  State<Campussathi> createState() => _CampussathiState();
}

class _CampussathiState extends State<Campussathi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campussathi'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogoutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   loginRoute,
                    //   (route) => false,
                    // );
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LoginPage();
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
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          )
        ],
      ),
      body: const Text(
          'Welcome to campussathi.. Thats it for now further updates will have more added features'),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
