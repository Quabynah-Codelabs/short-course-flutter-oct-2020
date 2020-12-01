/// handles authentication
abstract class BaseAuthRepository {
  Future<bool> googleSignIn();

  bool get isLoggedIn;
}
