import 'package:architect_hub/view/favorite_view.dart';
import 'package:architect_hub/view/home_view.dart';
import 'package:architect_hub/view/inbox_view.dart';
import 'package:architect_hub/view/login_view.dart';
import 'package:architect_hub/view/search_view.dart';
import 'package:architect_hub/view/setting_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String settingRoute = '/setting';
  static const String favoritsRoute = '/favorits';
  static const String inboxRoute = '/inbox';
  static const String searchRoute = '/search';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
// Get.to('/home')
// Get.to(homeRoute)
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.settingRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );
      case Routes.favoritsRoute:
        return MaterialPageRoute(
          builder: (_) => const FavoriteView(),
        );
      case Routes.inboxRoute:
        return MaterialPageRoute(
          builder: (_) => const InboxView(),
        );
      case Routes.searchRoute:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('No route found'),
          ),
        ),
      );
}
