import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_recommendation_app/domain/repositories/auth.dart';

/// Implements the [AuthService] class
class AuthServiceImpl implements AuthService {
  // get sign in instance
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Future<bool> googleSignIn() async {
    try {
      var account = await _googleSignIn.signIn();
      print("Account ID => ${account.id}");
      return true;
    } catch (error) {
      print("AuthServiceImpl.googleSignIn => $error");
      return false;
    }
  }

}
