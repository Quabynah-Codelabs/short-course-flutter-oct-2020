import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _reviewController = TextEditingController();
  final _reviewSheetController = SheetController();

  bool _isOperational() =>
      widget.restaurant.status.toLowerCase() == "operational";

  @override
  Widget build(BuildContext context) {
    _kTheme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildRestaurantInfo(),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() => Positioned(
        top: kToolbarHeight,
        bottom: kSpacingNone,
        width: SizeConfig.screenWidth,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kSpacingX24,
            vertical: kSpacingX8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kSpacingX36),
              bottomRight: Radius.circular(kSpacingX36),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.restaurant.name,
                style: _kTheme.textTheme.headline4,
              ),
              SizedBox(height: kSpacingX8),
              Text(
                widget.restaurant.vicinity,
                style: _kTheme.textTheme.bodyText1,
              ),
              SizedBox(height: kSpacingX8),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kSpacingX16,
                  vertical: kSpacingX8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingX8),
                  border: Border.all(
                    color: _isOperational()
                        ? kGreenColor
                        : _kTheme.colorScheme.error,
                  ),
                ),
                child: Text(
                  _isOperational() ? "Opened" : "Closed",
                  style: _kTheme.textTheme.button.copyWith(
                    color: _isOperational()
                        ? kGreenColor
                        : _kTheme.colorScheme.error,
                  ),
                ),
              ),
              SizedBox(height: kSpacingX16),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSpacingX24),
                  ),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 17,
                      target: LatLng(
                        widget.restaurant.geometry.position.lat,
                        widget.restaurant.geometry.position.lng,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: kSpacingX8),
              InkWell(
                onTap: () {
                  // TODO: Week 7: Add review
                  // _scaffoldKey.currentState.showBottomSheet(
                  //   (context) => Container(
                  //     height: SizeConfig.screenHeight * 0.4,
                  //     width: SizeConfig.screenWidth,
                  //     color: _kTheme.errorColor,
                  //   ),
                  // );

                  showAsBottomSheet();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: kSpacingX16),
                  decoration: BoxDecoration(
                    color: _kTheme.colorScheme.primary,
                  ),
                  child: Text(
                    "Submit review",
                    style: _kTheme.textTheme.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildAppBar() => Positioned(
        top: 0,
        width: SizeConfig.screenWidth,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: _kTheme.colorScheme.error,
              onPressed: () {
                // TODO: Week 7: Add restaurant to your favorites (local database)
              },
            ),
          ],
        ),
      );

  void showAsBottomSheet() async =>
      await showSlidingBottomSheet(context, builder: (context) {
        return SlidingSheetDialog(
          elevation: 8,
          cornerRadius: 16,
          controller: _reviewSheetController,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // headerBuilder: (_, __) => Material(child: Container()),
          // footerBuilder: (_, __) => Material(child: Container()),
          headerBuilder: (context, state) {
            return Container(
              height: 56,
              width: double.infinity,
              color: _kTheme.colorScheme.primary,
              alignment: Alignment.center,
              child: Text(
                "Review \"${widget.restaurant.name}\"",
                style: _kTheme.textTheme.bodyText1
                    .copyWith(color: _kTheme.colorScheme.onPrimary),
              ),
            );
          },
          builder: (context, state) {
            return Material(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kSpacingX24,
                  vertical: kSpacingX16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _reviewController,
                        validator: (input) =>
                            input.isNotEmpty ? null : "Please add a review",
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter review message",
                        ),
                        onFieldSubmitted: (input) {
                          _saveAndSubmit();
                        },
                      ),
                      SizedBox(height: kSpacingX16),
                      InkWell(
                        onTap: _saveAndSubmit,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: kSpacingX16),
                          decoration: BoxDecoration(
                            color: _kTheme.colorScheme.primary,
                          ),
                          child: Text(
                            "Submit",
                            style: _kTheme.textTheme.button,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });

  // HINT: onTap: () => _saveAndSubmit(), or onTap: _saveAndSubmit,
  void _saveAndSubmit() {
    if (_formKey.currentState.validate()) {
      var reviewTyped = _reviewController.text;
      Navigator.of(context).pop();
      _saveReview(reviewTyped);
    }
  }

  // TODO: Save review to database and show a list of reviews under the map
  void _saveReview(String input) {
    print("Your review is: $input");
  }
}
