abstract class BaseAuthRepository {
  Future<void> login();
  Future<void> signup();
  Future<void> logout();
}
