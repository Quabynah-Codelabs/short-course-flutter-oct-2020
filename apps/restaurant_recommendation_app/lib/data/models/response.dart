import 'package:json_annotation/json_annotation.dart';

import 'restaurant.dart';

part 'response.g.dart';

/// Response format for json returned from Places API
@JsonSerializable()
class PlacesResponse {
  @JsonKey(name: "html_attributions")
  final List<String> attributions;
  @JsonKey(name: "next_page_token")
  final String nextPageToken;
  final List<Restaurant> results;

  PlacesResponse({this.attributions, this.nextPageToken, this.results});

  /// A necessary factory constructor for creating a new PlacesResponse instance
  /// from a map. Pass the map to the generated `_$PlacesResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PlacesResponse.
  factory PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PlacesResponseToJson`.
  Map<String, dynamic> toJson() => _$PlacesResponseToJson(this);
}
