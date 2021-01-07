import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_recommendation_app/data/repositories/prefs.dart';
import 'package:restaurant_recommendation_app/domain/repositories/auth.dart';
import 'package:restaurant_recommendation_app/domain/repositories/prefs.dart';

/// Implements the [BaseAuthRepository] class
class AuthServiceImpl implements BaseAuthRepository {
  // get sign in instance
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  BasePreferenceRepository _preferenceService = PreferenceServiceImpl();

  @override
  Future<bool> googleSignIn() async {
    try {
      var account = await _googleSignIn.signIn();
      if (account == null) {
        print("Google sign in account is null");
        return false;
      } else {
        var authentication = await account.authentication;
        var credential = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
                accessToken: authentication.accessToken,
                idToken: authentication.idToken));
        var user = credential.user;
        print("User's id => ${user.uid}");

        // save to shared preferences
        _preferenceService.saveUserId(userId: user.uid);
        return user != null;
      }
    } catch (error) {
      print("AuthServiceImpl.googleSignIn => $error");
      return false;
    }
  }

  @override
  bool get isLoggedIn =>
  _auth.currentUser?.uid != null ?? false;
      // _preferenceService.isLoggedIn;
}
