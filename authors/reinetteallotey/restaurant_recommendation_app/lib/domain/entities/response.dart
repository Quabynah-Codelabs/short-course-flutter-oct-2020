import 'package:restaurant_recommendation_app/data/models/restaurant.dart';

/// expected results from API
abstract class BaseResponse {
  String get attributes;

  String get nextPageToken;

  String get status;
  
  String get result;


}