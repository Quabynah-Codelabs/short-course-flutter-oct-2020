import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Responsible for handling calls to an API
abstract class BaseRestaurantRepository {
  Future<List<BaseRestaurant>> getRestaurants({BasePosition position});


  Future<BaseRestaurant> getRestaurantById({String id});
}
