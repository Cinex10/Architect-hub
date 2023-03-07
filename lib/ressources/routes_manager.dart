import 'package:architect_hub/view/chat_view.dart';
import 'package:architect_hub/view/favorite_view.dart';
import 'package:architect_hub/view/home_view.dart';
import 'package:architect_hub/view/inbox_view.dart';
import 'package:architect_hub/view/login_view.dart';
import 'package:architect_hub/view/new_request_view.dart';
import 'package:architect_hub/view/offers_view.dart';
import 'package:architect_hub/view/profile_view.dart';
import 'package:architect_hub/view/request_view.dart';
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
  static const String requestRoute = '/request';
  static const String profileRoute = '/profile';
  static const String offersRoute = '/offers';
  static const String chatRoute = '/chat';
  static const String newRequestRoute = '/newRequest';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      case Routes.settingRoute:
        return MaterialPageRoute(
          builder: (_) => SettingView(),
        );
      case Routes.requestRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestView(),
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
      case Routes.offersRoute:
        return MaterialPageRoute(
          builder: (_) {
            final int arg = settings.arguments as int;

            return OffersView(
              idRequest: arg,
            );
          },
        );
      case Routes.chatRoute:
        return MaterialPageRoute(
          builder: (_) {
            return const ChatView();
          },
        );
      case Routes.newRequestRoute:
        return MaterialPageRoute(
          builder: (_) {
            return const NewRequestView();
          },
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
