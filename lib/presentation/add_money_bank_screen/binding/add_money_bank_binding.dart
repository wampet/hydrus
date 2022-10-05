import 'package:get/get.dart';
import 'package:hydrus/presentation/add_money_bank_screen/controller/add_money_bank_controller.dart';

class AddMoneyBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMoneyBankController());
  }
}
