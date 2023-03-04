import 'package:architect_hub/data/network/response/status.dart';
import 'package:architect_hub/model/offre_model.dart';
import 'package:architect_hub/model/request_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:flutter/material.dart';

class RequestsViewModel extends ChangeNotifier {
  Status status = Status.completed;
  final ContentRepository _contentRepository = ContentRepository();

  List<RequestModel> requests = [];
  List<OffreModel> offers = [];

  void changeStatus(Status newStatus) {
    status = newStatus;
    notifyListeners();
  }

  Future<void> getRequests({bool withShimmerEffect = true}) async {
    if (withShimmerEffect) changeStatus(Status.loading);
    requests = await _contentRepository.getRequests();
    if (withShimmerEffect) changeStatus(Status.completed);
  }

  Future<void> getOffers(
      {bool withShimmerEffect = true, required int idRequest}) async {
    if (withShimmerEffect) changeStatus(Status.loading);
    offers = await _contentRepository.getOffers(idRequest);
    if (withShimmerEffect) changeStatus(Status.completed);
  }
}
