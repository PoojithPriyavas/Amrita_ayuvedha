import 'package:amritha_ayurveda/core/colors.dart';
import 'package:amritha_ayurveda/core/constants.dart';
import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHieght20,
                    Row(
                      children: [
                        Text(
                          "1.",
                          style: t18Black500,
                        ),
                        kWidth10,
                        Text(
                          "Vikram",
                          style: t18Black500,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 5),
                      child: Text(
                        "Couple Combo Package( rejuvanating sfgjsdhgfdsgjfhg)",
                        style: t16Primary300,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 15),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
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
                                "31/02/3023",
                                style: t15Black400,
                              )
                            ],
                          ),
                          kWidth20,
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.people_outline,
                                color: Colors.red,
                                size: 18,
                              ),
                              kWidth5,
                              Text(
                                "Name ",
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
                padding:
                    const EdgeInsets.only(left: 35, right: 20),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "View Booking Details",
                      style: t16Black300,
                    ),
                   const  Icon(
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