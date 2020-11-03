import 'package:flutter/foundation.dart';
import 'package:restaurant_recommendation_app/core/service_locator.dart';
import 'package:restaurant_recommendation_app/core/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages [SharedPreferences]
/// sets theme and user login id properties
class PrefsProvider extends ChangeNotifier {
  SharedPreferences _preferences;
  bool _isLoggedIn = false, _isLightTheme = true, _isSystemTheme = true;
  String _userId;

  // Private constructor
  PrefsProvider._();

  static PrefsProvider get instance => PrefsProvider._().._init();

  bool get isLoggedIn => _isLoggedIn;

  String get userId => _userId;

  bool get isLightTheme => _isLightTheme;

  bool get isSystemTheme => _isSystemTheme;

  void _init() async {
    _preferences = await sl.getAsync<SharedPreferences>();
    _userId = _preferences.getString(PrefsUtils.USER_ID) ?? null;
    _isLightTheme = _preferences.getBool(PrefsUtils.LIGHT_THEME_MODE) ?? true;
    _isSystemTheme = _preferences.getBool(PrefsUtils.SYSTEM_THEME_MODE) ?? true;
  }

  void saveUserId(String value) async {
    await _preferences.setString(PrefsUtils.USER_ID, value);
    _userId = value;
    _isLoggedIn = value != null && value.isNotEmpty;
    notifyListeners();
  }

  void toggleTheme({bool isSystemMode = true, bool isLightMode = true}) async {
    _isLightTheme = isLightMode;
    _isSystemTheme = isSystemMode;
    await _preferences.setBool(PrefsUtils.SYSTEM_THEME_MODE, isSystemMode);
    await _preferences.setBool(PrefsUtils.LIGHT_THEME_MODE, isLightMode);
    notifyListeners();
  }
}
