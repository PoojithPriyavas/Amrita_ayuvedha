import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/images.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:amritha_ayurveda/services/signin_service.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:amritha_ayurveda/widgets/custom_snackbar.dart';
import 'package:amritha_ayurveda/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context);
    final SignInService signInService = SignInService();
    // final PatientService patientService = PatientService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.25,
                width: deviceWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
                child: Image.asset(
                  logoSmall,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Or Register To Book\nYour Appointments",
                      style: t24Black600,
                    ),
                    kHieght30,
                    Text(
                      "  Email",
                      style: t16Black400,
                    ),
                    kHieght5,
                    Center(
                        child: CustomTextField(
                      label: "Enter your Email",
                      controller: signInProvider.emailController,
                    )),
                    kHieght20,
                    Text(
                      "  Password",
                      style: t16Black400,
                    ),
                    kHieght5,
                    Center(
                        child: CustomTextField(
                      label: "Enter Password",
                      controller: signInProvider.passwordController,
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      CustomElevatedButton(
                        width: deviceWidth - 30,
                        height: 50,
                        style: t17White600,
                        callbackAction: () async {
                          await signInProvider.loginpressed();
                          // if (signInProvider.email.isEmpty) {
                          //   ScaffoldMessenger.of(context)
                          //     ..hideCurrentSnackBar()
                          //     ..showSnackBar(buildDynamicSnackBar(
                          //       title: signInProvider.title1,
                          //       message: signInProvider.message1,
                          //     ));
                          // }
                          // if (signInProvider.password.isEmpty) {
                          //   ScaffoldMessenger.of(context)
                          //     ..hideCurrentSnackBar()
                          //     ..showSnackBar(buildDynamicSnackBar(
                          //       title: signInProvider.title1,
                          //       message: signInProvider.message1,
                          //     ));
                          // }
                          await signInService.login(signInProvider, context);

                          // await PatientService.fetchPatients(
                          //     ApiEndPoints.token);
                        },
                        label: "Login",
                      ),
                      const Spacer(),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      'By creating or logging into an account you are agreeing with our ',
                                  style: t12Black300),
                              TextSpan(
                                  text: 'Terms and Conditions',
                                  style: t12Blue300),
                              TextSpan(text: ' and ', style: t12Black300),
                              TextSpan(
                                  text: 'Privacy Policy.', style: t12Blue300),
                            ],
                          )),
                      kHieght70
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
