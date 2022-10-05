import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/auth/password_screen/controller/password_screen_controller.dart';

class PasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordScreenModelController());
  }
}
