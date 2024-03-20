import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/material.dart';

class CustomDatePickerButton extends StatelessWidget {
  const CustomDatePickerButton({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      width: deviceWidth * 0.4,
      child: ElevatedButton(
          style: const ButtonStyle(
              surfaceTintColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              side: MaterialStatePropertyAll(BorderSide(
                color: Colors.black38,
                width: 0.5,
              ))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: t12Black300,
              ),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: primaryColor,
              )
            ],
          )),
    );
  }
}
