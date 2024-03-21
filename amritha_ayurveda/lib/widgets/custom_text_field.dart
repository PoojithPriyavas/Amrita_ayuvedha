import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    required this.controller,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: lightGreyColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(8.5)),
        child: TextField(
          controller: controller,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: t14Black300Inter,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ));
  }
}
