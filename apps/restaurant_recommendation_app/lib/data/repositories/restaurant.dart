import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/data/models/response.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';

/// Implementation of repository
class RestaurantRepository implements BaseRestaurantRepository {
  final _baseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  final _type = "restaurant";
  final _ranking = "distance";

  @override
  Future<BaseRestaurant> getRestaurantById({@required String id}) async {
    // TODO: Get restaurant by id
    return Future.value();
  }

  @override
  Future<List<BaseRestaurant>> getRestaurants(
      {@required BasePosition position}) async {
    // Get all restaurants around location provided
    final response = await http.get(
        "$_baseUrl?location=${position.lat},${position.lng}&rankby=$_ranking&type=$_type&key=$kGoogleMapsApiKey");

    // get the body of the response
    var json = response.body;

    // retrieve results
    var placesResponse = PlacesResponse.fromJson(jsonDecode(json));
    return placesResponse.results;
  }
}
