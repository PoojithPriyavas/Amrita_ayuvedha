import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/register_provider.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Radio(
                value: Payment.cash,
                activeColor: primaryColor,
                groupValue: registerProvider.selectedPaymentMethod,
                onChanged: (value) {
                  registerProvider.setSelectedPaymentMethod(value!);
                },
              ),
              Text(
                'Cash',
                style: t16Black400,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: primaryColor,
                value: Payment.card,
                groupValue: registerProvider.selectedPaymentMethod,
                onChanged: (value) {
                  registerProvider.setSelectedPaymentMethod(value!);
                },
              ),
              Text(
                'Card',
                style: t16Black400,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: primaryColor,
                value: Payment.upi,
                groupValue: registerProvider.selectedPaymentMethod,
                onChanged: (value) {
                  registerProvider.setSelectedPaymentMethod(value!);
                },
              ),
              Text(
                'Upi',
                style: t16Black400,
              ),
            ],
          ),
        ],
      );
    });
  }
}
