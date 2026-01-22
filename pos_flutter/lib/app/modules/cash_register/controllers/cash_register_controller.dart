import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

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

  Future<void> createCashRegister() async {
    try {
      change(null, status: RxStatus.loading());
      final newCashRegister = await ServerpodClient.instance.cashRegister
          .createCashRegister(
            LocalStorage().building!.id,
          );
      cashRegisters.add(newCashRegister);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> closeCashRegister() async {
    try {
      change(null, status: RxStatus.loading());
      final closedCashRegister = await ServerpodClient.instance.cashRegister
          .closeLastCashRegister(
            LocalStorage().building!.id,
          );
      cashRegisters.removeWhere((cr) => cr.id == closedCashRegister.id);
      cashRegisters.add(closedCashRegister);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
