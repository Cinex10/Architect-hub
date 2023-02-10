import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toasyMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
