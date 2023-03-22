import 'package:architect_hub/model/notification_model.dart';
import 'package:architect_hub/ressources/components/inbox_item.dart';
import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    super.key,
    this.notifications,
    required this.status,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  final List<NotificationModel>? notifications;
  final Status status;

  int getItemCount() {
    if (status == Status.completed) {
      return notifications!.length;
    }
    return 3;
  }

  Widget getItemBuilder(BuildContext context, int index) {
    if (status == Status.completed) {
      return InboxItem(
        title: notifications![index].content,
        thirdLineText: notifications![index].date.getTimeElapsedArabic,
        isHighlighted: !notifications![index].seen,
        onTap: () {},
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
        if ((notifications!.isEmpty) & (status == Status.completed)) {
          return const Center(
            child: Text('لا توجد إشعارات الآن'),
          );
        }
        return ResponsiveGridList(
          horizontalGridSpacing: 0,
          verticalGridSpacing: 20,
          horizontalGridMargin: 0,
          verticalGridMargin: 20,
          minItemWidth: 320,
          minItemsPerRow: 1,
          maxItemsPerRow: 6,
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
          ),
          children: List.generate(
            getItemCount(),
            (index) => getItemBuilder(context, index),
          ),
        );
      }),
    );
  }
}
