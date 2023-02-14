import 'package:architect_hub/model/user_model.dart';
import 'package:flutter/material.dart';

class SearchModelView extends ChangeNotifier {
  List<UserModel> result = [];
  List<UserModel> recent = [];
}
