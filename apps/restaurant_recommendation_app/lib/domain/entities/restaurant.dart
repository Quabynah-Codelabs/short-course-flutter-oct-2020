import 'geometry.dart';

/// Base class for all restaurants
abstract class BaseRestaurant {
  String get name;

  String get status;

  String get placeId;

  BaseGeometry get geometry;

  List<String> get types;

  String get vicinity;
}
