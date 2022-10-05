import 'package:hydrus/presentation/about_you_screen/models/about_you_model.dart';

import '/core/app_export.dart';

class AboutYouScreenModelController extends GetxController
    with StateMixin<dynamic> {
  Rx<AboutYouScreenModel> aboutYouScreenModelObj = AboutYouScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
