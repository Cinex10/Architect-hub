import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        if (value != currentIndex) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, Routes.loginRoute);
              break;
            case 1:
              Navigator.pushNamed(context, Routes.favoritsRoute);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.homeRoute);
              break;
            default:
              break;
          }
        }
      },
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
    );
  }
}
