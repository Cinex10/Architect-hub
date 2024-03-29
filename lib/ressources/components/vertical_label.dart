import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';

class VerticalLabel extends StatelessWidget {
  const VerticalLabel({
    super.key,
    required this.label,
    required this.text,
    this.thirdText,
  });

  final String label;
  final String text;
  final String? thirdText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          child: Text(
            label,
            textAlign: TextAlign.center,
          ),
        ),
        FittedBox(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: getSemiBoldStyle(fontSize: 14),
          ),
        ),
        if (thirdText != null)
          FittedBox(
            child: Text(
              thirdText!,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(fontSize: 14),
            ),
          ),
      ],
    );
  }
}
