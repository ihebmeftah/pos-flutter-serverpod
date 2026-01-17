import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class EmployerDetailsController extends GetxController with StateMixin {
  Employer? employer;
  UuidValue? id = UuidValue.fromString(Get.parameters['id']!);

  @override
  void onInit() {
    getEmployerById();
    super.onInit();
  }

  Future<void> getEmployerById() async {
    try {
      if (id != null) {
        employer = await ServerpodClient.instance.employer
            .getEmployerByIdentifier(id!);
        change(employer, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load Employer"));
    }
  }

  void updateEmployerAccess(UuidValue accesId) async {
    try {
      if (id != null) {
        final employer = await ServerpodClient.instance.employer
            .assignAccessToEmployer(
              this.employer!.id,
              accesId,
            );
        Get.back();
        AppSnackbar.success();
        this.employer!.access = employer.access;
        update(["update-access"]);
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to update Employer Access"));
    }
  }
}
