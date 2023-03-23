import 'package:architect_hub/model/chat_model.dart';
import 'package:architect_hub/model/message_model.dart';
import 'package:architect_hub/ressources/components/inbox_item.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    this.chatheads,
    this.chats,
    required this.status,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  final List<MessageModel>? chatheads;
  final List<ChatModel>? chats;
  final Status status;

  int getItemCount() {
    if (status == Status.completed) {
      return chatheads!.length;
    }
    return 3;
  }

  Widget getItemBuilder(BuildContext context, int index) {
    if (status == Status.completed) {
      return InboxItem(
        title: chats![index].secondUser.username,
        middleText: chatheads![index].isIncoming
            ? chatheads![index].content
            : 'أنت: ${chatheads![index].content}',
        thirdLineText: chatheads![index].date.getTimeElapsedArabic,
        isHighlighted: !chatheads![index].seen,
        onTap: () => Navigator.pushNamed(
          context,
          Routes.chatRoute,
          arguments: chats![index],
        ),
      );
    }
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: SizedBox(
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
                  Container(
                    height: 16,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    height: 16,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    height: 16,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Builder(builder: (context) {
        if ((chatheads!.isEmpty) & (status == Status.completed)) {
          return const Center(
            child: Text('لا توجد رسائل الآن'),
          );
        }
        return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 1.sw > 900 ? 0.2.sw : 0),
          padding: EdgeInsets.symmetric(horizontal: 1.sw > 900 ? 20.w : 10),
          child: ResponsiveGridList(
            horizontalGridSpacing: 0,
            verticalGridSpacing: 20,
            horizontalGridMargin: 0,
            verticalGridMargin: 20,
            minItemWidth: 320,
            minItemsPerRow: 1,
            maxItemsPerRow: 1,
            listViewBuilderOptions: ListViewBuilderOptions(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
            ),
            children: List.generate(
              getItemCount(),
              (index) => getItemBuilder(context, index),
            ),
          ),
        );
      }),
    );
  }
}
