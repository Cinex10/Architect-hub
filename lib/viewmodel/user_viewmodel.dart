import 'package:architect_hub/model/user_model.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? currentUser = UserModel.fromJson({
    "id": 1,
    "username": "معتز",
    "profilePicture": "assets/images/1.jpg",
    "rating": 2.5
  });

  Country country = Country.parse('EG');
  bool isAgree = false;
  bool hasErrorTerms = false;
  bool isLogged = true;
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

  void login(BuildContext context, GlobalKey<FormState> loginFormKey) {
    if (loginFormKey.currentState!.validate()) {
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
