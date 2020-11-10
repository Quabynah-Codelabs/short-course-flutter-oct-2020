import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';

/// Home page of the application
/// Shows a list of all restaurants based on user filters
/// Has navigation options for profile tab & favorites tab
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Center(
          child: Text(
            "Home page",
            style: kTheme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
