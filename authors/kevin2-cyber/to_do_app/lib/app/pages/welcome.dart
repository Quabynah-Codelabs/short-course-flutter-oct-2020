// TODO Implement this library.
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_app/core/size_config.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
// State manager of the WelcomePage above
class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // gives us the current theme of the application
    final kTheme = Theme.of(context);
    return Scaffold(
        body: Container(
          // Stack => Used to place one child over the other
          child: Stack(
            children: [
              // Contains background image
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/ultra.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: kTheme.scaffoldBackgroundColor.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}
