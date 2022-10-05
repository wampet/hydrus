// ignore_for_file: non_constant_identifier_names

import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/auth/password_screen/models/login_screen_model.dart';

class PasswordScreenModelController extends GetxController
    with StateMixin<dynamic> {
  Rx<PasswordScreenModel> PasswordScreenModelObj = PasswordScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
