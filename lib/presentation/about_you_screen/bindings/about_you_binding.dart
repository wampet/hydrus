import 'package:get/get.dart';

class AboutYouScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutYouScreenModelController());
  }
}

class AboutYouScreenModelController {}
