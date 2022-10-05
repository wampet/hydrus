import '../controller/add_money_mobile_money_controller.dart';
import 'package:get/get.dart';

class AddMoneyMobileMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMoneyMobileMoneyController());
  }
}
