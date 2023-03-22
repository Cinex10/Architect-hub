import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/message_list.dart';
import 'package:architect_hub/ressources/components/notification_list.dart';
import 'package:architect_hub/ressources/components/text_with_notification_count.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:architect_hub/viewmodel/inbox_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  final InboxViewModel _inboxViewModel = InboxViewModel();

  @override
  void initState() {
    super.initState();
    _inboxViewModel.getMessages();
    _inboxViewModel.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: AppBar(
                automaticallyImplyLeading: false,
                elevation: 1,
                title: Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p20),
                  child: Text(
                    'الوارد',
                    style: getBoldStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                bottom: TabBar(
                  // isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.only(top: 30),
                  indicatorColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(
                      child: ChangeNotifierProvider<InboxViewModel>(
                        create: (_) => _inboxViewModel,
                        child: Consumer<InboxViewModel>(
                            builder: (context, viewmodel, _) {
                          return TextWithNotificationCount(
                            text: 'الرسائل',
                            count: _inboxViewModel.nbUnreadMessages,
                            status: _inboxViewModel.loadingStatus,
                          );
                        }),
                      ),
                    ),
                    Tab(
                      child: ChangeNotifierProvider<InboxViewModel>(
                        create: (_) => _inboxViewModel,
                        child: Consumer<InboxViewModel>(
                            builder: (context, viewmodel, _) {
                          return TextWithNotificationCount(
                            text: 'الإشعارات',
                            count: _inboxViewModel.nbUnreadNotifications,
                            status: _inboxViewModel.loadingStatus,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: ChangeNotifierProvider<InboxViewModel>(
              create: (_) => _inboxViewModel,
              child: Consumer<InboxViewModel>(
                builder: (context, viewmodel, _) {
                  return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MessagesList(
                        chatheads: viewmodel.chatHeads,
                        chats: viewmodel.chats,
                        onRefresh: () => viewmodel.getMessages(),
                        status: viewmodel.loadingStatus,
                      ),
                      NotificationsList(
                        notifications: viewmodel.notifications,
                        onRefresh: () => viewmodel.getNotifications(),
                        status: viewmodel.loadingStatus,
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: const BottomNavBar(
              currentRoute: Routes.inboxRoute,
            ),
          );
        }),
      ),
    );
  }
}
