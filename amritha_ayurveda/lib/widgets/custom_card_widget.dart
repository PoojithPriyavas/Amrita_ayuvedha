import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardWidget extends StatelessWidget {
  final String name;
  final String treatmentName;
  final DateTime date;
  final String user;
  final int id;

  const CustomCardWidget({
    required this.id,
    required this.name,
    required this.user,
    required this.date,
    required this.treatmentName,
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = date;
    final formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return Column(
      children: [
        Text(""),
        Container(
          height: 168,
          width: deviceWidth - 30,
          decoration: BoxDecoration(
            color: lightShadeGreyCOlor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHieght20,
                    Row(
                      children: [
                        Text(
                          "$id.",
                          style: t18Black500,
                        ),
                        kWidth10,
                        Text(
                          name,
                          style: t18Black500,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        treatmentName,
                        style: t16Primary300,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.red,
                                size: 13,
                              ),
                              kWidth5,
                              Text(
                                formattedDate,
                                style: t15Black400,
                              )
                            ],
                          ),
                          kWidth20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.people_outline,
                                color: Colors.red,
                                size: 18,
                              ),
                              kWidth5,
                              Text(
                                user,
                                style: t15Black400,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "View Booking Details",
                      style: t16Black300,
                    ),
                    const Icon(
                      Icons.chevron_right_sharp,
                      color: secondaryColor,
                      size: 28,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
