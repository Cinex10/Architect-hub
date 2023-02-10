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
                      text: 'Messages',
                      count: 2,
                    ),
                  ),
                  Tab(
                    child: TextWithNotificationCount(
                      text: 'Notifications',
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
        return const InboxItem(
          title: 'Salih',
          middleText: 'Helle?',
          thirdLineText: '2022 Jan 19',
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
        return const InboxItem(
          title: 'Dont forget to rate your experience with Mamdoh',
          thirdLineText: '2022 Jan 19',
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

class InboxItem extends StatelessWidget {
  const InboxItem({
    super.key,
    required this.thirdLineText,
    required this.title,
    this.middleText,
  });

  final String thirdLineText;
  final String title;
  final String? middleText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage('assets/images/1.jpg'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                if (middleText != null)
                  Text(
                    middleText!,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                Text(
                  thirdLineText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
