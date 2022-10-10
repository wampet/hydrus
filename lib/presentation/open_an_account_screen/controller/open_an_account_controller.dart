import 'package:hydrus/presentation/open_an_account_screen/models/open_an_account_model.dart';
import 'package:hydrus/presentation/open_an_account_screen/repo/open_account_repo.dart';
import '/core/app_export.dart';

class OpenAnAccountController extends GetxController {
  final AccountRepo _repo = Get.find();

  Rxn<OpenAccountModel> openAccountModel = Rxn();
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    //emailController.dispose();
  }
}
