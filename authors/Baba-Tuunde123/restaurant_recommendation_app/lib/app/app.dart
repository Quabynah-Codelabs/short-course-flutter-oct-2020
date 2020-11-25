import 'package:flutter/material.dart';
import 'pages/welcome.dart';

class BabaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Baba",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: WelcomePage(),
    );
  }
}
