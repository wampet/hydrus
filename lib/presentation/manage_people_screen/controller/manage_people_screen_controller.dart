import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/manage_people_screen/models/manage_people_model.dart';

import 'package:flutter/material.dart';

class ManagePeopleController extends GetxController with StateMixin<dynamic> {
  ManagePeopleController(this.managePeopleModelObj);

  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController enterphonenumController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  Rx<ManagePeopleModel> managePeopleModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    firstnameController.dispose();
    lastnameController.dispose();
    enterphonenumController.dispose();
    emailController.dispose();
    categoryController.dispose();
  }
}
