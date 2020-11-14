// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    attributions: json['html_attributions'] as String,
    nextPageToken: json['next_page_token'] as String,
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Restaurant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'html_attributions': instance.attributions,
      'next_page_token': instance.nextPageToken,
      'result': instance.result,
      'status': instance.status,
    };
