import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

part 'restaurant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Restaurant extends BaseRestaurant {
  final String name;
  final String vicinity;
  @JsonKey(name: "business_status")
  final String status;
  final String placeId;
  final List<String> types;

  Restaurant({this.name, this.vicinity, this.status, this.placeId, this.types});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$RestaurantFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Restaurant.
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RestaurantToJson`.
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
