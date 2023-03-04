import 'package:flutter/material.dart';

class InboxItem extends StatelessWidget {
  const InboxItem({
    super.key,
    required this.thirdLineText,
    required this.title,
    this.middleText,
    this.isDirectionReversed = false,
  });

  final String thirdLineText;
  final String title;
  final String? middleText;

  final bool isDirectionReversed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          (isDirectionReversed) ? TextDirection.ltr : TextDirection.rtl,
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  if (middleText != null)
                    Text(
                      middleText!,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
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
    );
  }
}
