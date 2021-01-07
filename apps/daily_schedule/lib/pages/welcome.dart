import 'package:flutter/material.dart';
import 'package:daily_schedule/shared/constants.dart';

import 'package:daily_schedule/pages/home.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    final kWidth = displaySize.width;
    final kHeight = displaySize.height;
    final kTheme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              kImage,
              height: kHeight * 0.4,
              width: kWidth,
            ),
            SizedBox(height: kHeight * 0.05),
            Text(
              "Welcome to my Daily Schedule",
              style: kTheme.textTheme.headline4,
            ),
            SizedBox(height: 24),
            Text(
              "I give you a Quick reminder on your daily activities",
              textAlign: TextAlign.start,
              style: kTheme.textTheme.bodyText1,
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: kTheme.colorScheme.primaryVariant,
                  ),
                  child: Text(
                    "Get Started",
                    style: kTheme.textTheme.button
                        .copyWith(color: kTheme.colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
