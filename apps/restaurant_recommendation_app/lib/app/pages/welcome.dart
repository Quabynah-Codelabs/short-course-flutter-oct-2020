// Added the material package file
import 'package:flutter/material.dart';

// Initial page of the application
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

// State manager of the WelcomePage above
class  _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Popina"),
        ),
      ),
    );
  }
}