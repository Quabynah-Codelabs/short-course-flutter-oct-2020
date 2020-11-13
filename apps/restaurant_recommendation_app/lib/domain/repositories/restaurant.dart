import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Base repository for restaurant calls
abstract class BaseRestaurantRepository {
  Future<List<BaseRestaurant>> getRestaurants(
      {@required BasePosition position});

  Future<BaseRestaurant> getRestaurantById({@required String id});
}
