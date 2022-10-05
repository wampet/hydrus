import 'package:get/get.dart';



class CompanyDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyDetailsScreenModelController());
  }
}

class CompanyDetailsScreenModelController {
}
