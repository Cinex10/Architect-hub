import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/inbox_item.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              elevation: 1,
              title: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p20),
                child: Text(
                  'Inbox',
                  style: getBoldStyle(
                    color: Colors.black,
                    fontSize: AppSize.s25,
                  ),
                ),
              ),
              bottom: const TabBar(
                // isScrollable: true,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.only(top: 30),
                indicatorColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(
                    child: TextWithNotificationCount(
                      text: 'الرسائل',
                      count: 2,
                    ),
                  ),
                  Tab(
                    child: TextWithNotificationCount(
                      text: 'الإشعارات',
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                MessagesList(),
                NotificationsList(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            currentRoute: Routes.inboxRoute,
          ),
        ),
      ),
    );
  }
}

class TextWithNotificationCount extends StatelessWidget {
  const TextWithNotificationCount({
    super.key,
    required this.text,
    this.count,
  });

  final String text;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        if (count != null)
          const SizedBox(
            width: 10,
          ),
        if (count != null)
          badges.Badge(
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Text(
              count!.toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            badgeStyle: const badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.black,
              padding: EdgeInsets.all(5),
              elevation: 0,
            ),
          ),
      ],
    );
  }
}

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return InboxItem(
          title: 'صالح',
          middleText: 'تص تجريبي',
          thirdLineText: '2022 Jan 19',
          onTap: () => Navigator.pushNamed(context, Routes.chatRoute),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black26,
        height: 1.5,
      ),
      itemCount: 6,
    );
  }
}

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return InboxItem(
          title: 'Dont forget to rate your experience with Mamdoh',
          thirdLineText: '2022 Jan 19',
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black26,
        height: 1.5,
      ),
      itemCount: 6,
    );
  }
}
