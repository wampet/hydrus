import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/verify_email_screen/controller/verify_email_screen_controller.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailController());
  }
}
