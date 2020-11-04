import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/app/pages/welcome.dart';

class EatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: "Eat",
      home: WelcomePage(),
    );
  }
}
