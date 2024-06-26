import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/presentation/pop_up_screen.dart';
import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button2.dart';
import 'package:amritha_ayurveda/widgets/custom_radio_button.dart';
import 'package:amritha_ayurveda/widgets/custom_text_field.dart';
import 'package:amritha_ayurveda/widgets/custom_treatment_list_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenRegister extends StatelessWidget {
  const ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context);
    return Scaffold(
        body: SafeArea(
            child: Consumer<RegisterProvider>(
                builder: (context, registerProvider, child) => Container(
                    height: deviceHeight,
                    width: deviceWidth,
                    color: Colors.white,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child:
                                        const Icon(Icons.arrow_back_rounded)),
                                const Icon(Icons.notifications_none)
                              ],
                            ),
                            kHieght10,
                            Text("   Register", style: t24Black600)
                          ],
                        ),
                      ),
                      const Divider(),
                      Expanded(
                          child: SingleChildScrollView(
                              physics: const RangeMaintainingScrollPhysics(),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 25),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("  Name", style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label: "Enter your Full Name",
                                                controller: registerProvider
                                                    .nameController)),
                                        kHieght20,
                                        Text("  Whatsapp Number",
                                            style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label:
                                                    "Enter your Whatsapp Number",
                                                controller: registerProvider
                                                    .whatappNumberController)),
                                        kHieght20,
                                        Text("  Address", style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label:
                                                    "Enter your full address",
                                                controller: registerProvider
                                                    .addressController)),
                                        kHieght20,
                                        Text("  Location", style: t16Black400),
                                        kHieght5,
                                        DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField2<
                                                    String>(
                                                style: t14Black300Inter,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(0),
                                                        errorStyle:
                                                            TextStyle(
                                                                color: Colors
                                                                    .white),
                                                        filled: true,
                                                        isDense: false,
                                                        border: InputBorder
                                                            .none,
                                                        fillColor: Colors
                                                            .white),
                                                hint: Text(
                                                  'Choose your location',
                                                  style: t14Black300Inter,
                                                ),
                                                items: [
                                                  "Thrissur",
                                                  'Kozhikode',
                                                  "Chalakudi",
                                                  "Palakkad"
                                                ]
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String locationValue) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: locationValue,
                                                    child: Text(locationValue),
                                                  );
                                                }).toList(),
                                                buttonStyleData:
                                                    ButtonStyleData(
                                                  height: 50,
                                                  width: (deviceWidth - 30),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.2),
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        width: 1),
                                                    color: lightGreyColor
                                                        .withOpacity(0.25),
                                                  ),
                                                  elevation: 0,
                                                ),
                                                iconStyleData:
                                                    const IconStyleData(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down_rounded),
                                                  iconSize: 25,
                                                  iconEnabledColor:
                                                      primaryColor,
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  isOverButton: false,
                                                  maxHeight: 400,
                                                  width: (deviceWidth - 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white,
                                                  ),
                                                  offset: const Offset(0, 0),
                                                  scrollbarTheme:
                                                      ScrollbarThemeData(
                                                    radius:
                                                        const Radius.circular(
                                                            40),
                                                    thickness:
                                                        MaterialStateProperty
                                                            .all<double>(6),
                                                    thumbVisibility:
                                                        MaterialStateProperty
                                                            .all<bool>(false),
                                                  ),
                                                ),
                                                menuItemStyleData:
                                                    const MenuItemStyleData(
                                                  height: 40,
                                                  padding: EdgeInsets.only(
                                                      left: 14, right: 14),
                                                ),
                                                value: registerProvider
                                                    .selectedLocation,
                                                onChanged:
                                                    (String? locationValue) {
                                                  registerProvider
                                                      .locationSelected(
                                                          locationValue!);
                                                })),
                                        kHieght20,
                                        Text("  Branch", style: t16Black400),
                                        kHieght5,
                                        DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField2<
                                                    String>(
                                                style: t14Black300Inter,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(0),
                                                        errorStyle:
                                                            TextStyle(
                                                                color: Colors
                                                                    .white),
                                                        filled: true,
                                                        isDense: false,
                                                        border: InputBorder
                                                            .none,
                                                        fillColor: Colors
                                                            .white),
                                                hint: Text(
                                                  'Select the branch',
                                                  style: t14Black300Inter,
                                                ),
                                                items: registerProvider
                                                    .branchList
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                buttonStyleData:
                                                    ButtonStyleData(
                                                  height: 50,
                                                  width: (deviceWidth - 30),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.2),
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        width: 1),
                                                    color: lightGreyColor
                                                        .withOpacity(0.25),
                                                  ),
                                                  elevation: 0,
                                                ),
                                                iconStyleData:
                                                    const IconStyleData(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down_rounded),
                                                  iconSize: 25,
                                                  iconEnabledColor:
                                                      primaryColor,
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  isOverButton: false,
                                                  maxHeight: 400,
                                                  width: (deviceWidth - 30),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white,
                                                  ),
                                                  offset: const Offset(0, 0),
                                                  scrollbarTheme:
                                                      ScrollbarThemeData(
                                                    radius:
                                                        const Radius.circular(
                                                            40),
                                                    thickness:
                                                        MaterialStateProperty
                                                            .all<double>(6),
                                                    thumbVisibility:
                                                        MaterialStateProperty
                                                            .all<bool>(false),
                                                  ),
                                                ),
                                                menuItemStyleData:
                                                    const MenuItemStyleData(
                                                  height: 40,
                                                  padding: EdgeInsets.only(
                                                      left: 14, right: 14),
                                                ),
                                                value: registerProvider
                                                    .selectedbranch,
                                                onChanged:
                                                    (String? newValue) async {
                                                  int index =
                                                      await registerProvider
                                                          .branchList
                                                          .indexOf(newValue!);
                                                  await registerProvider
                                                      .branchSelected(
                                                          newValue, index);
                                                  print("index is $index");
                                                })),
                                        kHieght20,
                                        Text("  Treatments",
                                            style: t16Black400),
                                        kHieght5,
                                        registerProvider
                                                .treatmentPurchased.isEmpty
                                            ? CustomElevatedButton(
                                                style: t17White600,
                                                height: 50,
                                                width: deviceWidth - 30,
                                                callbackAction: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return const PopUpScreen();
                                                      });
                                                },
                                                label: "Add Treatments")
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        registerProvider.height,
                                                    width: deviceWidth - 30,
                                                    child:
                                                        const CustomTreatmentListView(),
                                                  ),
                                                  kHieght20,
                                                  CustomElevatedButton(
                                                      style: t17White600,
                                                      height: 50,
                                                      width: deviceWidth - 30,
                                                      callbackAction: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return const PopUpScreen();
                                                          },
                                                        );
                                                      },
                                                      label: "Add Treatments")
                                                ],
                                              ),
                                        kHieght20,
                                        Text("  Total Amount",
                                            style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label: "",
                                                controller: registerProvider
                                                    .totalAmountController)),
                                        kHieght20,
                                        Text("  Discount Amount",
                                            style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label: " ",
                                                controller: registerProvider
                                                    .discountAmountController)),
                                        kHieght20,
                                        Text("  Payment Option",
                                            style: t16Black400),
                                        kHieght5,
                                        const CustomRadioButton(),
                                        Text("  Advance Amount",
                                            style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label: "",
                                                controller: registerProvider
                                                    .advanceAmountController)),
                                        kHieght20,
                                        Text("  Balance Amount",
                                            style: t16Black400),
                                        kHieght5,
                                        Center(
                                            child: CustomTextField(
                                                label: "",
                                                controller: registerProvider
                                                    .balanceAmountController)),
                                        kHieght20,
                                        Text("  Treatment Date",
                                            style: t16Black400),
                                        kHieght5,
                                        CustomElevatedButton2(
                                            icon: Icons.calendar_today_outlined,
                                            style: t14DBlack300Inter,
                                            height: 50,
                                            iconSize: 17,
                                            width: deviceWidth - 30,
                                            callbackAction: () async {
                                              final DateTime? dateTime =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime(2024),
                                                      lastDate: DateTime(2025));
                                              if (dateTime != null) {
                                                registerProvider.selectedDate =
                                                    dateTime;
                                              }
                                            },
                                            label: registerProvider
                                                    .selectedFormatedDate
                                                    .isEmpty
                                                ? "Date"
                                                : registerProvider
                                                    .selectedFormatedDate),
                                        kHieght20,
                                        Text("  Treatment Time",
                                            style: t16Black400),
                                        kHieght5,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomElevatedButton2(
                                              icon: Icons
                                                  .keyboard_arrow_down_outlined,
                                              style: t14DBlack300Inter,
                                              height: 50,
                                              iconSize: 23,
                                              width: (deviceWidth - 30) * 0.45,
                                              callbackAction: () async {
                                                final TimeOfDay? timeOfDay =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());

                                                if (timeOfDay != null) {
                                                  registerProvider
                                                      .selectedTime = timeOfDay;
                                                }
                                              },
                                              label: registerProvider
                                                      .selectedFormatedTime
                                                      .isEmpty
                                                  ? "Hour"
                                                  : "${registerProvider.selectedFormatedTime.split(":").first} Hour",
                                            ),
                                            CustomElevatedButton2(
                                                icon: Icons
                                                    .keyboard_arrow_down_outlined,
                                                style: t14DBlack300Inter,
                                                height: 50,
                                                iconSize: 23,
                                                width:
                                                    (deviceWidth - 30) * 0.45,
                                                callbackAction: () async {
                                                  final TimeOfDay? timeOfDay =
                                                      await showTimePicker(
                                                          context: context,
                                                          initialTime:
                                                              TimeOfDay.now());

                                                  if (timeOfDay != null) {
                                                    registerProvider
                                                            .selectedTime =
                                                        timeOfDay;
                                                  }
                                                },
                                                label: registerProvider
                                                        .selectedFormatedTime
                                                        .isEmpty
                                                    ? "Minute"
                                                    : "${int.parse(registerProvider.selectedFormatedTime.split(':').last.replaceAll(RegExp(r'[^0-9]'), ''))} Minutes"),
                                          ],
                                        ),
                                        kHieght20,
                                        CustomElevatedButton(
                                            style: t17White600,
                                            height: 50,
                                            width: deviceWidth - 30,
                                            callbackAction: () async {
                                              registerProvider
                                                  .registerData(signInProvider);
                                            },
                                            label: "Save"),
                                        kHieght20,
                                      ]))))
                    ])))));
  }
}
