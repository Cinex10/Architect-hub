import 'package:architect_hub/model/portfolio_model.dart';

abstract class BaseLocalUserRepository {
  Future<void> addToFavorite(PortifolioModel portifolioModel);
  bool isFavorite(int id);
  void removeFromFavorite(int id);
  Map<dynamic, PortifolioModel> getAllFavorites();
  Future<void> storeToken(String token);
  Future<String> getToken();
}
