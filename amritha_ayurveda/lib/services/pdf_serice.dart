import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<Uint8List> generatePdf(
    String name,
    String adress,
    String number,
    String bookedOn,
    String treatmentDate,
    String treatemntTime,
    List<String> treatemntName,
    List<String> maleQuantity,
    List<String> femaleQuatity,
    String totalAmount,
    String discountAmount,
    String advanceAmount,
    String balanceAmount,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> widgets = [];
    final imageSmall =
        (await rootBundle.load("assets/logo_small.png")).buffer.asUint8List();

    print("treatment name is $treatemntName");
    print("male quantity is $maleQuantity");

    final imageBig =
        (await rootBundle.load("assets/logo_big.png")).buffer.asUint8List();

    final signImage =
        (await rootBundle.load("assets/sign.png")).buffer.asUint8List();

    final fontMedium = await rootBundle.load("assets/Manrope-Medium.ttf");
    final fontSemiBold = await rootBundle.load("assets/Manrope-SemiBold.ttf");
    final interMedium = await rootBundle.load("assets/Inter-Regular.ttf");
    final interSemiBold = await rootBundle.load("assets/Inter-SemiBold.ttf");

    final mediumFont = pw.Font.ttf(fontMedium);
    final semiboldFont = pw.Font.ttf(fontSemiBold);
    final mediumInter = pw.Font.ttf(interMedium);
    final semiboldInter = pw.Font.ttf(interSemiBold);

    final logoArea = pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 30),
        height: 110,
        child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(
                pw.MemoryImage(imageSmall),
                width: 80,
                height: 80,
                fit: pw.BoxFit.cover,
              ),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text("Kumarakam",
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.black,
                          font: semiboldFont,
                        ),
                        textAlign: pw.TextAlign.right),
                    pw.Text(
                        "Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563",
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey600,
                          font: mediumFont,
                        ),
                        textAlign: pw.TextAlign.right),
                    pw.Text("e-mail: unknown@gmail.com",
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey600,
                          font: mediumFont,
                        ),
                        textAlign: pw.TextAlign.right),
                    pw.Text("Mob: +91 9876543210 | +91 9786543210",
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey600,
                          font: mediumFont,
                        ),
                        textAlign: pw.TextAlign.right),
                    pw.Text("GST No: 32AABCU9603R1ZW",
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.black,
                          font: mediumFont,
                        ),
                        textAlign: pw.TextAlign.right),
                  ])
            ]));

    final patientDetailsArea = pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "Patient Details",
            style: pw.TextStyle(
              fontSize: 13,
              color: PdfColors.green,
              font: semiboldInter,
            ),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 5),
                        pw.Text("Name",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text("Address",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text("Whatsapp Number",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                      ]),
                  pw.SizedBox(width: 20),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 5),
                        pw.Text(name,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text(adress,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text(number,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                      ])
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 5),
                        pw.Text("Booked On",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text("Treatment Date",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text("Treatment Time",
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.black,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                      ]),
                  pw.SizedBox(width: 20),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 5),
                        pw.Text(bookedOn,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text(treatmentDate,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                        pw.SizedBox(height: 5),
                        pw.Text(treatemntTime,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey600,
                              font: mediumInter,
                            ),
                            textAlign: pw.TextAlign.left),
                      ])
                ],
              ),
            ],
          )
        ],
      ),
    );

    final treatmentBill = pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text("Treatment",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.green,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ListView.separated(
                    separatorBuilder: (context, index) =>
                        pw.SizedBox(height: 5),
                    itemCount: treatemntName.length,
                    itemBuilder: (context, index) {
                      return pw.Text(treatemntName[index],
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey600,
                            font: mediumInter,
                          ),
                          textAlign: pw.TextAlign.left);
                    },
                  ),
                ]),
          ]),
          pw.SizedBox(width: 20),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text("Price",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.green,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ListView.separated(
                    separatorBuilder: (context, index) =>
                        pw.SizedBox(height: 5),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return pw.Text("200",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey600,
                            font: mediumInter,
                          ),
                          textAlign: pw.TextAlign.left);
                    },
                  ),
                ]),
          ]),
          pw.SizedBox(width: 20),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text("Male",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.green,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ListView.separated(
                    separatorBuilder: (context, index) =>
                        pw.SizedBox(height: 5),
                    itemCount: maleQuantity.length,
                    itemBuilder: (context, index) {
                      return pw.Text(maleQuantity[index],
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey600,
                            font: mediumInter,
                          ),
                          textAlign: pw.TextAlign.left);
                    },
                  ),
                ]),
          ]),
          pw.SizedBox(width: 20),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text("Female",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.green,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ListView.separated(
                    separatorBuilder: (context, index) =>
                        pw.SizedBox(height: 5),
                    itemCount: femaleQuatity.length,
                    itemBuilder: (context, index) {
                      return pw.Text(femaleQuatity[index],
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey600,
                            font: mediumInter,
                          ),
                          textAlign: pw.TextAlign.left);
                    },
                  ),
                ]),
          ]),
          pw.SizedBox(width: 20),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text("Total",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.green,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.ListView.separated(
                    separatorBuilder: (context, index) =>
                        pw.SizedBox(height: 5),
                    itemCount: treatemntName.length,
                    itemBuilder: (context, index) {
                      return pw.Text("1000",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey600,
                            font: mediumInter,
                          ),
                          textAlign: pw.TextAlign.left);
                    },
                  ),
                ]),
          ]),
        ],
      ),
    );

    final totalBillDetails = pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Text("Total Amount",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text("Discount Amount",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: mediumFont,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text("Advance Amount",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: mediumFont,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text("Balance Amount",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
          ]),
          pw.SizedBox(width: 20),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text(totalAmount,
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text(discountAmount,
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: mediumFont,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text(advanceAmount,
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: mediumFont,
                ),
                textAlign: pw.TextAlign.left),
            pw.SizedBox(height: 10),
            pw.Text(balanceAmount,
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColors.black,
                  font: semiboldInter,
                ),
                textAlign: pw.TextAlign.left),
          ]),
        ],
      ),
    );

    final lastPart = pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text("Thank you for choosing us",
                  style: pw.TextStyle(
                    fontSize: 16,
                    color: PdfColors.green,
                    font: semiboldInter,
                  ),
                  textAlign: pw.TextAlign.left),
              pw.SizedBox(height: 10),
              pw.Text(
                  "Your well-being is our commitment, and we're honored\nyou've entrusted us with your health journey",
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey500,
                    font: mediumInter,
                  ),
                  textAlign: pw.TextAlign.right),
              pw.Image(
                pw.MemoryImage(signImage),
                width: 110,
                height: 80,
                fit: pw.BoxFit.fitWidth,
              ),
            ],
          ),
        ]));

    final mainContainer = pw.Expanded(
        child: pw.Container(
      child: pw.Stack(
        children: [
          pw.Center(
              child: pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 30),
            child: pw.Image(
              pw.MemoryImage(imageBig),
              fit: pw.BoxFit.fitWidth,
            ),
          )),
          pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            logoArea,
            pw.Divider(color: PdfColors.grey200, endIndent: 30, indent: 30),
            patientDetailsArea,
            pw.Divider(
              color: PdfColors.grey200,
              endIndent: 30,
              indent: 30,
            ),
            treatmentBill,
            pw.Divider(
              color: PdfColors.grey200,
              endIndent: 30,
              indent: 30,
            ),
            totalBillDetails,
            lastPart
          ])
        ],
      ),
    ));

    widgets.add(mainContainer);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        build: (pw.Context context) {
          return widgets;
        },
      ),
    );

    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}
