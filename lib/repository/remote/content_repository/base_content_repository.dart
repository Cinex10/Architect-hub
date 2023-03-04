import 'package:architect_hub/model/offre_model.dart';
import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/model/request_model.dart';

abstract class BaseContentRepository {
  Future<List<RequestModel>> getRequests();
  Future<List<PortifolioModel>> getPortfolios();
  Future<List<OffreModel>> getOffers(int idRequest);
}
