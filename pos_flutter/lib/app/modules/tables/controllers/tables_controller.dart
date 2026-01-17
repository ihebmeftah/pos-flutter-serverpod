import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class TablesController extends GetxController with StateMixin<List<BTable>> {
  final tables = <BTable>[].obs;
  int get availableNb =>
      tables.where((table) => table.status == TableStatus.available).length;
  int get occupiedNb =>
      tables.where((table) => table.status == TableStatus.occupied).length;

  @override
  void onInit() {
    getTabels();
    super.onInit();
  }

  Future getTabels() async {
    try {
      tables(
        await ServerpodClient.instance.buildingTables.getTablesByBuildingId(
          LocalStorage().building!.id,
        ),
      );
      if (tables.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(tables, status: RxStatus.success());
      }
    } on AppException catch (e) {
      change([], status: RxStatus.error(e.message));
    } catch (e) {
      change([], status: RxStatus.error('Failed to load tables'));
    }
  }

  /* void updateTable(BTable table) {
    final index = tables.indexWhere((t) => t.id == table.id);
    if (index != -1) {
      tables[index] = table;
      update([table.id!]);
    }
  }
*/
  void generateTablePdfQrcode() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Center(
              child: pw.Wrap(
                alignment: pw.WrapAlignment.center,
                runSpacing: 15,
                spacing: 15,
                children: List.generate(tables.length, (index) {
                  return pw.Container(
                    width: 150,
                    height: 150,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black, width: 2),
                      borderRadius: pw.BorderRadius.circular(10),
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.BarcodeWidget(
                          barcode: pw.Barcode.qrCode(),
                          data:
                              '${tables[index].id}@${LocalStorage().building!.id}',
                          width: 100,
                          height: 100,
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                          tables[index].number.toString(),
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ];
        },
      ),
    );
    final pdfDoc = await pdf.save();
    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      '${directory.path}/"tables"_${LocalStorage().building!.name}.pdf',
    );
    await file.writeAsBytes(pdfDoc);
    await Printing.sharePdf(
      bytes: pdfDoc,
      filename: '${tables}_${LocalStorage().building!.name}.pdf',
    );
  }
}
