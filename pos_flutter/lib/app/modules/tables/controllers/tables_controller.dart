import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class TablesController extends GetxController with StateMixin<List<BTable>> {
  List<BTable> tables = <BTable>[];
  final searchTables = <BTable>[].obs;

  int get availableNb => tables
      .where(
        (table) => table.status == TableStatus.available,
      )
      .length;
  int get occupiedNb => tables
      .where(
        (table) => table.status == TableStatus.occupied,
      )
      .length;
  @override
  void onInit() {
    getTabels();
    super.onInit();
  }

  Future getTabels() async {
    try {
      tables = await ServerpodClient.instance.buildingTables
          .getTablesByBuildingId(
            LocalStorage().building!.id,
          );
      searchTables(tables);
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
    print('PDF saved to: ${file.path}');
    await Printing.sharePdf(
      bytes: pdfDoc,
      filename: '"tables"_${LocalStorage().building!.name}.pdf',
    );
  }

  void changeTableActivation(int index) async {
    try {
      final updatedTable = await ServerpodClient.instance.buildingTables
          .mangeTableActivation(
            tables[index].id,
            LocalStorage().building!.id,
          );
      tables[index] = updatedTable;
      searchTables(tables);
      searchTables.refresh();
    } on AppException catch (e) {
      AppSnackbar.info(e.message);
    } catch (e) {
      change([], status: RxStatus.error('Failed to change table activation'));
    }
  }

  TableStatus? filterStatus;
  void filterTablesBystatus([TableStatus? status]) {
    if (filterStatus == status) {
      filterStatus = null;
    } else {
      filterStatus = status;
    }
    if (filterStatus == null) {
      searchTables(tables);
    } else {
      searchTables(
        tables.where((table) => table.status == filterStatus).toList(),
      );
    }
    change(null, status: RxStatus.success());
  }
}
