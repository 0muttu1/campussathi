import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enums/menu_action.dart';
import '../mycustoms/custom_message_buttons.dart';
import '../mycustoms/custom_pop_menu_item.dart';
import '../services/auth/auth_service.dart';
import 'decorated_login_page.dart';

class Campussathi extends StatefulWidget {
  const Campussathi({Key? key}) : super(key: key);

  @override
  State<Campussathi> createState() => _CampussathiState();
}

class _CampussathiState extends State<Campussathi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(5, 35, 107, 0.722),
        title: Text(
          'Campussathi',
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          PopupMenuButton<MenuAction>(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(184, 24, 1, 53),
            ),
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogoutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LoginPage();
                        },
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
              return [
                const CustomPopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  backgroundColor: Color.fromARGB(
                      255, 78, 16, 12), // Set background color here
                  borderRadius: 12, // Set border radius here
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Color.fromRGBO(5, 35, 107, 1),
                        fontSize: 16.0, // Set font size here
                        fontWeight: FontWeight.bold, // Set font weight here
                      ),
                    ),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MoreButtons(
                  text: 'Classes',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Library',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Notes',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'MessMenu',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Cafe',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Hostel',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'MedicalUnit',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Fitnesscenter',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'GateAccess',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                const SizedBox(height: 10),
                MoreButtons(
                  text: 'Events',
                  onPressed: () {
                    // Add your logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context) async {
  // Show a custom animated dialog with a blurred background image
  return showDialog<bool>(
    context: context,
    builder: (context) {
      // Create a custom dialog with a nice design
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Show an icon in the header to illustrate the sign-out action
              const Icon(Icons.logout, size: 40.0, color: Colors.red),
              const SizedBox(height: 20.0),
              const Text(
                'Sign out',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              // Add a message to confirm the sign-out action
              const Text('Are you sure you want to sign out?'),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Customize the Cancel button with a nice color
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  // Customize the Log out button with a nice color
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Log out',
                        style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) => value ?? false);
}
