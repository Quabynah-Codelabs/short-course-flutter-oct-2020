/// preferences service base class
abstract class PreferenceService {
  Stream<String> onUserIdChange();

  bool get isLoggedIn;

  void dispose();

  void saveUserId({String userId});
}