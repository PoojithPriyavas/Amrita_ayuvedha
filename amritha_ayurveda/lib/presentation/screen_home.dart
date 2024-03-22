import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/model/patient_model/patient.dart';
import 'package:amritha_ayurveda/presentation/screen_register.dart';
import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:amritha_ayurveda/services/patient_list_service.dart';
import 'package:amritha_ayurveda/widgets/custom_card_widget.dart';
import 'package:amritha_ayurveda/widgets/custom_date_picker_button.dart';
import 'package:amritha_ayurveda/widgets/custom_elevated_button.dart';
import 'package:amritha_ayurveda/widgets/custom_searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final registerProvider = Provider.of<RegisterProvider>(context);
    final signInProvider = Provider.of<SignInProvider>(context);

    Future<void> _refreshPatients() async {
      await PatientService.fetchPatients(signInProvider.token);
    }

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
                child: RefreshIndicator(
                  onRefresh: _refreshPatients,
                  child: FutureBuilder<List<Patient>>(
                      future:
                          PatientService.fetchPatients(signInProvider.token),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final patient = snapshot.data![index];

                              return CustomCardWidget(
                                id: patient.id!,
                                deviceWidth: deviceWidth,
                                date: patient.createdAt!,
                                name: patient.name!,
                                treatmentName:
                                    patient.patientdetailsSet!.isNotEmpty
                                        ? patient.patientdetailsSet![0]
                                                    .treatmentName ==
                                                null
                                            ? "ok"
                                            : patient.patientdetailsSet![0]
                                                .treatmentName!
                                        : "No treatment available",
                                user: patient.user!,
                              );
                            },
                          );
                        } else {
                          return const Text("No list available ");
                        }
                      }),
                ),
              ),
              CustomElevatedButton(
                  style: t17White600,
                  height: 50,
                  width: deviceWidth - 30,
                  callbackAction: () async {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const ScreenRegister(),
                    ));
                    await registerProvider.registerNow(signInProvider);
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
