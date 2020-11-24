/// Expected result from API
abstract class BaseResponse {
  List<dynamic> get attributions;

  String get nextPageToken;

  List<dynamic> get results;

  String get status;
}
