import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/core/size_config.dart';
import 'package:restaurant_recommendation_app/data/repositories/location.dart';
import 'package:restaurant_recommendation_app/data/repositories/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/data/database/moor_database.dart';

import 'restaurant_details.dart';

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
                      ? StreamBuilder<List<Restaurant>>(
                          initialData: [],
                          stream: _restaurantRepo.getRestaurants(
                              position: snapshot.data),
                          builder: (context, restaurantSnapshots) {
                            return restaurantSnapshots.connectionState ==
                                    ConnectionState.waiting
                                ? Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        height: SizeConfig.screenHeight * 0.4,
                                        width: SizeConfig.screenWidth,
                                        child: GoogleMap(
                                          mapType: MapType.normal,
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(snapshot.data.lat,
                                                snapshot.data.lng),
                                            zoom: _kMapZoom,
                                          ),
                                          zoomControlsEnabled: false,
                                          liteModeEnabled: true,
                                          myLocationEnabled: true,
                                          onMapCreated:
                                              (GoogleMapController controller) {
                                            // _controller.complete(controller);
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        height: SizeConfig.screenHeight * 0.65,
                                        width: SizeConfig.screenWidth,
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(top: kSpacingX24),
                                          width: SizeConfig.screenWidth,
                                          decoration: BoxDecoration(
                                            color:
                                                kTheme.scaffoldBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(kSpacingX24),
                                              topRight:
                                                  Radius.circular(kSpacingX24),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "List of restaurants around you",
                                                style:
                                                    kTheme.textTheme.headline5,
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder: (_, int index) {
                                                    // current restaurant in the list
                                                    final restaurant =
                                                        restaurantSnapshots
                                                            .data[index];

                                                    // build the list item using ListTile
                                                    return ListTile(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (_) =>
                                                                RestaurantDetailsPage(
                                                              restaurant:
                                                                  restaurant,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      title:
                                                          Text(restaurant.name),
                                                      subtitle: Text(
                                                          restaurant.vicinity),
                                                    );
                                                  },
                                                  // physics: BouncingScrollPhysics(),
                                                  itemCount: restaurantSnapshots
                                                          .hasData
                                                      ? restaurantSnapshots
                                                          .data.length
                                                      : 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
