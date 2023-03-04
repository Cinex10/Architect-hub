import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      width: 15,
      child: Center(
        child: VerticalDivider(
          color: Colors.black38,
          thickness: 1,
        ),
      ),
    );
  }
}
