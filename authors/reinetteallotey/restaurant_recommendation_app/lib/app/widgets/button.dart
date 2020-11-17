import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';

/// Creates a button with a colored background
class ButtonPrimary extends StatelessWidget {
  // Fields to be overridden by the calling class
  final String text;
  final Function() onTap;
  final Color color;

  // Constructor for the button primary class
  const ButtonPrimary({
    @required this.text,
    @required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    // This allows user tap gestures to be detected
    // You can also use InkWell
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kSpacingX16,
          horizontal: kSpacingX24,
        ),
        // adds padding on all sides
        decoration: BoxDecoration(
          color: color ?? kTheme.colorScheme.secondary,
          // background color of button
          borderRadius: BorderRadius.circular(kSpacingX24),
        ),
        child: Text(
          text,
          style: kTheme.textTheme.button.copyWith(
            color: kTheme.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {
  // Fields to be overridden by the calling class
  final String text;
  final Function() onTap;
  final Color color;

  // Constructor for the button primary class
  const ButtonOutlined({
    @required this.text,
    @required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    // This allows user tap gestures to be detected
    // You can also use InkWell
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kSpacingX16,
          horizontal: kSpacingX24,
        ),
        // adds padding on all sides
        decoration: BoxDecoration(
          // color of button's outlined border
          border: Border.all(
            color: color ?? kTheme.colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(kSpacingX24),
        ),
        child: Text(
          text,
          style: kTheme.textTheme.button.copyWith(
            color: kTheme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
