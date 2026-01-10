import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class EmployerController extends GetxController with StateMixin {
  final employers = <Employer>[].obs;

  @override
  void onInit() {
    super.onInit();
    getEmployers();
  }

  void getEmployers() async {
    try {
      employers(
        await ServerpodClient.instance.employer.getEmployers(
          LocalStorage().building!.id!,
        ),
      );
      if (employers.isNotEmpty) {
        change(employers, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } on AppException catch (e) {
      change([], status: RxStatus.error(e.message));
    } catch (e) {
      change([], status: RxStatus.error('Failed to load employers: $e'));
    }
  }
}
