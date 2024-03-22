import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:amritha_ayurveda/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTreatmentListView extends StatelessWidget {
  const CustomTreatmentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return ListView.separated(
        separatorBuilder: (context, index) => kHieght15,
        itemCount: registerProvider.treatmentPurchased.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> treatmentDetails =
              registerProvider.treatmentPurchased[index];
          String treatmentName = treatmentDetails['treatment'];
          int maleQuantity = treatmentDetails['maleQuantity'];
          int femaleQuantity = treatmentDetails['femaleQuantity'];

          return Container(
            height: 85,
            decoration: BoxDecoration(
                color: lightShadeGreyCOlor,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "  ${index + 1}. ",
                            style: t18Black500,
                          ),
                          Text(
                            treatmentName,
                            style: t18Black500,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          registerProvider.removeTreatmentDetails(index);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent.withOpacity(0.4)),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 17,
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Text(
                                "Men",
                                style: t16Primary400,
                              ),
                              kWidth10,
                              Container(
                                height: 26,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: lightShadeGreyCOlor,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 0.5, color: lightGreyColor)),
                                child: Center(
                                  child: Text(
                                    maleQuantity.toString(),
                                    style: t16Primary400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        kWidth20,
                        Row(
                          children: [
                            Text(
                              "female",
                              style: t16Primary400,
                            ),
                            kWidth10,
                            Container(
                              height: 26,
                              width: 44,
                              decoration: BoxDecoration(
                                color: lightShadeGreyCOlor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 0.5, color: lightGreyColor),
                              ),
                              child: Center(
                                child: Text(
                                  femaleQuantity.toString(),
                                  style: t16Primary400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.mode_edit_outlined,
                            color: primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    });
  }
}
