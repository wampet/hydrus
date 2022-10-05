import '../controller/setup_company_controller.dart';
import 'package:get/get.dart';

class SetupCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupCompanyController());
  }
}
