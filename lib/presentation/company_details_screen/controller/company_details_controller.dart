// ignore_for_file: non_constant_identifier_names

import 'package:hydrus/presentation/company_details_screen/models/login_screen_model.dart';

import '/core/app_export.dart';

class CompanyDetailsScreenModelController extends GetxController
    with StateMixin<dynamic> {
  Rx<CompanyDetailsScreenModel> CompanyDetailsScreenModelObj =
      CompanyDetailsScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
