import 'package:hydrus/presentation/splash_screen/models/splash_screen_model.dart';

import '/core/app_export.dart';

class SplashScreenController extends GetxController with StateMixin<dynamic> {
  Rx<SplashScreenModel> splashScreenModelObj = SplashScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
