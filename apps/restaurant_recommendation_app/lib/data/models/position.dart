import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/domain/entities/position.dart';

part 'position.g.dart';

/// [BasePosition] implementation
@JsonSerializable()
class PositionImpl extends BasePosition {
  final double lat;
  final double lng;

  PositionImpl({@required this.lat, @required this.lng});

  /// A necessary factory constructor for creating a new PositionImpl instance
  /// from a map. Pass the map to the generated `_$PositionImplFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PositionImpl.
  factory PositionImpl.fromJson(Map<String, dynamic> json) =>
      _$PositionImplFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PositionImplToJson`.
  Map<String, dynamic> toJson() => _$PositionImplToJson(this);
}
