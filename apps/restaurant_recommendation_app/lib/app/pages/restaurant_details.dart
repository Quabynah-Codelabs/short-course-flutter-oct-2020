import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Shows the details of a restaurant
class RestaurantDetailsPage extends StatefulWidget {
  final BaseRestaurant restaurant;

  const RestaurantDetailsPage({Key key, @required this.restaurant})
      : super(key: key);

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  ThemeData _kTheme;

  @override
  Widget build(BuildContext context) {
    _kTheme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildCTA(),
            _buildRestaurantInfo(),
            _buildImageGallery(),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCTA() => Positioned(
        width: SizeConfig.screenWidth,
        bottom: kSpacingNone,
        height: SizeConfig.screenHeight * 0.13,
        child: InkWell(
          splashColor: _kTheme.splashColor,
          onTap: () {
            print("Clicked on CTA");
          },
          child: Container(
            padding: EdgeInsets.only(top: kSpacingX16),
            decoration: BoxDecoration(
              color: _kTheme.colorScheme.background,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order Now",
                  style: _kTheme.textTheme.button.copyWith(
                    fontSize: _kTheme.textTheme.headline6.fontSize,
                  ),
                ),
                SizedBox(
                  width: kSpacingX12,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: _kTheme.scaffoldBackgroundColor.withOpacity(0.4),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: _kTheme.scaffoldBackgroundColor.withOpacity(0.6),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: _kTheme.scaffoldBackgroundColor,
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildRestaurantInfo() => Positioned(
        top: kToolbarHeight,
        bottom: SizeConfig.screenHeight * 0.085,
        width: SizeConfig.screenWidth,
        child: Container(
          decoration: BoxDecoration(
            color: kAmberColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kSpacingX36),
              bottomRight: Radius.circular(kSpacingX36),
            ),
          ),
        ),
      );

  Widget _buildImageGallery() => Positioned(child: Container());

  Widget _buildAppBar() => Positioned(
        top: 0,
        width: SizeConfig.screenWidth,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: _kTheme.colorScheme.error,
              onPressed: () {},
            ),
          ],
        ),
      );
}
