import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/ressources/components/portfolio_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class PortfolioSingleTab extends StatelessWidget {
  const PortfolioSingleTab({
    super.key,
    this.portfolios,
    required this.status,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  final List<PortifolioModel>? portfolios;
  final Status status;

  int getItemCount() {
    if (status == Status.completed) {
      return portfolios!.length;
    }
    return 3;
  }

  Widget getItemBuilder(BuildContext context, int index) {
    if (status == Status.completed) {
      return PortfolioItem(
        portifolioModel: portfolios![index],
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Builder(builder: (context) {
        if ((portfolios!.isEmpty) & (status == Status.completed)) {
          return const Center(
            child: Text('لا توجد أعمال الآن'),
          );
        }
        return ResponsiveGridList(
          horizontalGridSpacing: 0,
          verticalGridSpacing: 20,
          horizontalGridMargin: 0,
          verticalGridMargin: 20,
          minItemWidth: 250,
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
