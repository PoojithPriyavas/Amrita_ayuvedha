import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/presentation/screen_register.dart';
import 'package:amritha_ayurveda/widgets/custom_card_widget.dart';
import 'package:amritha_ayurveda/widgets/custom_date_picker_button.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:amritha_ayurveda/widgets/custom_searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Icon(Icons.notifications_none)
                      ],
                    ),
                    kHieght30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSearchBar(deviceWidth: deviceWidth),
                        CustomElevatedButton(
                            style: t12White500,
                            width: 86,
                            height: 40,
                            callbackAction: () {},
                            label: "Search")
                      ],
                    ),
                    kHieght30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sort By :"),
                        CustomDatePickerButton(deviceWidth: deviceWidth)
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomCardWidget(deviceWidth: deviceWidth);
                  },
                ),
              ),
              CustomElevatedButton(
                  style: t17White600,
                  height: 50,
                  width: deviceWidth - 30,
                  callbackAction: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ScreenRegister(),
                    ));
                  },
                  label: "Register Now "),
              kHieght20
            ],
          ),
        ),
      ),
    );
  }
}
