import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class AccessController extends GetxController with StateMixin {
  final access = <Access>[].obs;

  @override
  void onInit() {
    getAccess();
    super.onInit();
  }

  Future<void> getAccess() async {
    try {
      access(
        await ServerpodClient.instance.access.getAllAccesses(
          LocalStorage().building!.id!,
        ),
      );
      if (access.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(access, status: RxStatus.success());
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load accesses"));
    }
  }

  void deleleAcces(int index) async {
    try {
      await ServerpodClient.instance.access.deleteAccess(access[index].id!);
      getAccess();
      Get.back();
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load accesses"));
    }
  }
}
