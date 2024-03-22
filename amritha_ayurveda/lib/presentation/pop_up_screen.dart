import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopUpScreen extends StatelessWidget {
  const PopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: SizedBox(
        height: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Choose Treatment",
                  style: t16Black400,
                ),
              ],
            ),
            kHieght10,
            SizedBox(
              height: 80,
              child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2<String>(
                style: t14Black300Inter,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(0),
                    errorStyle: TextStyle(color: Colors.white),
                    filled: true,
                    isDense: true,
                    border: InputBorder.none,
                    fillColor: Colors.white),
                hint: Text(
                  'Choose Prefered',
                  style: t14Black300Inter,
                ),
                items: registerProvider.treatmentList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 100,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.2),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.2), width: 1),
                    color: lightGreyColor.withOpacity(0.25),
                  ),
                  elevation: 0,
                ),
                dropdownStyleData: DropdownStyleData(
                  isOverButton: false,
                  maxHeight: 400,
                  width: (deviceWidth - 120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(false),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
                value: registerProvider.selectedTreatment,
                onChanged: (String? newValue) async {
                  registerProvider.selectedTreatment = newValue;
                },
              )),
            ),
            kHieght20,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Add Patients",
                  style: t16Black400,
                ),
              ],
            ),
            kHieght10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 115,
                  decoration: BoxDecoration(
                      color: lightShadeGreyCOlor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Male",
                          style: t14DBlack300Inter,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("decrement button clicked");
                        registerProvider.decrementCounter(0);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    kWidth5,
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.3, color: Colors.black),
                      ),
                      child: AnimatedFlipCounter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        duration: const Duration(milliseconds: 500),
                        value: registerProvider.getCount(0),
                      ),
                    ),
                    kWidth5,
                    GestureDetector(
                      onTap: () {
                        registerProvider.incrementCounter(0);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            kHieght20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 115,
                  decoration: BoxDecoration(
                      color: lightShadeGreyCOlor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Female",
                          style: t14DBlack300Inter,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("decrement button clicked");
                        registerProvider.decrementCounter(1);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    kWidth5,
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.3, color: Colors.black),
                      ),
                      child: AnimatedFlipCounter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        duration: const Duration(milliseconds: 500),
                        value: registerProvider.getCount(1),
                      ),
                    ),
                    kWidth5,
                    GestureDetector(
                      onTap: () {
                        registerProvider.incrementCounter(1);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            kHieght30,
            CustomElevatedButton(
                style: t17White600,
                height: 50,
                width: deviceWidth - 60,
                callbackAction: () async {
                  final String? newValue = registerProvider.selectedTreatment;

                  if (newValue != null) {
                    int index =
                        registerProvider.treatmentList.indexOf(newValue);
                    await registerProvider.treatmentSelected(newValue, index);
                  }

                  registerProvider.saveTreatmentDetails();
                  Navigator.of(context).pop();
                },
                label: "Save")
          ],
        ),
      ),
    );
  }
}
