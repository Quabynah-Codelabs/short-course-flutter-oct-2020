import 'package:flutter/material.dart'; // absolute path import
import 'package:restaurant_recommendation_app/app/theme/theme.dart';

import 'pages/welcome.dart'; // relative path import

// Root widget of the application
// Contains either a MaterialApp or CupertinoApp
class PopinaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Popina",
      theme: themeData(context),
      // themeMode: ThemeMode.system,
      home: WelcomePage(),
      darkTheme: darkThemeData(context),
    );
  }
}
