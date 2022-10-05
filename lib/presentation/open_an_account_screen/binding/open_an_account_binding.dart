import 'package:hydrus/presentation/open_an_account_screen/repo/open_account_repo.dart';

import '../controller/open_an_account_controller.dart';
import 'package:get/get.dart';

class OpenAnAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountRepo());
  }
}
