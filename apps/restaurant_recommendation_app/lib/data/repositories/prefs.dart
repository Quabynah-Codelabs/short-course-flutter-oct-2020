import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_recommendation_app/domain/repositories/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _userIdKey = "user_id";

class PreferenceServiceImpl extends ChangeNotifier
    implements PreferenceService {
  SharedPreferences _prefs;
  String _userId;
  StreamController<String> _userIdStreamController =
      StreamController.broadcast();

  // use sink => add content to a stream controller
  // use stream => retrieve content from a stream controller

  PreferenceServiceImpl() {
    _initPreferences();
  }

  _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // "user_id" : "ZfgLdBjBxNZZrAB007AKpgoqK8J3"
    _userId = _prefs
        .getString(_userIdKey); // if there's no value here, it will return null
    print("Current user from prefs => $_userId");
    _userIdStreamController.sink.add(_userId);
    notifyListeners();
  }

  @override
  void saveUserId({@required String userId}) async {
    // save to shared preferences
    await _prefs.setString(_userIdKey, userId);

    // update local variable
    _userId = userId;

    // update the stream
    _userIdStreamController.sink.add(userId);
    notifyListeners();
  }

  @override
  bool get isLoggedIn => _userId != null && _userId.isNotEmpty;

  @override
  Stream<String> onUserIdChange() => _userIdStreamController.stream;

  @override
  void dispose() {
    _userIdStreamController.close();
    super.dispose();
  }
}
