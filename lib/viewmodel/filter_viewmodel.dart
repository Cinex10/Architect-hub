import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  double minRating = 2.5;
  bool isIncludeMaterials = true;
  List<String> selectedTypes = [];
  List<String> availableTypes = [
    'فيلا',
    'شقة',
    'مكتب',
    'متجر',
  ];
  final TextEditingController ratingTextController =
      TextEditingController(text: '2.5');
  final TextEditingController priceTextController = TextEditingController();

  void updateRating(double newRating) {
    minRating = newRating;
    ratingTextController.text = minRating.toStringAsPrecision(2);
    notifyListeners();
  }

  void updateSelectedTypes(String type) {
    if (selectedTypes.contains(type)) {
      selectedTypes.remove(type);
    } else {
      selectedTypes.add(type);
    }
    notifyListeners();
  }

  void updateIncludeMaterials(bool newValue) {
    isIncludeMaterials = newValue;
    notifyListeners();
  }

  void clearAllFilters() {
    selectedTypes.clear();
    priceTextController.text = '';
    minRating = 2.5;
    ratingTextController.text = '2.5';
    notifyListeners();
  }

  Future<void> showResult() async {
    final ContentRepository repository = ContentRepository();
    // await repository.getAnnounces();
    await repository.getPortfolios();
  }
}
