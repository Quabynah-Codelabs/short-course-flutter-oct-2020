import 'package:flutter/material.dart'; // absolute path import

import 'pages/welcome.dart'; // relative path import

class PopinaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Popina",
      theme: ThemeData(),
      home: WelcomePage(),
      darkTheme: ThemeData.dark(),
    );
  }
}
