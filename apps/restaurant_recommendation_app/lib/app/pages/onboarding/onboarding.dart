import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_recommendation_app/app/routes/routes.gr.dart';
import 'package:restaurant_recommendation_app/app/widgets/buttons.dart';
import 'package:restaurant_recommendation_app/app/widgets/page_indicator.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/providers/prefs.dart';
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
    kExploreSvgAsset,
    kFoodSvgAsset,
    kEnjoySvgAsset,
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
            left: getProportionateScreenWidth(kSpacingX16),
            bottom: getProportionateScreenHeight(kSpacingX36),
            child: Consumer<PrefsProvider>(
              builder: (_, prefs, __) => PageIndicator(
                pages: _numOfPages,
                currentPage: _currentPage,
                inActiveColor: prefs.isLightTheme
                    ? themeData.disabledColor
                    : themeData.colorScheme.onBackground,
              ),
            ),
          ),
          Positioned(
            right: -getProportionateScreenWidth(kSpacingX12),
            bottom: getProportionateScreenHeight(kSpacingX36),
            child: ButtonPrimary(
              width: kWidth * 0.4,
              themeData: themeData,
              gravity: ButtonIconGravity.END,
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: kHeight * 0.3,
            width: kHeight * 0.3,
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                imageAsset,
                height: kHeight * 0.3,
                width: kHeight * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image(
          //   image: Svg(imageAsset),
          //   height: kHeight,
          //   width: kWidth,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(
            height: getProportionateScreenHeight(kSpacingX48),
          ),
          Text(
            title,
            style: themeData.textTheme.headline5,
          ),
          SizedBox(
            height: getProportionateScreenHeight(kSpacingX16),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kSpacingX24),
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: themeData.textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
