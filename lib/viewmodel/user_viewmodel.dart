import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  Country country = Country.parse('EG');
  bool isAgree = false;
  bool hasErrorTerms = false;

  bool isLogged = false;
  bool isServiceProvider = true;

  void changeCountry(Country newCountry) {
    country = newCountry;
    notifyListeners();
  }

  void updateTermsAgree(bool? value) {
    isAgree = value!;
    notifyListeners();
  }

  void switchUserMode() {
    isServiceProvider = !isServiceProvider;
    notifyListeners();
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (isAgree) {
        hasErrorTerms = false;
        isLogged = true;
        notifyListeners();
        Navigator.pushNamed(context, Routes.homeRoute);
      } else {
        hasErrorTerms = true;
        notifyListeners();
      }
    }
  }

  void loginWithFacebook() {
    // TODO: implement login with facebook
  }

  void logout() {
    isLogged = false;
    notifyListeners();
  }
}
