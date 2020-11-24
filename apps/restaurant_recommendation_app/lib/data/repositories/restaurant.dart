import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_recommendation_app/core/constants.dart';
import 'package:restaurant_recommendation_app/data/models/response.dart';
import 'package:restaurant_recommendation_app/data/database/moor_database.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/repositories/restaurant.dart';

class RestaurantRepository implements BaseRestaurantRepository {
  PopinaDatabase _db = PopinaDatabase();

  @override
  Future<Restaurant> getRestaurantById({String id}) {}

  @override
  Stream<List<Restaurant>> getRestaurants({BasePosition position}) async* {
    // 1. return data for the local database
    yield* _db.restaurantDao.getAllRestaurants(position: position);

    try {
      // 2. get all restaurants
      final response = await http.get(
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.lat},${position.lng}&rankby=distance&type=restaurant&key=$kGoogleMapsApiKey");

      //3. get the body of the response
      var body = response.body;

      // 4. retrieve results
      var decodedResult = json.decode(body) ?? [];
      var decodedResponse = decodedResult['results'];
      print("Decoded restaurants => $decodedResponse");
      decodedResponse.forEach((restaurant) {
        final updatedRestaurantWithLocation =
            Restaurant.fromJson(restaurant).copyWith(
          lat: position.lat,
          lng: position.lng,
        );

        _db.restaurantDao.addRestaurant(updatedRestaurantWithLocation);
      });
      // _db.restaurantDao.addRestaurants(decodedResponse.results);
    } catch (e) {
      print("Unable to load restaurants => $e");
    }
  }
}
