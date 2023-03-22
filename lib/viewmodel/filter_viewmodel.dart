import 'package:architect_hub/model/filter_model.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  FilterModel filterModel = FilterModel(
    minRating: 2.5,
    price: 256.4,
    isIncludeMaterials: true,
    location: 'default location',
    selectedTypes: [],
  );

  final TextEditingController ratingTextController =
      TextEditingController(text: '2.5');
  final TextEditingController priceTextController = TextEditingController();

  String? location;

  void changeLocation(String? value) {
    location = value;
    notifyListeners();
  }

  void updateRating(double newRating) {
    filterModel.minRating = newRating;
    ratingTextController.text = filterModel.minRating.toStringAsPrecision(2);
    notifyListeners();
  }

  void onChangedRatingTextfield(String value) {
    final newRating = double.parse(value);
    filterModel.minRating = newRating;
    notifyListeners();
  }

  void updateSelectedTypes(String type) {
    bool isUpdated = false;
    for (String selectedType in filterModel.selectedTypes) {
      if (selectedType == type) {
        isUpdated = filterModel.selectedTypes.remove(selectedType);
        return;
      }
    }

    if (!isUpdated) {
      filterModel.selectedTypes.add(type);
    }
    notifyListeners();
  }

  void updateIncludeMaterials(bool newValue) {
    filterModel.isIncludeMaterials = newValue;
    notifyListeners();
  }

  void clearAllFilters() {
    filterModel.selectedTypes.clear();
    priceTextController.text = '';
    filterModel.minRating = 2.5;
    ratingTextController.text = '2.5';
    location = null;
    notifyListeners();
  }

  bool isTypeSelected(int index) =>
      filterModel.selectedTypes.contains(AppConstants.availableTypes[index]);

  Future<void> showResult(BuildContext context) async {
    // final ContentRepository repository = ContentRepository();
    Navigator.pop(context);
    // await repository.getPortfolios();
  }
}
