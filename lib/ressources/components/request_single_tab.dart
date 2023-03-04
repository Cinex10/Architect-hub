import 'package:architect_hub/data/network/response/status.dart';
import 'package:architect_hub/model/request_model.dart';
import 'package:architect_hub/ressources/components/request_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class RequestSingleTab extends StatelessWidget {
  const RequestSingleTab({
    super.key,
    this.requests,
    required this.status,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  final List<RequestModel>? requests;
  final Status status;

  int getItemCount() {
    if (status == Status.completed) {
      return requests!.length;
    }
    return 3;
  }

  Widget getItemBuilder(BuildContext context, int index) {
    if (status == Status.completed) {
      return RequestItem(
        request: requests![index],
      );
    }
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 3,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.redAccent,
                  ),
                  const Spacer(),
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                  Container(
                    height: 12,
                    width: 34,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ScrollPhysics getScrollPhysics() {
    if (status == Status.completed) {
      return const BouncingScrollPhysics();
    }
    return const NeverScrollableScrollPhysics();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ResponsiveGridList(
        horizontalGridSpacing: 0,
        verticalGridSpacing: 20,
        horizontalGridMargin: 0,
        verticalGridMargin: 20,
        minItemWidth: 320,
        minItemsPerRow: 1,
        maxItemsPerRow: 6,
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: getScrollPhysics(),
        ),
        children: List.generate(
          getItemCount(),
          (index) => getItemBuilder(context, index),
        ),
      ),
      // child: ListView.separated(
      //   separatorBuilder: (context, index) => const SizedBox(
      //     height: 20,
      //   ),
      //   physics: getScrollPhysics(),
      //   padding: const EdgeInsets.only(top: 20),
      //   itemCount: getItemCount(),
      //   itemBuilder: (context, index) => getItemBuilder(context, index),
      // ),
    );
  }
}
