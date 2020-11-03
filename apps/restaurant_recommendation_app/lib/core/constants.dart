import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'size_config.dart';

/// Defaults
const _kGoogleMapsApiKey = "" /*TODO: Add google maps key here as well*/
    ;

const kRatingStar = Entypo.star;

Widget buildFunctionalityNotAvailablePanel(BuildContext context) => Container(
      height: kSpacingX320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Entypo.progress_empty,
            size: getProportionateScreenHeight(kSpacingX96),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          SizedBox(height: getProportionateScreenHeight(kSpacingX24)),
          Text(
            "Functionality currently not available",
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getProportionateScreenHeight(kSpacingX8)),
          Text(
            "Grab a beverage and check back later!",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

Future getMapStyle({bool isLightTheme = false}) async =>
    await rootBundle.loadString(
        isLightTheme ? "assets/map_style.json" : "assets/dark_map_style.json");

/// Dimensions
const double kSpacingNone = 0.0;
const double kSpacingX2 = 2.0;
const double kSpacingX4 = 4.0;
const double kSpacingX8 = 8.0;
const double kSpacingX12 = 12.0;
const double kSpacingX16 = 16.0;
const double kSpacingX20 = 20.0;
const double kSpacingX24 = 24.0;
const double kSpacingX36 = 36.0;
const double kSpacingX42 = 42.0;
const double kSpacingX48 = 48.0;
const double kSpacingX56 = 56.0;
const double kSpacingX64 = 64.0;
const double kSpacingX72 = 72.0;
const double kSpacingX84 = 84.0;
const double kSpacingX96 = 96.0;
const double kSpacingX100 = 100.0;
const double kSpacingX120 = 120.0;
const double kSpacingX160 = 160.0;
const double kSpacingX200 = 200.0;
const double kSpacingX230 = 230.0;
const double kSpacingX250 = 250.0;
const double kSpacingX300 = 300.0;
const double kSpacingX320 = 320.0;
const double kSpacingX360 = 360.0;
const double kOpacityX14 = 0.14;
const double kOpacityX35 = 0.35;
const double kOpacityX50 = 0.5;
const double kOpacityX70 = 0.7;
const double kOpacityX90 = 0.9;
const double kEmphasisLow = 0.38;
const double kEmphasisMedium = 0.67;
const double kEmphasisHigh = 0.9;

/// App
const kAppName = "Popina";
const kAppNameShort = "Popina";
const kAppSlogan =
    "Official mobile application for the Exhibition Assemblies of God Church";
const kAppVersion = "v0.0.1";
const kArtisanReviewHelpDialogContent =
    "Sensitive data (like email addresses, phone numbers, user ids etc) will not be made public to customers on this platform.\nYour ratings are also based on the accumulated reviews by customers you have served over the last 6 months";
const kPasswordHint =
    "Your password must be 8 or more characters long & must container a mix of upper & lower case letters, numbers & symbols";
const kSignOutText =
    "Signing out will set you offline until you sign in again. You may not be able to send/receive requests. Do you wish to continue?";
const kStaffString = "Staff";
const kFunctionalityUnavailable =
    "Functionality currently not available. Grab a beverage and check back later!";
const kMemberString = "Member";
const kLogoAsset = "assets/images/banner.webp";
const kLogoDarkAsset = "assets/images/banner.webp";
const kNotificationAsset = "assets/svgs/notifications.svg";
const kLocationAsset = "assets/svgs/location.svg";
const kLoremText =
    "Ipsum suspendisse ultrices gravida dictum fusce ut placerat. Cursus sit amet dictum sit amet. Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique";

const kNotificationHelperText =
    "To receive updates on new restaurants around you, allow the app to send you notifications.\n\nBy default, sensitive information such as appointment, email addresses and phone numbers will be hidden from notifications while the device is locked.\n\nYou will have the option to change these privacy settings at anytime";
const kLocationHelperText =
    "Allow the app to detect your live location.\n\nYour live location will be hidden from notifications while the device is locked.\n\nYou will have the option to change these privacy settings at anytime";

/// Durations
const kScaleDuration = const Duration(milliseconds: 350);
const kSheetDuration = const Duration(milliseconds: 850);
const kTestDuration = const Duration(milliseconds: 1500);

/// Others
const kScrollPhysics = const BouncingScrollPhysics();
const kSlideOffset = 50.0;

/// Colors
const kGreenColor = Color(0xFF009688);
const kWhiteColor = Colors.white;
const kBlackColor = Color(0xFF040505);
const kAmberColor = Colors.amber;
const kChatBackgroundLight = Color(0xFFF5F5F5);
const kChatBackgroundDark = Color(0xFF222222);
const kTransparent = Colors.transparent;
const kPlaceholderColor = Color(0x70000000);
const kDisabledColor = Color(0xFFD8D8D8);
const kFieldColor = Color(0xFFe0e0e0);

const kPrimaryColor = Color(0xFF1e2a78);
const kSecondaryLightColor = Color(0xFF1e2a78);
const kErrorLightColor = Color(0xffE91E63);
const kAccentLightColor = kSecondaryLightColor;
const kBackgroundLightColor = kWhiteColor;
const kCardLightColor = kFieldColor;

const kPrimaryColorDark = Color(0xFF28c7fa);
const kSecondaryDarkColor = Color(0xFF28c7fa);
const kErrorDarkColor = Color(0xffEC407A);
const kAccentDarkColor = kWhiteColor;
const kBackgroundDarkColor = Color(0xFF151515);
const kCardDarkColor = Color(0xFF272727);
const kSurfaceDarkColor = Color(0xFF222225);

/// Icon Colors
const kAccentIconLightColor = kPrimaryColor;
const kPrimaryIconLightColor = kPrimaryColor;

const kAccentIconDarkColor = kWhiteColor;
const kPrimaryIconDarkColor = kWhiteColor;

/// Text Colors
const kBodyTextColorLight = Color(0xFF232323);
const kTitleTextColorLight = Color(0xFF131313);
const kUnselectedLabelColorLight = Color(0xFF7C7C7C);

const kBodyTextColorDark = Color(0xFFDEDEDE);
const kUnselectedLabelColorDark = Color(0xFFDEDEDE);
const kTitleTextColorDark = Color(0xFFDEDEDE);

const kShadowColor = Color(0xFFDEDEDE);
const kShadowDarkColor = Color(0xFF7C7C7C);
