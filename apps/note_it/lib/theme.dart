import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';

/// light theme
final kLightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  accentColor: kAccentColor,
  scaffoldBackgroundColor: kBackgroundColor,
  backgroundColor: kBackgroundColor,
  colorScheme: ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kAccentColor,
    background: kBackgroundColor,
  ),
);

/// dark theme
final kDarkTheme = ThemeData.dark().copyWith();
