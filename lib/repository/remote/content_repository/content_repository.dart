import 'package:architect_hub/repository/remote/content_repository/base_content_repository.dart';
import 'package:flutter/services.dart';

class ContentRepository extends BaseContentRepository {
  @override
  Future<void> getAnnounces() async {
    final String response =
        await rootBundle.loadString('assets/dummy_data/announces.json');
    print(response);
  }

  @override
  Future<void> getPortfolios() {
    // TODO: implement getPortfolios
    throw UnimplementedError();
  }
}
