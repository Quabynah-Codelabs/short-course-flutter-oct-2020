
import 'package:restaurant_recommendation_app/domain/repositories/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// implementation of [BasePreferenceRepository]
class PreferenceRepositoryImpl implements BasePreferenceRepository {
  static const String USER_ID_KEY = "user_id";
  String _userId;

  @override
  void dispose() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    _userId = null;
  }

  @override
  bool get isLoggedIn => _userId != null && _userId.isNotEmpty;

  @override
  Future<String> onUserIdChange() async {
    var preferences = await SharedPreferences.getInstance();
    var id = preferences.getString(USER_ID_KEY);
    _userId = id;
    return _userId;
  }

  @override
  void saveUserId({String userId}) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(USER_ID_KEY, userId);
    _userId = userId;
  }
}