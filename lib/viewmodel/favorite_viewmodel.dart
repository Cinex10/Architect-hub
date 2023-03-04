import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/repository/local/local_user_repository/local_user_repository.dart';
import 'package:flutter/material.dart';

class FavoriteViewModel extends ChangeNotifier {
  final LocalUserRepository _localUserRepository = LocalUserRepository();
  Map<dynamic, PortifolioModel> favorites = {};

  void getAllFavorites() {
    favorites = _localUserRepository.getAllFavorites();
  }

  Future<void> addToFavorite(PortifolioModel portifolioModel) async {
    await _localUserRepository.addToFavorite(portifolioModel);
  }

  void removeFromFavorite(int id) {
    _localUserRepository.removeFromFavorite(id);
    favorites.remove(id);
  }

  bool isPortfolioLiked(int id) {
    return _localUserRepository.isFavorite(id);
  }
}
