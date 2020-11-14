import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Expected result from API
abstract class BaseResponse {
  String get attributions;

  String get nextPageToken;

  List<BaseRestaurant> get result;

  String get status;
}
