import 'package:amritha_ayurveda/core/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton2 extends StatelessWidget {
  final String label;
  final VoidCallback callbackAction;
  final double width;
  final double height;
  final TextStyle style;
  final IconData icon;
  final double iconSize;
  const CustomElevatedButton2({
    required this.style,
    required this.height,
    required this.width,
    required this.callbackAction,
    required this.label,
    required this.icon,
    required this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
              shadowColor: const MaterialStatePropertyAll(Colors.white),
              elevation: const MaterialStatePropertyAll(0),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                side: BorderSide(color: Colors.black.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(15),
              )),
              backgroundColor:
                  MaterialStatePropertyAll(lightGreyColor.withOpacity(0.2)),
              foregroundColor: const MaterialStatePropertyAll(Colors.white)),
          onPressed: callbackAction,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: style,
                ),
                Icon(
                  icon,
                  size: iconSize,
                  color: primaryColor,
                )
              ],
            ),
          ),
        ));
  }
}
