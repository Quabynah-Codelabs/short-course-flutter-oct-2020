import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/data/models/response.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';

class RestaurantRepository implements BaseRestaurantRepository {
  @override
  Future<BaseRestaurant> getRestaurantById({String id}) {}

  @override
  Future<List<BaseRestaurant>> getRestaurants({BasePosition position}) async {
    // get all restaurants
    final response = await http.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.lat},${position.lng}&rankby=distance&type=restaurant&key=$kGoogleMapsApiKey");

    // get the body of the response
    var body = response.body;
    try {
      // retrieve results
      var decodedResult = json.decode(body);
      var decodedResponse = Response.fromJson(decodedResult);
      print("Status => ${decodedResponse.status}");
      return decodedResponse.result;
    } catch (e) {
      print("Unable to load restaurants => $e");
    }
  }
}
