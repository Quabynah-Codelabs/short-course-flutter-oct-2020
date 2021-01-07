import 'package:flutter/material.dart';
import 'package:daily_schedule/pages/welcome.dart';
import 'package:daily_schedule/shared/constants.dart';

class DailySchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: kFontTheme,
        colorScheme: ColorScheme(
          primary: kPrimaryColor,
          background: kBackgroundColor,
          brightness: Brightness.light,
          error: kErrorColor,
          onBackground: kBlack,
          onError: kWhite,
          onPrimary: kWhite,
          onSecondary: kWhite,
          onSurface: kBlack,
          secondary: kSecondaryColor,
          primaryVariant: kPrimaryVariantColor,
          secondaryVariant: kSecondaryVariantColor,
          surface: kWhite,
        ),
        appBarTheme: AppBarTheme(
          textTheme: kFontTheme.copyWith(
            headline6: kFontTheme.headline6.copyWith(color: kBlack),
          ),
          elevation: 0,
          centerTitle: true,
          color: kBackgroundColor,
        ),
      ),
      home: WelcomePage(),
    );
  }
}
