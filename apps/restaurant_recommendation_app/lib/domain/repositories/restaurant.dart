import 'package:restaurant_recommendation_app/domain/entities/position.dart';

/// Responsible for handling calls to an API
abstract class BaseRestaurantRepository {
  Stream<List<dynamic>> getRestaurants({BasePosition position});

  Future<dynamic> getRestaurantById({String id});
}
