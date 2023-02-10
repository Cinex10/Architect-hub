import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  final ContentRepository _contentRepository = ContentRepository();

  List<PortifolioModel> portfolios = [];

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPortfolios() async {
    startLoading();
    portfolios = await _contentRepository.getPortfolios();
    stopLoading();
  }
}
