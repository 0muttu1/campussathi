import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final String message;

  const CustomLoadingIndicator({Key? key, this.message = "Loading..."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(
          5, 35, 107, 0.724), // set the background color to white
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            // ignore: prefer_const_constructors
            style: const TextStyle(
              color: Color.fromRGBO(129, 0, 49, 0.61),
              fontWeight: FontWeight.bold,
              fontSize: 22,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
