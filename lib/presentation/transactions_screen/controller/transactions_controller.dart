import 'package:hydrus/presentation/transactions_screen/models/transactions_model.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';

class TransactionsController extends GetxController with StateMixin<dynamic> {
  TextEditingController allController = TextEditingController();

  TextEditingController allController1 = TextEditingController();

  TextEditingController searchController = TextEditingController();

  Rx<TransactionsModel> transactionsModelObj = TransactionsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    allController.dispose();
    allController1.dispose();
    searchController.dispose();
  }
}
