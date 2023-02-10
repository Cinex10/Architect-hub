import 'package:architect_hub/data/response/status.dart';
import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  Status status = Status.completed;
  final ContentRepository _contentRepository = ContentRepository();

  List<PortifolioModel> portfolios = [];

  void changeStatus(Status newStatus) {
    status = newStatus;
    notifyListeners();
  }

  Future<void> getPortfolios() async {
    changeStatus(Status.loading);
    portfolios = await _contentRepository.getPortfolios();
    changeStatus(Status.completed);
  }
}
