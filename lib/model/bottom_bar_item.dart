import 'package:flutter/material.dart';

class BottomBarItem {
  String route;
  Icon icon;
  String label;
  int? Function()? getNotificationsCount;
  BottomBarItem({
    required this.route,
    required this.icon,
    required this.label,
    this.getNotificationsCount,
  });
}
