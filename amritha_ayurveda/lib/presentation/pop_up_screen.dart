import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopUpScreen extends StatefulWidget {
  @override
  _PopUpScreenState createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: Container(
        height: 420,
        width: deviceWidth,
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
            DropdownButtonHideUnderline(
                child: DropdownButtonFormField2<String>(
              style: t14Black300Inter,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  isDense: false,
                  border: InputBorder.none,
                  fillColor: Colors.white),
              hint: Text(
                'Select the branch',
                style: t14Black300Inter,
              ),
              items: registerProvider.branchList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: (deviceWidth - 30),
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
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 25,
                iconEnabledColor: primaryColor,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                isOverButton: false,
                maxHeight: 400,
                width: (deviceWidth - 30),
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
              value: registerProvider.selectedbranch,
              onChanged: (String? newValue) {
                registerProvider.branchSelected(newValue!);
              },
            )),
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
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
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
                    ),
                    kWidth5,
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
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
                          "Male",
                          style: t14DBlack300Inter,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
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
                    ),
                    kWidth5,
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
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
                callbackAction: () {
                  Navigator.of(context).pop();
                },
                label: "Save")
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textFieldController.dispose();
    super.dispose();
  }
}
