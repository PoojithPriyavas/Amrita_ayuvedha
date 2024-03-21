import 'package:amritha_ayurveda/core/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback callbackAction;
  final double width;
  final double height;
  final TextStyle style;
  const CustomElevatedButton({
    required this.style,
    required this.height,
    required this.width,
    required this.callbackAction,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor: const MaterialStatePropertyAll(primaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white)),
          onPressed: callbackAction,
          child: Text(
            label,
            style: style,
          ),
        ));
  }
}
