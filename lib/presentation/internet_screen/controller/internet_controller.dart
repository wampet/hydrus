import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/internet_screen/models/internet_model.dart';

class InternetController extends GetxController with StateMixin<dynamic> {
  InternetController(this.internetModelObj);

  TextEditingController choosebundleController = TextEditingController();

  TextEditingController enterreasonController = TextEditingController();

  Rx<InternetModel> internetModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    choosebundleController.dispose();
    enterreasonController.dispose();
  }
}
