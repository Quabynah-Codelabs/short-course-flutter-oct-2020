/// preferences service base class
abstract class BasePreferenceRepository {
  Future<String> onUserIdChange();

  bool get isLoggedIn;

  void dispose();

  void saveUserId({String userId});
}
