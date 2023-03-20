import 'package:architect_hub/model/offre_model.dart';
import 'package:architect_hub/model/request_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:architect_hub/ressources/enums/request_types.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:flutter/material.dart';

class RequestsViewModel extends ChangeNotifier {
  Status status = Status.completed;
  final ContentRepository _contentRepository = ContentRepository();

  List<RequestModel> allRequests = [];
  List<RequestModel> underReviewRequests = [];
  List<RequestModel> inExecutionRequests = [];
  List<RequestModel> completedRequests = [];
  List<RequestModel> draftRequests = [];

  List<OffreModel> offers = [];

  void changeStatus(Status newStatus) {
    status = newStatus;
    notifyListeners();
  }

  Future<void> getRequests({bool withShimmerEffect = true}) async {
    if (withShimmerEffect) changeStatus(Status.loading);
    allRequests = await _contentRepository.getRequests();
    underReviewRequests = allRequests
        .where((request) => request.state == RequestType.underReviewRequest)
        .toList();
    inExecutionRequests = allRequests
        .where((request) => request.state == RequestType.inExecutionRequest)
        .toList();
    completedRequests = allRequests
        .where((request) => request.state == RequestType.completedRequest)
        .toList();
    draftRequests = allRequests
        .where((request) => request.state == RequestType.draftRequest)
        .toList();
    if (withShimmerEffect) changeStatus(Status.completed);
  }

  Future<void> getOffers(
      {bool withShimmerEffect = true, required int idRequest}) async {
    if (withShimmerEffect) changeStatus(Status.loading);
    offers = await _contentRepository.getOffers(idRequest);
    if (withShimmerEffect) changeStatus(Status.completed);
  }
}
