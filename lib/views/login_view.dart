// import 'package:campussathi/views/campussathi_view.dart';
// import 'package:campussathi/views/register_view.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../services/auth/auth_exceptions.dart';
// import '../services/auth/auth_service.dart';
// import '../utilities/show_error_dialog.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//     ],
//   );

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   void _handleGoogleSignIn() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         final User? user = userCredential.user;

//         if (user != null) {
//           if (user.emailVerified) {
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return const Campussathi();
//                 },
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: child,
//                   );
//                 },
//               ),
//             );
//           } else {
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return const RegisterView();
//                 },
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: child,
//                   );
//                 },
//               ),
//             );
//           }
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e.code);
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _handleLogin() async {
//     final email = _email.text;
//     final password = _password.text;
//     try {
//       await AuthService.firebase().logIn(
//         email: email,
//         password: password,
//       );

//       final user = AuthService.firebase().currentUser;
//           ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.red[600],
//             onPrimary: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           onPressed: () async {
//             try {
//               final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//               if (googleUser != null) {
//                 final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//                 final AuthCredential credential = GoogleAuthProvider.credential(
//                   accessToken: googleAuth.accessToken,
//                   idToken: googleAuth.idToken,
//                 );

//                 await AuthService.firebase().logInWithCredential(credential);

//                 final user = AuthService.firebase().currentUser;
//                 if (user?.isEmailVerified ?? false) {
//                   Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       pageBuilder: (context, animation, secondaryAnimation) {
//                         return const Campussathi();
//                       },
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         return FadeTransition(
//                           opacity: animation,
//                           child: child,
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       pageBuilder: (context, animation, secondaryAnimation) {
//                         return const RegisterView();
//                       },
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         return FadeTransition(
//                           opacity: animation,
//                           child: child,
//                         );
//                       },
//                     ),
//                   );
//                 }
//               }
//             } on GenericAuthException {
//               await showErrorDialog(
//                 context,
//                 'Authentication failed',
//               );
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 10,
//             ),
//             child: Text(
//               'Sign in with Google',
//               style: GoogleFonts.lato(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         );
//         const SizedBox(
//           height: 10,
//           width: 10,
//         );
//     }
//   }
  
// }