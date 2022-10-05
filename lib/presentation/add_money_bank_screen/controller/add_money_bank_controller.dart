import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/add_money_bank_screen/models/add_money_bank_model.dart';

class AddMoneyBankController extends GetxController with StateMixin<dynamic> {
  Rx<AddMoneyBankModel> addMoneyBank1ModelObj = AddMoneyBankModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
