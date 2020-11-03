import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Text(
          kAppName,
          style: themeData.textTheme.headline3,
        ),
      ),
    );
  }
}
