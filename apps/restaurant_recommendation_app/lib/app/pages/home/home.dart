import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/service_locator.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/services/location.dart';

/// Home page of the application
/// Shows a list of all restaurants based on user filters
/// Has navigation options for profile tab & favorites tab
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Screen dimensions
  final kHeight = SizeConfig.screenHeight;
  final kWidth = SizeConfig.screenWidth;

  // Location service
  final _locationService = sl.get<BaseLocationService>();

  // Repository
  final _repository = sl.get<BaseRestaurantRepository>();

  // Google maps related variables
  Completer<GoogleMapController> _controller = Completer();
  final double _kMapZoom = 18;

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: FutureBuilder<BasePosition>(
              future: _locationService.getCurrentLocation(),
              builder: (_, location) {
                final position = location.data;
                return location.hasData
                    ? FutureBuilder<List<BaseRestaurant>>(
                        initialData: [],
                        future: _repository.getRestaurants(position: position),
                        builder: (_, snapshot) {
                          final restaurants = snapshot.data;
                          debugPrint("Restaurants => $restaurants");
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                height: kHeight * 0.45,
                                width: kWidth,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      position.lat,
                                      position.lng,
                                    ),
                                    zoom: _kMapZoom,
                                  ),
                                  myLocationButtonEnabled: true,
                                  myLocationEnabled: true,
                                  buildingsEnabled: true,
                                  compassEnabled: true,
                                  mapToolbarEnabled: false,
                                  zoomControlsEnabled: false,
                                  zoomGesturesEnabled: true,
                                  rotateGesturesEnabled: true,
                                  liteModeEnabled: true,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                              Positioned(
                                top: kHeight * 0.4,
                                bottom: kSpacingNone,
                                width: kWidth,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: getProportionateScreenHeight(
                                            kSpacingX36),
                                      ),
                                      padding: EdgeInsets.only(
                                        bottom: getProportionateScreenHeight(
                                            kToolbarHeight),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: kTheme.cardColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(kSpacingX24),
                                          topRight:
                                              Radius.circular(kSpacingX24),
                                        ),
                                      ),
                                      child: ListView.separated(
                                        itemBuilder: (_, index) {
                                          final item = restaurants[index];
                                          return ListTile(
                                            onTap: () {
                                              ScaffoldMessenger.of(context)
                                                ..removeCurrentSnackBar()
                                                ..showSnackBar(
                                                  SnackBar(
                                                    content: Text(item.name),
                                                  ),
                                                );
                                            },
                                            title: Text(item.name),
                                          );
                                        },
                                        separatorBuilder: (_, __) => SizedBox(
                                          height: getProportionateScreenHeight(
                                              kSpacingX4),
                                        ),
                                        itemCount: restaurants.length,
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(

                                        height: getProportionateScreenHeight(
                                            kSpacingX72),
                                        width: getProportionateScreenHeight(
                                            kSpacingX72),

                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kTheme.colorScheme.secondary,
                                        ),
                                        child: Image(
                                          image: Svg(kLogoAsset),
                                          height: getProportionateScreenHeight(
                                              kSpacingX72),
                                          width: getProportionateScreenHeight(
                                              kSpacingX72),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      top: kSpacingNone,
                                      left: kSpacingNone,
                                      right: kSpacingNone,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })
                    : location.hasError
                        ? Center(
                            child: Text(
                                "Oops...We are unable to load last known location"),
                          )
                        : Center(child: CircularProgressIndicator.adaptive());
              },
            ),
          ),
          Positioned(
            bottom: kSpacingNone,
            width: kWidth,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kSpacingX36),
              ),
              height: getProportionateScreenHeight(kToolbarHeight),
              width: kWidth,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: kTheme.scaffoldBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Feather.user),
                  Icon(Feather.heart),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(kToolbarHeight / 2),
            left: kSpacingNone,
            right: kSpacingNone,
            child: Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kSpacingX24),
                  ),
                ),
                child: Icon(Feather.home),
                onPressed: () {
                  /*TODO: Add click action*/
                },
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
