import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _showWhitePage = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showWhitePage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showWhitePage) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Text('홈으로 고!'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Image.asset(
          'img/logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}