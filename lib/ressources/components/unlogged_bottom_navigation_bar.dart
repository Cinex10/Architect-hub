import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnloggedBottomNavBar extends StatelessWidget {
  const UnloggedBottomNavBar({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'تسجيل الدخول',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'بحث',
          ),
        ],
      ),
    );
  }
}

List<String> routes = [
  Routes.loginRoute,
  Routes.favoritsRoute,
  Routes.homeRoute,
];
