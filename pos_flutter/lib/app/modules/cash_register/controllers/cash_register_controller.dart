import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';

class CashRegisterController extends GetxController with StateMixin {
  final cashRegisters = <CashRegister>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCashRegisters();
  }

  Future<void> getCashRegisters() async {
    try {
      change(null, status: RxStatus.loading());
      cashRegisters.value = await ServerpodClient.instance.cashRegister
          .getCashRegisters(
            LocalStorage().building!.id,
          );
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  final startAmount = TextEditingController();
  final endAmount = TextEditingController();

  Future<void> createCashRegister() async {
    // Show dialog to get start amount
    final result = await Get.dialog<double>(
      _AmountDialog(
        title: 'Open Cash Register',
        label: 'Start Amount',
        controller: startAmount,
      ),
      barrierDismissible: false,
    );

    if (result == null) return; // User cancelled

    try {
      change(null, status: RxStatus.loading());
      final newCashRegister = await ServerpodClient.instance.cashRegister
          .createCashRegister(
            LocalStorage().building!.id,
            result,
          );
      cashRegisters.add(newCashRegister);
      startAmount.clear();
      change(null, status: RxStatus.success());
      AppSnackbar.success('Cash register opened successfully');
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      change(null, status: RxStatus.success());
    } catch (e) {
      AppSnackbar.error();
      change(null, status: RxStatus.success());
    }
  }

  Future<void> closeCashRegister() async {
    // Show dialog to get end amount
    final result = await Get.dialog<double>(
      _AmountDialog(
        title: 'Close Cash Register',
        label: 'End Amount',
        controller: endAmount,
      ),
      barrierDismissible: false,
    );

    if (result == null) return; // User cancelled

    try {
      change(null, status: RxStatus.loading());
      final closedCashRegister = await ServerpodClient.instance.cashRegister
          .closeLastCashRegister(
            LocalStorage().building!.id,
            result,
          );
      cashRegisters.removeWhere((cr) => cr.id == closedCashRegister.id);
      cashRegisters.add(closedCashRegister);
      endAmount.clear();
      AppSnackbar.success('Cash register closed successfully');
      change(null, status: RxStatus.success());
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
      change(null, status: RxStatus.success());
    } catch (e) {
      AppSnackbar.error();
    }
  }
}

class _AmountDialog extends StatefulWidget {
  final String title;
  final String label;
  final TextEditingController controller;

  const _AmountDialog({
    required this.title,
    required this.label,
    required this.controller,
  });

  @override
  State<_AmountDialog> createState() => _AmountDialogState();
}

class _AmountDialogState extends State<_AmountDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: widget.controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: '0.00',
            prefixIcon: const Icon(Icons.attach_money),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an amount';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            if (double.parse(value) < 0) {
              return 'Amount cannot be negative';
            }
            return null;
          },
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Confirm'),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(widget.controller.text);
      Get.back(result: amount);
    }
  }
}
