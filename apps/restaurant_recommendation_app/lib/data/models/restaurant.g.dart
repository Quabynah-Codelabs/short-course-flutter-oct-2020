// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    name: json['name'] as String,
    placeId: json['place_id'] as String,
    status: json['business_status'] as String,
    vicinity: json['vicinity'] as String,
    types: (json['types'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'place_id': instance.placeId,
      'business_status': instance.status,
      'vicinity': instance.vicinity,
      'types': instance.types,
    };
