import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_recommendation_app/core/size_config.dart';

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
  CameraPosition _kUserLocation;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      _getCurrentPositionOfDevice();
    }
  }

  // get's the current position of the device
  void _getCurrentPositionOfDevice() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Lat => ${position.latitude} & Lng => ${position.longitude}");
    _kUserLocation = CameraPosition(
      target: LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: _kMapZoom,
    );
    setState(() {});

    // Get all restaurants
    final response = await http.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=5.6545119,-0.1839843&rankby=distance&type=restaurant&key=AIzaSyCRIFN0PIycMhm4wZxra6-sZgW188g1o8M");

    // get the body of the response
    var body = response.body;

    // retrieve results
    var decodedResult = json.decode(body);
    var results = decodedResult["results"][0];
    print("Results returned => ${results["name"]}");
  }

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: _kUserLocation == null
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kUserLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
      ),
    );
  }
}
