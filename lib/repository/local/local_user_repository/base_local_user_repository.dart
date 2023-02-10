abstract class BaseLocalUserRepository {
  Future<void> setFavorite(int id);
  Future<void> storeToken(String token);
  Future<String> getToken();
}
