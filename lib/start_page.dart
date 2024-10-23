import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set a timer to navigate to the Main Page after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()), // Navigates to MainPage in main.dart
      );
    });

    // Scaffold for StartPage
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4), // Background color f4f4f4
      body: Center(
        child: Image.asset(
          'img/logo.png', // Display logo.png from img folder
          width: 200, // Adjust the size if needed
          height: 200,
        ),
      ),
    );
  }
}


