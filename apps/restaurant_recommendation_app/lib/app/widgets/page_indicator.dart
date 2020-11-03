import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';

/// Page indicator
class PageIndicator extends StatefulWidget {
  final int pages; // Number of pages
  final int currentPage;
  final Color activeColor;
  final Color inActiveColor;

  const PageIndicator(
      {@required this.pages,
      @required this.currentPage,
      this.activeColor,
      this.inActiveColor});

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages; i++) {
      list.add(i == widget.currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) => AnimatedContainer(
        duration: kScaleDuration,
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kSpacingX4),
        ),
        height: getProportionateScreenHeight(kSpacingX4),
        width: isActive
            ? getProportionateScreenWidth(kSpacingX16)
            : getProportionateScreenWidth(kSpacingX8),
        decoration: BoxDecoration(
          color: isActive
              ? widget.activeColor ?? _themeData.colorScheme.primary
              : widget.inActiveColor ?? _themeData.disabledColor,
          borderRadius: BorderRadius.all(
            Radius.circular(getProportionateScreenWidth(kSpacingX12)),
          ),
        ),
      );
}
