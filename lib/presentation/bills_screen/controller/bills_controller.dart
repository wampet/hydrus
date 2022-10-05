import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/bills_screen/models/bills_model.dart';

class BillsController extends GetxController with StateMixin<dynamic> {
  BillsController(this.billsModelObj);

  Rx<BillsModel> billsModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool _loading = false;
}
