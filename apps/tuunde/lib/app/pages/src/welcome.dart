import 'package:flutter/material.dart';
import 'package:tuunde/app/pages/pages.dart';
import 'package:tuunde/shared/shared.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    /// get instance of current theme
    var kTheme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// background image -> fills the whole page
          Positioned.fill(
            child: Image.asset(
              kWelcomeImageAsset,
            ),
          ),

          /// bottom content
          Positioned(
            bottom: 16,
            left: 8,
            right: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to $kAppName',
                  style: kTheme.textTheme.headline5.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),

                /// button with background color and white text
                InkWell(
                  /// navigate to [HomePage] and exit all previous pages in the navigation stack
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false,
                  ),
                  child: Container(
                    width: 300,
                    height: 56,
                    decoration: BoxDecoration(
                      color: kTheme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Get started',
                      style: kTheme.textTheme.button.copyWith(
                        color: kTheme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
