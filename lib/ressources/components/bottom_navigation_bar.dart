import 'package:architect_hub/model/bottom_bar_item.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:architect_hub/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (contextn, viewmodel, _) {
        List<BottomBarItem> bottomBarItems = (!viewmodel.isLogged)
            ? AppConstants.unLoggedUserBottomBarItems
            : (viewmodel.isServiceProvider)
                ? AppConstants.serviceProviderBottomBarItems
                : AppConstants.simpleUserBottomBarItems;
        int currentIndex = bottomBarItems
            .indexWhere((element) => element.route == currentRoute);
        return BottomNavigationBar(
          currentIndex: (currentIndex < 0) ? 0 : currentIndex,
          onTap: (value) {
            if (value != currentIndex) {
              Navigator.pushNamed(context, bottomBarItems[value].route);
            }
          },
          unselectedItemColor: Colors.black45,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(
            color: Colors.black45,
          ),
          items: List.generate(
            bottomBarItems.length,
            (index) => BottomNavigationBarItem(
              icon: bottomBarItems[index].icon,
              label: bottomBarItems[index].label,
            ),
          ),
        );
      },
    );
  }
}
