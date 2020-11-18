import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/domain/entities/geometry.dart';

import 'position.dart';

part 'geometry.g.dart';

@JsonSerializable()
class Geometry extends BaseGeometry {
  @JsonKey(name: "location")
  final PositionImpl position;

  Geometry({@required this.position});

  /// A necessary factory constructor for creating a new Geometry instance
  /// from a map. Pass the map to the generated `_$GeometryFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Geometry.
  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$GeometryToJson`.
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}
