import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ScreenRegister extends StatelessWidget {
  const ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Icon(Icons.notifications_none)
                      ],
                    ),
                    kHieght10,
                    Text(
                      "   Register",
                      style: t24Black600,
                    )
                  ],
                ),
              ),
              Divider(),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "  Name",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child:
                      //         CustomTextField(label: "Enter your Full Name")),
                      kHieght20,
                      Text(
                        "  Whatsapp Number",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child: CustomTextField(
                      //         label: "Enter your Whatsapp Number")),
                      kHieght20,
                      Text(
                        "  Address",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child: CustomTextField(
                      //         label: "Enter your full address")),
                      kHieght20,
                      Text(
                        "  Location",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child:
                      //         CustomTextField(label: "Choose your location")),
                      kHieght20,
                      Text(
                        "  Branch",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child: CustomTextField(label: "Select the branch")),
                      kHieght20,
                      Text(
                        "  Password",
                        style: t16Black400,
                      ),
                      kHieght5,
                      // const Center(
                      //     child: CustomTextField(
                      //         label: "Enter your Whatsapp Number")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
