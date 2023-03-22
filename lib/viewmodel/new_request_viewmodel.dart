import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';

class NewRequestViewModel extends ChangeNotifier {
  GlobalKey<FormState> newRequestFormKey = GlobalKey<FormState>();

  String? unitType;
  String? location;

  final TextEditingController dateinput = TextEditingController();

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      dateinput.text = pickedDate.yyyy_MM_dd;
      notifyListeners();
    } else {
      // "Date is not selected"
    }
  }

  void changeUnitType(String? value) {
    unitType = value;
    notifyListeners();
  }

  void changeLocation(String? value) {
    location = value;
    notifyListeners();
  }
}
