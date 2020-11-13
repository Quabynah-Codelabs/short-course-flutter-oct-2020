import 'package:restaurant_recommendation_app/domain/entities/position.dart';

/// Base location service
abstract class BaseLocationService {
  Future<BasePosition> getCurrentLocation();

  Stream<BasePosition> observeCurrentLocation();
}
