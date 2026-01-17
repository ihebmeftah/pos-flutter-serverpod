import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/status.extension.dart';

class OrderDetailsController extends GetxController with StateMixin {
  UuidValue get id => UuidValue.fromString(Get.parameters['id']!);
  String? get from => Get.parameters['from'];
  Order? order;

  @override
  void onInit() {
    getOrderById();
    super.onInit();
  }

  num get totalPrice =>
      order!.items!.fold<num>(0.0, (sum, item) => sum + item.article.price);
  num get paidAmount => order!.items!
      .where((item) => item.itemStatus.isPaid)
      .fold<num>(0.0, (sum, item) => sum + item.article.price);
  num get unpaidAmount => (totalPrice - paidAmount);

  Future<void> getOrderById() async {
    try {
      if (from == 'tables') {
        order = await ServerpodClient.instance.order.getOrderCurrOfTable(id);
      } else {
        order = await ServerpodClient.instance.order.getOrderById(id);
      }
      if (order == null) {
        change(null, status: RxStatus.empty());
      } else {
        change(order, status: RxStatus.success());
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.NotFound) {
        change(null, status: RxStatus.empty());
        return;
      }
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load order'));
    }
  }

  Future<void> payForItem(OrderItem item) async {
    try {
      final updatedItems = await ServerpodClient.instance.orderItem
          .payOrderItem(
            order!.id,
            [item.id],
            LocalStorage().building!.id,
          );
      for (var updatedItem in updatedItems) {
        final index = order!.items!.indexWhere(
          (element) => element.id == updatedItem.id,
        );
        if (index != -1) {
          order!.items![index] = updatedItem;
        }
      }
      change(order, status: RxStatus.success());
      AppSnackbar.success(
        'Item ${item.article.name} has been paid successfully',
      );
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        AppSnackbar.info(e.message);
        return;
      }
      change(order, status: RxStatus.error(e.message));
    } catch (e) {
      change(order, status: RxStatus.error('Failed to pay for the item'));
    }
  }

  Future<void> payAllItems() async {
    try {
      order = await ServerpodClient.instance.orderItem.payAllItems(
        order!.id,
        LocalStorage().building!.id,
      );
      AppSnackbar.success('All items have been paid successfully');
      change(order, status: RxStatus.success());
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        AppSnackbar.info(e.message);
        return;
      }
      change(order, status: RxStatus.error(e.message));
    } catch (e) {
      change(order, status: RxStatus.error('Failed to pay for all items'));
    }
  }

  void changeOrderItemsStatus(int index, OrderItemStatus newStataus) async {
    try {
      final items = await ServerpodClient.instance.orderItem
          .changeOrderItemsStatus(
            [order!.items![index].id],
            newStataus,
          );
      order!.items![index] = items.first;
      change(order, status: RxStatus.success());
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        AppSnackbar.info(e.message);
        return;
      }
      change(order, status: RxStatus.error(e.message));
    } catch (e) {
      change(order, status: RxStatus.error());
    }
  }

  Future<void> generateReciep() async {
    if (order == null) {
      AppSnackbar.error();
      return;
    }
    try {
      final pdf = pw.Document();
      final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
      final currencyFormat = NumberFormat.currency(
        symbol: '\$',
        decimalDigits: 2,
      );
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.roll80,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Center(
                  child: pw.Column(
                    children: [
                      pw.Text(
                        LocalStorage().building?.name ?? 'POS System',
                        style: pw.TextStyle(
                          fontSize: 24,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        'Receipt',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),

                // Order Info
                pw.Divider(thickness: 2),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Order #:',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text('${order!.id}'),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Table:',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text('${order!.btable!.number}'),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Date:',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      dateFormat.format(order!.createdAt),
                    ),
                  ],
                ),
                pw.Divider(thickness: 2),
                pw.SizedBox(height: 10),

                // Items List
                pw.Text(
                  'ITEMS',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 8),

                // Items
                ...order!.items!.map((item) {
                  return pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  item.article.name,
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(height: 2),
                                pw.Text(
                                  'Status: ${item.itemStatus.name}',
                                  style: pw.TextStyle(
                                    fontSize: 9,
                                    color: PdfColors.grey700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(width: 10),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text(
                                currencyFormat.format(item.article.price),
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              if (item.itemStatus.isPaid)
                                pw.Text(
                                  'PAID',
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColors.green,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 8),
                    ],
                  );
                }),

                pw.Divider(),
                pw.SizedBox(height: 10),

                // Totals
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Subtotal:', style: pw.TextStyle(fontSize: 12)),
                    pw.Text(
                      currencyFormat.format(totalPrice),
                      style: pw.TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                pw.SizedBox(height: 4),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Total:',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      currencyFormat.format(totalPrice),
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Divider(thickness: 2),

                // Payment Info
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Paid Amount:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.green,
                      ),
                    ),
                    pw.Text(
                      currencyFormat.format(paidAmount),
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.green,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (unpaidAmount > 0) ...[
                  pw.SizedBox(height: 4),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Unpaid Amount:',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.red,
                        ),
                      ),
                      pw.Text(
                        currencyFormat.format(unpaidAmount),
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.red,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],

                pw.SizedBox(height: 20),
                pw.Divider(),

                // Footer
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'Thank you for your business!',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        'Please come again',
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
      final pdfDoc = await pdf.save();
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
        '${directory.path}/"order_${order!.id}_receipt.pdf',
      );
      await file.writeAsBytes(pdfDoc);
      // Preview and print the PDF
      await Printing.sharePdf(
        bytes: pdfDoc,
        filename: 'order_${order!.id}_receipt.pdf',
      );
    } catch (e) {
      AppSnackbar.error();
    }
  }
}
