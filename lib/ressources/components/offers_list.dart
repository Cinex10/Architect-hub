import 'package:architect_hub/ressources/enums/status.dart';
import 'package:architect_hub/model/offre_model.dart';
import 'package:architect_hub/ressources/components/offer_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shimmer/shimmer.dart';

class OffersList extends StatelessWidget {
  const OffersList({
    super.key,
    this.offers,
    required this.status,
    required this.onRefresh,
  });
  final Future<void> Function() onRefresh;
  final List<OffreModel>? offers;
  final Status status;

  int getItemCount() {
    if (status == Status.completed) {
      return offers!.length;
    }
    return 3;
  }

  Widget getItemBuilder(BuildContext context, int index) {
    if (status == Status.completed) {
      return OfferItem(
        offre: offers![index],
      );
    }
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 150,
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
        minItemWidth: 400,
        minItemsPerRow: 1,
        listViewBuilderOptions: ListViewBuilderOptions(
          physics: getScrollPhysics(),
        ),
        children: List.generate(
          getItemCount(),
          (index) => getItemBuilder(context, index),
        ),
      ),
    );
  }
}
