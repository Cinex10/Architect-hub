import 'package:architect_hub/model/bottom_bar_item.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:architect_hub/viewmodel/inbox_viewmodel.dart';
import 'package:architect_hub/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context, viewmodel, _) {
        List<BottomBarItem> bottomBarItems = (!viewmodel.isLogged)
            ? AppConstants.unLoggedUserBottomBarItems
            : (viewmodel.isServiceProvider)
                ? AppConstants.serviceProviderBottomBarItems
                : AppConstants.simpleUserBottomBarItems;
        int currentIndex = bottomBarItems
            .indexWhere((element) => element.route == currentRoute);
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
                icon:
                    Consumer<InboxViewModel>(builder: (context, viewmodel, _) {
                  return bottomBarItems[index].icon;
                }),
                label: bottomBarItems[index].label,
              ),
            ),
          ),
        );
      },
    );
  }
}
