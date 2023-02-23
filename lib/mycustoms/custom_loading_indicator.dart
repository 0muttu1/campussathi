import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final String message;

  const CustomLoadingIndicator({Key? key, this.message = "Loading..."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(
          5, 35, 107, 0.729), // set the background color to white
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.deepOrangeAccent,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            // ignore: prefer_const_constructors
            style: GoogleFonts.pacifico(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
