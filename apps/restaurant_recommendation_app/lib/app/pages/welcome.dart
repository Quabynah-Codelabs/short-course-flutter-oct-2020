// Added the material package file
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/app/widgets/button.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/data/repositories/auth.dart';
import 'package:restaurant_recommendation_app/data/repositories/prefs.dart';

import 'home.dart';

// Initial page of the application
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

// State manager of the WelcomePage above
class _WelcomePageState extends State<WelcomePage> {
  bool _isLoggedIn = false;
  final _authService = AuthServiceImpl();
  final _prefsService = PreferenceServiceImpl();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _isLoggedIn = _authService.isLoggedIn;
      print("Current user is logged in? => $_isLoggedIn");
      setState(() {});

      // _prefsService.onUserIdChange().listen((userId) async {
      //   _isLoggedIn = userId != null && userId.isNotEmpty;
      //   setState(() {});
      //   print("Current user is logged in? => $_isLoggedIn");
      // });
      //
      // Future.delayed(Duration(seconds: 3)).then((value) {
      //   _prefsService.saveUserId(userId: null);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig here. This is only done once
    SizeConfig().init(context);

    // has data on the display of your application's device
    // var mediaQuery = MediaQuery.of(context);

    // gets the size of your current display
    // var size = mediaQuery.size;

    // get width & height
    // final kWidth = size.width;
    // final kHeight = size.height;

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
                image: ExactAssetImage("assets/images/food.jpg"),
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

          // Contains title & description
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            // Arranges children in a vertical order
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Popina",
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontSize: 48,
                        ),
                  ),
                  Text("A sample restaurant recommendation application"),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 64,
            right: 0,
            // Arranges children in a vertical order
            child: SafeArea(
              child: _isLoggedIn
                  ? ButtonPrimary(
                    text: "Explore",
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => HomePage(),
                          ),
                          (route) => route is HomePage);
                    },
                  )
                  : Column(
                      children: [
                        ButtonOutlined(
                          text: "Sign in with Google",
                          // color: kTheme.colorScheme.error,
                          onTap: () async {
                            _isLoggedIn = await _authService.googleSignIn();
                            setState(() {});
                          },
                        ),
                        // Used to create spacing between widgets
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          child: Text("Skip for now"),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => HomePage(),
                                ),
                                (route) => route is HomePage);
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    ));
  }
}
