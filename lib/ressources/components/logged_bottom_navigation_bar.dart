import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

class LoggedBottomNavBar extends StatelessWidget {
  const LoggedBottomNavBar({
    super.key,
    required this.currentRoute,
    required this.isServiceProvider,
  });

  final String currentRoute;
  final bool isServiceProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 1.sw > 1100 ? 0.3.sw : 10),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            spreadRadius: 0.5,
            blurRadius: 7.0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: routes.indexOf(currentRoute),
        onTap: (value) {
          Navigator.pushNamed(context, routes[value]);
        },
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black45,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'حسابي',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'الوارد',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          (!isServiceProvider)
              ? const BottomNavigationBarItem(
                  icon: Icon(Icons.edit),
                  label: 'طلباتي',
                )
              : const BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  label: 'أعمالي',
                ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

List<String> routes = [
  Routes.settingRoute,
  Routes.inboxRoute,
  Routes.homeRoute,
  Routes.requestRoute,
  Routes.favoritsRoute,
];
