import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:restaurant_recommendation_app/app/routes/routes.gr.dart';
import 'package:restaurant_recommendation_app/app/widgets/buttons.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final size = MediaQuery.of(context).size;
    final kHeight = size.height;
    final kWidth = size.width;

    final themeData = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: kHeight,
            width: kWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(kSplashBackgroundAsset),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: themeData.scaffoldBackgroundColor
                        .withOpacity(kSpacingNone)),
              ),
            ),
          ),
          Positioned(
            top: kHeight * 0.25,
            left: kSpacingNone,
            right: kSpacingNone,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  kAppName,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headline3
                      .copyWith(color: kWhiteColor),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(kSpacingX16),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(kSpacingX96),
                  ),
                  child: Text(
                    kAppSlogan,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText2
                        .copyWith(color: kWhiteColor),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: kHeight * 0.02,
            left: kSpacingNone,
            right: kSpacingNone,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonPrimary(
                    width: kWidth * 0.6,
                    themeData: themeData,
                    color: themeData.scaffoldBackgroundColor,
                    textColor: themeData.colorScheme.onBackground,
                    onTap: () {
                      /*TODO: Perform Google sign in*/
                    },
                    label: "Sign in with Google",
                    icon: AntDesign.google,
                    gravity: ButtonIconGravity.START,
                    enabled: !_isLoading,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(kSpacingX8),
                  ),
                  ButtonClear(
                    textColor: kBlackColor,
                    themeData: themeData,
                    enabled: !_isLoading,
                    onTap: () =>
                        context.navigator.popAndPush(Routes.onboardingPage),
                    label: "Skip for now",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
