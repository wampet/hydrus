import 'package:hydrus/presentation/auth/verify_an_account/models/verify_account_model.dart';

import '/core/app_export.dart';

class VerifyAccountController extends GetxController with StateMixin<dynamic> {
  Rx<VerifyAccountModel> verifyAccountModelObj = VerifyAccountModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
