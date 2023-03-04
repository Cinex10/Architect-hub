import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  Country country = Country.parse('EG');

  void changeCountry(Country newCountry) {
    country = newCountry;
    notifyListeners();
  }
}
