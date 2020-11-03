import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/app/pages/onboarding/welcome.dart';
import 'package:restaurant_recommendation_app/core/theme.dart';

/// Main Flutter Application Widget 
class PopinaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      home: WelcomePage(),
    );
  }
}
