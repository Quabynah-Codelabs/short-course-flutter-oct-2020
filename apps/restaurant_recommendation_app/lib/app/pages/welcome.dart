// Added the material package file
import 'package:flutter/material.dart';

// Initial page of the application
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

// State manager of the WelcomePage above
class _WelcomePageState extends State<WelcomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // Stack => Used to place one child over the other
      child: Stack(
        children: [
          // Contains background image
          Container(
            child: Image.asset("assets/images/food.jpg"),
          ),

          // Contains title & description
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            // Arranges children in a vertical order
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Popina",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontSize: 48,
                        ),
                  ),
                  Text("A sample restaurant recommendation application"),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 64,
            right: 0,
            // Arranges children in a vertical order
            child: SafeArea(
              child: Column(
                children: [
                  RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xFF123456),
                    child: Text("Sign in with Google"),
                    onPressed: pressButton,
                  ),
                  // Used to create spacing between widgets
                  SizedBox(
                    height: 8,
                  ),
                  FlatButton(
                    child: Text("Skip for now"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void pressButton() {

  }
}
