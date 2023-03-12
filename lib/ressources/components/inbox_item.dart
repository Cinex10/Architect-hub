import 'package:flutter/material.dart';

class InboxItem extends StatelessWidget {
  const InboxItem({
    Key? key,
    required this.thirdLineText,
    required this.title,
    this.middleText,
    this.onTap,
    this.isDirectionReversed = false,
    this.middleTextStyle = const TextStyle(fontSize: 13),
    this.titleStyle = const TextStyle(fontSize: 16),
  }) : super(key: key);

  final String thirdLineText;
  final String title;
  final String? middleText;
  final void Function()? onTap;
  final bool isDirectionReversed;
  final TextStyle titleStyle;
  final TextStyle middleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          (isDirectionReversed) ? TextDirection.ltr : TextDirection.rtl,
      child: GestureDetector(
        onTap: onTap,
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
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    if (middleText != null)
                      Text(
                        middleText!,
                        style: middleTextStyle,
                      ),
                    Text(
                      thirdLineText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
