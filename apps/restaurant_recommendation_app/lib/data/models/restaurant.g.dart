// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    name: json['name'] as String,
    vicinity: json['vicinity'] as String,
    status: json['business_status'] as String,
    placeId: json['place_id'] as String,
    types: (json['types'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vicinity': instance.vicinity,
      'business_status': instance.status,
      'place_id': instance.placeId,
      'types': instance.types,
    };
