import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_recommendation_app/app/routes/routes.gr.dart' as gr;
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/providers/prefs.dart';
import 'package:restaurant_recommendation_app/core/theme.dart';

/// Main Flutter Application Widget
class PopinaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PrefsProvider.instance),
      ],
      child: Consumer<PrefsProvider>(
        builder: (_, prefs, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppName,
          themeMode: prefs.isSystemTheme
              ? ThemeMode.system
              : prefs.isLightTheme
                  ? ThemeMode.light
                  : ThemeMode.dark,
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          builder: ExtendedNavigator<gr.Router>(
            router: gr.Router(),
            guards: [],
          ),
        ),
      ),
    );
  }
}
