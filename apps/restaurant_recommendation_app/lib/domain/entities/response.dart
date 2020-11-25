import 'package:restaurant_recommendation_app/domain/entities/restaurant.dart';

/// Expected result from API
abstract class BaseResponse {
  List<dynamic> get attributions;

  String get nextPageToken;

  List<BaseRestaurant> get results;

  String get status;
}
