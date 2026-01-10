import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class EmployerDetailsController extends GetxController with StateMixin{
  Employer? employer;
  UuidValue? id = UuidValue.fromString(Get.parameters['id']!);

  @override
  void onInit() {
    getEmployerById();
    super.onInit();
  }

  Future<void> getEmployerById([UuidValue? id]) async {
    try {
      if (id != null || this.id != null) {
        employer = await ServerpodClient.instance.employer
            .getEmployerByIdentifier(id ?? this.id!);
        change(employer, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load employer details');
    }
  }
}
