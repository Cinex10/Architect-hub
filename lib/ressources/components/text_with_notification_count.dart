import 'package:architect_hub/ressources/enums/status.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shimmer/shimmer.dart';

class TextWithNotificationCount extends StatelessWidget {
  const TextWithNotificationCount({
    super.key,
    required this.text,
    required this.status,
    this.count,
  });

  final String text;
  final int? count;
  final Status status;

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
        if (status == Status.loading)
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 224, 224, 224),
            highlightColor: const Color.fromARGB(255, 245, 245, 245),
            child: badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.fade(),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent: const Text(
                '0',
              ),
              badgeStyle: const badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.black,
                padding: EdgeInsets.all(5),
                elevation: 0,
              ),
            ),
          ),
        if ((count != null) & (status != Status.loading))
          badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.fade(),
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
