import 'package:architect_hub/model/bottom_bar_item.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppConstants {
  static List<String> availableTypes = [
    'فيلا',
    'شقة',
    'مكتب',
    'متجر',
    'عيادة',
  ];

  static List<String> requestTypes = [
    'الكل',
    'قيد المعاينة',
    'قيد التنفيذ',
    'مكتمل',
    'مسودة',
  ];

  static List<String> unitType = [
    'وحدة 1',
    'وحدة 2',
    'وحدة 3',
    'وحدة 4',
    'وحدة 5',
  ];

  static List<String> locations = [
    'موقع 1',
    'موقع 2',
    'موقع 3',
    'موقع 4',
    'موقع 5',
  ];

  static List<BottomBarItem> unLoggedUserBottomBarItems = [
    BottomBarItem(
      route: Routes.loginRoute,
      icon: const Icon(Icons.person_outline),
      label: 'تسجيل الدخول',
    ),
    BottomBarItem(
      route: Routes.favoritsRoute,
      icon: const Icon(Icons.favorite),
      label: 'المفضلة',
    ),
    BottomBarItem(
      route: Routes.homeRoute,
      icon: const Icon(Icons.search),
      label: 'بحث',
    ),
  ];
  static List<BottomBarItem> simpleUserBottomBarItems = [
    BottomBarItem(
      route: Routes.settingRoute,
      icon: const Icon(Icons.account_circle_outlined),
      label: 'حسابي',
    ),
    BottomBarItem(
      route: Routes.inboxRoute,
      icon: const Icon(Icons.message),
      label: 'الوارد',
    ),
    BottomBarItem(
      route: Routes.homeRoute,
      icon: const Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomBarItem(
      route: Routes.requestRoute,
      icon: const Icon(Icons.edit),
      label: 'طلباتي',
    ),
    BottomBarItem(
      route: Routes.favoritsRoute,
      icon: const Icon(Icons.favorite),
      label: 'المفضلة',
    ),
  ];
  static List<BottomBarItem> serviceProviderBottomBarItems = [
    BottomBarItem(
      route: Routes.settingRoute,
      icon: const Icon(Icons.account_circle_outlined),
      label: 'حسابي',
    ),
    BottomBarItem(
      route: Routes.inboxRoute,
      icon: const Icon(Icons.message),
      label: 'الوارد',
    ),
    BottomBarItem(
      route: Routes.homeRoute,
      icon: const Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomBarItem(
      route: Routes.requestRoute,
      icon: const Icon(Icons.work),
      label: 'أعمالي',
    ),
    BottomBarItem(
      route: Routes.favoritsRoute,
      icon: const Icon(Icons.favorite),
      label: 'المفضلة',
    ),
  ];
}
