import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/data/repositories/location.dart';
import 'package:restaurant_recommendation_app/data/repositories/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Home page of the application
/// Shows a list of all restaurants based on user filters
/// Has navigation options for profile tab & favorites tab
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  final double _kMapZoom = 16;
  final _locationRepo = LocationRepository();
  final _restaurantRepo = RestaurantRepository();

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: FutureBuilder<BasePosition>(
            future: _locationRepo.getUserLocation(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : snapshot.hasData
                      ? StreamBuilder<List<BaseRestaurant>>(
                          initialData: [],
                          stream: _restaurantRepo.getRestaurants(
                              position: snapshot.data),
                          builder: (context, restaurantSnapshots) {
                            return restaurantSnapshots.connectionState ==
                                    ConnectionState.waiting
                                ? Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : Container(
                                    height: SizeConfig.screenHeight,
                                    width: SizeConfig.screenWidth,
                                    child: Center(
                                      child: Text(restaurantSnapshots.data
                                              ?.toString() ??
                                          "Nothing found"),
                                    ),
                                  );
                            // : Container();
                          },
                        )
                      : Center(
                          child: Text(
                              "An error occurred while retrieving your location"),
                        );
            }),
      ),
    );
  }
}

/*
*  Center(
                child: CircularProgressIndicator.adaptive(),
              )
* */
