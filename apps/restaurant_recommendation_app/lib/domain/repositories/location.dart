import 'package:restaurant_recommendation_app/domain/entities/position.dart';

/// Base location service
abstract class BaseLocationRepository {
  Stream<BasePosition> observeUserLocation();

  Future<BasePosition> getUserLocation();
}
