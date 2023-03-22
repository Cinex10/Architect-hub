import 'package:architect_hub/ressources/enums/status.dart';
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
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
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
      child: Builder(builder: (context) {
        if ((requests!.isEmpty) & (status == Status.completed)) {
          return const Center(
            child: Text('لا توجد طلبات الآن'),
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
                parent: BouncingScrollPhysics()),
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
