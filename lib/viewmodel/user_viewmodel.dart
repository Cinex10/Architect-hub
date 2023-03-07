import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  Country country = Country.parse('EG');

  bool isLogged = true;
  bool isServiceProvider = true;

  void changeCountry(Country newCountry) {
    country = newCountry;
    notifyListeners();
  }

  void switchUserMode() {
    isServiceProvider = !isServiceProvider;
    notifyListeners();
  }

  void login() {
    isLogged = true;
    notifyListeners();
  }

  void logout() {
    isLogged = false;
    notifyListeners();
  }
}
