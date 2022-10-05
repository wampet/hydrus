import '../controller/get_started_screen_controller.dart';
import 'package:get/get.dart';

class GetStartedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStartedController());
  }
}
