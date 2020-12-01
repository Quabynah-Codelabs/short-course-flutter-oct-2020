import 'geometry.dart';

/// Base class for all restaurants
abstract class BaseRestaurant {
  String name;

  String status;

  String placeId;

  BaseGeometry geometry;

  List<String> types;

  String vicinity;
}
