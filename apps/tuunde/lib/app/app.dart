import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuunde/app/pages/pages.dart';
import 'package:tuunde/shared/shared.dart';

class TuundeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        accentColor: kPrimaryColor,
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kPrimaryColor,
          background: kBackgroundColor,
          onPrimary: kBackgroundColor,
          onSecondary: kBackgroundColor,
          onError: kBackgroundColor,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: WelcomePage(),
    );
  }
}
