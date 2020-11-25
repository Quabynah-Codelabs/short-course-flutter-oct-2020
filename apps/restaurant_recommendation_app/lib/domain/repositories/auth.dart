/// handles authentication
abstract class AuthService {
  Future<bool> googleSignIn();

  bool get isLoggedIn;
}
