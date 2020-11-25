// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    attributions: json['html_attributions'] as List,
    nextPageToken: json['next_page_token'] as String,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Restaurant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'html_attributions': instance.attributions,
      'next_page_token': instance.nextPageToken,
      'results': instance.results,
      'status': instance.status,
    };
