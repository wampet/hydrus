import 'package:hydrus/presentation/get_started_screen/models/get_started_screen_model.dart';

import '/core/app_export.dart';

class GetStartedController extends GetxController with StateMixin<dynamic> {
  Rx<GetStartedScreenModel> getStartedScreenModelObj =
      GetStartedScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
