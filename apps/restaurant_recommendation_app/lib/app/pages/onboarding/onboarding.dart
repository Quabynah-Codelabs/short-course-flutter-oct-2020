import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/app/routes/routes.gr.dart';
import 'package:restaurant_recommendation_app/app/widgets/buttons.dart';
import 'package:restaurant_recommendation_app/app/widgets/page_indicator.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _numOfPages = 3;
  int _currentPage = 0;
  final _pageController = PageController();
  final _titles = <String>[
    "Explore",
    "Book",
    "Enjoy",
  ];
  final _images = <String>[
    kSplashBackgroundAsset,
    kSplashBackgroundAsset,
    kSplashBackgroundAsset,
  ];

  @override
  Widget build(BuildContext context) {
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
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (_, index) {
                return _OnboardingPageItem(
                  title: _titles[index],
                  imageAsset: _images[index],
                );
              },
              itemCount: _numOfPages,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          Positioned(
            top: kHeight * 0.4,
            width: kWidth,
            bottom: kSpacingNone,
            child: PageIndicator(
              pages: _numOfPages,
              currentPage: _currentPage,
              activeColor: themeData.colorScheme.onBackground,
            ),
          ),
          Positioned(
            right: -getProportionateScreenWidth(kSpacingX12),
            bottom: getProportionateScreenHeight(kSpacingX36),
            child: ButtonPrimary(
              width: kWidth * 0.4,
              themeData: themeData,
              gravity: ButtonIconGravity.END,
              color: themeData.scaffoldBackgroundColor,
              textColor: themeData.colorScheme.onBackground,
              icon: Icons.arrow_right_alt_outlined,
              onTap: () => context.navigator.popAndPush(Routes.homePage),
              label: "Explore",
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPageItem extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String description;

  const _OnboardingPageItem({
    Key key,
    @required this.title,
    @required this.imageAsset,
    this.description = kLoremText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kHeight = size.height;
    final kWidth = size.width;
    final themeData = Theme.of(context);
    return Container(
      height: kHeight,
      width: kWidth,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imageAsset,
            height: kHeight,
            width: kWidth,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: getProportionateScreenHeight(kSpacingX72),
            bottom: kSpacingNone,
            left: kWidth * 0.15,
            right: kWidth * 0.15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: themeData.textTheme.headline5
                      .copyWith(color: kWhiteColor),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(kSpacingX16),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.subtitle1
                      .copyWith(color: kWhiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
