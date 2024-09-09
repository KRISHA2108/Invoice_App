import 'package:invoice_genetator/header_files.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../../utils/Global/global.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  Future<Uint8List> getpdf() async {
    pw.Document pdf = pw.Document();

    for (var e in bill) {
      Globals.total +=
          int.parse(e.Qty) * int.parse(e.Price) - int.parse(e.discount);
    }

    var network = await networkImage(
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Row(
              children: [
                pw.Container(
                  height: 100,
                  width: 100,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey,
                    shape: pw.BoxShape.circle,
                    image: pw.DecorationImage(
                      image: (Globals.image != null)
                          ? pw.MemoryImage(
                              Globals.image!.readAsBytesSync(),
                            )
                          : network,
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 30,
                ),
                pw.Align(
                  alignment: const pw.Alignment(-0.9, 0),
                  child: pw.Text(
                    Globals.companyname,
                    style: pw.TextStyle(
                      fontSize: 35,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 95,
                ),
                pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(
                    fontSize: 50,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              children: [
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Align(
                          alignment: const pw.Alignment(-0.9, 0),
                          child: pw.Text(
                            Globals.Fname,
                            style: const pw.TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        pw.Align(
                          alignment: const pw.Alignment(-0.9, 0),
                          child: pw.Text(
                            Globals.Lname,
                            style: const pw.TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.Align(
                      alignment: const pw.Alignment(-0.9, 0),
                      child: pw.Text(
                        Globals.phone,
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    pw.Align(
                      alignment: const pw.Alignment(-0.9, 0),
                      child: pw.Text(
                        Globals.email,
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Container(
              height: 50,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                // color: PdfColors.black,
                border: pw.Border.all(),
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Row(
                children: [
                  pw.SizedBox(
                    width: 10,
                  ),
                  pw.Text(
                    "No.",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(
                    width: 40,
                  ),
                  pw.Text(
                    "ITEMS",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(
                    width: 45,
                  ),
                  pw.Text(
                    "QTY ",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(
                    width: 20,
                  ),
                  pw.Text(
                    "DISC",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(
                    width: 20,
                  ),
                  pw.Text(
                    "PRICE",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(
                    width: 22,
                  ),
                  pw.Text(
                    "Total",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                // No.
                pw.Container(
                  height: 350,
                  width: 40,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${index + 1}.\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 10,
                ),
                // ITEMS NAME
                pw.Container(
                  height: 350,
                  width: 120,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${bill[index].itemname}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 10,
                ),
                // QTY
                pw.Container(
                  height: 350,
                  width: 60,
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${bill[index].Qty}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 10,
                ),
                // PRICE
                pw.Container(
                  height: 350,
                  width: 60,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${bill[index].discount}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                pw.SizedBox(
                  width: 10,
                ),

                pw.Container(
                  height: 350,
                  width: 65,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${bill[index].Price}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 10,
                ),
                // AMOUNT
                pw.Container(
                  height: 350,
                  width: 80,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        bill.length,
                        (index) => pw.Text(
                          "${int.parse(bill[index].Qty) * int.parse(bill[index].Price) - int.parse(bill[index].discount) / 100}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            // TOTAL
            pw.Container(
              height: 30,
              width: 250,
              alignment: pw.Alignment.center,
              decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(8),
                border: pw.Border.all(),
              ),
              child: pw.Text(
                "Total : ${Globals.total}",
                style: const pw.TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf Page"),
      ),
      body: PdfPreview(
        build: (format) => getpdf(),
      ),
    );
  }
}
