// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) {
  return PlacesResponse(
    attributions:
        (json['html_attributions'] as List)?.map((e) => e as String)?.toList(),
    nextPageToken: json['next_page_token'] as String,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Restaurant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PlacesResponseToJson(PlacesResponse instance) =>
    <String, dynamic>{
      'html_attributions': instance.attributions,
      'next_page_token': instance.nextPageToken,
      'results': instance.results,
    };
