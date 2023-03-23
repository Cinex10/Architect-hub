import 'package:architect_hub/model/chat_model.dart';
import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/inbox_item.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.chat});

  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text(
            chat.secondUser.username,
            style: getBoldStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton.icon(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.newRequestRoute),
                label: const Text('إنشاء طلب مباشر'),
                icon: const Icon(Icons.call),
              ),
            ),
          ],
          // automaticallyImplyLeading: false,
          // flexibleSpace: Container(
          //   margin: EdgeInsetsDirectional.symmetric(
          //       vertical: 20, horizontal: (1.sw > 550) ? 0.27.sw : 20.w),
          //   padding: const EdgeInsetsDirectional.only(
          //     start: 20,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          // Text(
          //   chat.secondUser.username,
          //   style: getBoldStyle(
          //     fontSize: 20,
          //   ),
          // ),
          // ElevatedButton.icon(
          //   onPressed: () => Navigator.pushNamed(
          //       context, Routes.newRequestRoute),
          //   label: const Text('إنشاء طلب مباشر'),
          //   icon: const Icon(Icons.call),
          // ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ),
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 1.sw > 900 ? 0.2.sw : 0),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  reverse: true,
                  itemCount: chat.chat.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: InboxItem(
                      title: chat.chat[index].sender.username,
                      middleText: chat.chat[index].content,
                      thirdLineText: chat.chat[index].date.getTimeElapsedArabic,
                      isDirectionReversed: chat.chat[index].isIncoming,
                      titleStyle: getRegularStyle(fontSize: 16),
                      middleTextStyle: getRegularStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                      circleAvatarRadius: 18,
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
              // const TextField(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(
          currentRoute: Routes.chatRoute,
        ),
      ),
    );
  }
}
