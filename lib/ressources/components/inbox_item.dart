import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';

class InboxItem extends StatelessWidget {
  const InboxItem({
    Key? key,
    required this.thirdLineText,
    required this.title,
    this.middleText,
    this.onTap,
    this.isHighlighted = false,
    this.isDirectionReversed = false,
    this.middleTextStyle,
    this.thirdLineTextStyle,
    this.titleStyle,
    this.circleAvatarRadius = 25.0,
  }) : super(key: key);

  final String thirdLineText;
  final String title;
  final String? middleText;
  final void Function()? onTap;
  final bool isDirectionReversed;
  final TextStyle? titleStyle;
  final TextStyle? middleTextStyle;
  final TextStyle? thirdLineTextStyle;
  final bool isHighlighted;
  final double circleAvatarRadius;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          (isDirectionReversed) ? TextDirection.ltr : TextDirection.rtl,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundColor: Colors.blue,
              backgroundImage: const AssetImage('assets/images/1.jpg'),
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
                    style: (titleStyle != null)
                        ? titleStyle
                        : !isHighlighted
                            ? getRegularStyle(
                                fontSize: 16, color: Colors.black54)
                            : getBoldStyle(fontSize: 16),
                  ),
                  if (middleText != null)
                    Text(
                      middleText!,
                      style: (middleTextStyle != null)
                          ? middleTextStyle
                          : !isHighlighted
                              ? getRegularStyle(
                                  fontSize: 13, color: Colors.black54)
                              : getBoldStyle(fontSize: 13),
                    ),
                  Text(
                    thirdLineText,
                    style: (thirdLineTextStyle != null)
                        ? thirdLineTextStyle!
                        : !isHighlighted
                            ? getRegularStyle(
                                fontSize: 13, color: Colors.black54)
                            : getBoldStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
