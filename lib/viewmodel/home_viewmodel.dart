import 'package:architect_hub/ressources/enums/property_type.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  Status status = Status.completed;
  final ContentRepository _contentRepository = ContentRepository();

  List<PortifolioModel> allPortfolios = [];
  List<PortifolioModel> villasPortfolios = [];
  List<PortifolioModel> appartmentPortfolios = [];
  List<PortifolioModel> officePortfolios = [];
  List<PortifolioModel> shopPortfolios = [];
  List<PortifolioModel> medicalPortfolios = [];

  void changeStatus(Status newStatus) {
    status = newStatus;
    notifyListeners();
  }

  Future<void> getPortfolios({bool withShimmerEffect = true}) async {
    if (withShimmerEffect) changeStatus(Status.loading);
    allPortfolios = await _contentRepository.getPortfolios();
    villasPortfolios = allPortfolios
        .where((portfolio) => portfolio.propertyType == PropertyType.villa)
        .toList();
    appartmentPortfolios = allPortfolios
        .where((portfolio) => portfolio.propertyType == PropertyType.apartement)
        .toList();
    officePortfolios = allPortfolios
        .where((portfolio) => portfolio.propertyType == PropertyType.offices)
        .toList();
    shopPortfolios = allPortfolios
        .where((portfolio) => portfolio.propertyType == PropertyType.shop)
        .toList();
    medicalPortfolios = allPortfolios
        .where((portfolio) => portfolio.propertyType == PropertyType.medical)
        .toList();
    if (withShimmerEffect) changeStatus(Status.completed);
  }
}
