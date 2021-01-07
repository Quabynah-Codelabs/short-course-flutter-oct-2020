import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/home.dart';
import 'package:note_it/theme.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      home: HomePage(),
    );
  }
}
