import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_recommendation_app/domain/entities/response.dart';

import 'restaurant.dart';

part 'response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Response extends BaseResponse {
  @JsonKey(name: "html_attributions")
  final List<dynamic> attributions;
  final String nextPageToken;
  final List<Restaurant> results;
  final String status;

  Response({this.attributions, this.nextPageToken, this.results, this.status});

  /// A necessary factory constructor for creating a new Response instance
  /// from a map. Pass the map to the generated `_$ResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Response.
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ResponseToJson`.
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
