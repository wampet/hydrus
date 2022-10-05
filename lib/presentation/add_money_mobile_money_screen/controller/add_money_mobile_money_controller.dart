import 'package:hydrus/presentation/add_money_mobile_money_screen/models/add_money_mobile_money_model.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';

class AddMoneyMobileMoneyController extends GetxController
    with StateMixin<dynamic> {
  TextEditingController uGXController = TextEditingController();

  Rx<AddMoneyMobileMoneyModel> addMoneyMobileMoneyModelObj =
      AddMoneyMobileMoneyModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    uGXController.dispose();
  }
}
