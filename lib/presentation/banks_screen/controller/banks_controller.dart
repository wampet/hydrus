

import '../models/banks_model.dart';
import '/core/app_export.dart';

import 'package:flutter/material.dart';

class BanksController extends GetxController with StateMixin<dynamic> {
  BanksController(this.banksModelObj);

  TextEditingController selectabankController = TextEditingController();

  TextEditingController enteraccountnController = TextEditingController();

  TextEditingController enteraccountnController1 = TextEditingController();

  TextEditingController uGXController = TextEditingController();

  TextEditingController enterphonenumController = TextEditingController();

  TextEditingController enterrecipientController = TextEditingController();

  TextEditingController enterreasonController = TextEditingController();

  Rx<BanksModel> banksModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    selectabankController.dispose();
    enteraccountnController.dispose();
    enteraccountnController1.dispose();
    uGXController.dispose();
    enterphonenumController.dispose();
    enterrecipientController.dispose();
    enterreasonController.dispose();
  }
}
