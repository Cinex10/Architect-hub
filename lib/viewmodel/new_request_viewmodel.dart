import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewRequestViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

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
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateinput.text = formattedDate;
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
