import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/repository/local/local_user_repository/base_local_user_repository.dart';
import 'package:hive/hive.dart';

class LocalUserRepository extends BaseLocalUserRepository {
  final _favoritesBox = Hive.box<PortifolioModel>('favorites');
  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> addToFavorite(PortifolioModel portifolioModel) async {
    await _favoritesBox.put(portifolioModel.id, portifolioModel);
  }

  @override
  Future<void> storeToken(String token) {
    // TODO: implement storeToken
    throw UnimplementedError();
  }

  @override
  void removeFromFavorite(int id) {
    _favoritesBox.delete(id);
  }

  @override
  Map<dynamic, PortifolioModel> getAllFavorites() {
    return _favoritesBox.toMap();
    // Map<int, PortifolioModel> result = {};
    // int length = _favoritesBox.length;
    // for (int i = 0; i < length; i++) {
    //   PortifolioModel? item = _favoritesBox.getAt(i);
    //   if (item != null) {
    //     result.addAll({i: item});
    //   }
    // }
    // return result;
  }

  @override
  bool isFavorite(int id) {
    return _favoritesBox.containsKey(id);
  }
}
