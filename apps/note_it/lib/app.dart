import 'package:flutter/material.dart';
import 'package:note_it/home.dart';

import 'constants.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: HomePage(),
    );
  }
}
