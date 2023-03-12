import 'package:architect_hub/model/filter_model.dart';
import 'package:architect_hub/repository/remote/content_repository/content_repository.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  FilterModel filterModel = FilterModel(
    minRating: 2.5,
    price: 256.4,
    isIncludeMaterials: true,
    location: 'default location',
    availableTypes: AppConstants.availableTypes,
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
    for (TypeFilterModel element in filterModel.types) {
      if (element.name == type) {
        element.isSelected = !element.isSelected;
        break;
      }
    }
    notifyListeners();
  }

  void updateIncludeMaterials(bool newValue) {
    filterModel.isIncludeMaterials = newValue;
    notifyListeners();
  }

  void clearAllFilters() {
    for (TypeFilterModel element in filterModel.types) {
      element.isSelected = false;
    }
    priceTextController.text = '';
    filterModel.minRating = 2.5;
    ratingTextController.text = '2.5';
    location = null;
    notifyListeners();
  }

  bool isTypeSelected(int index) => filterModel.types[index].isSelected;

  List<TypeFilterModel> get types => filterModel.types;

  Future<void> showResult(BuildContext context) async {
    // final ContentRepository repository = ContentRepository();
    Navigator.pop(context);
    // await repository.getPortfolios();
  }
}
