// ignore_for_file: non_constant_identifier_names

import 'package:hydrus/presentation/login_screen/models/login_screen_model.dart';

import '/core/app_export.dart';

class LoginScreenModelController extends GetxController
    with StateMixin<dynamic> {
  Rx<LoginScreenModel> LoginScreenModelObj = LoginScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}




// class LoginScreenController extends GetxController with StateMixin<dynamic> {
//   Rx<LoginScreenModel> LoginScreenModelObj = LoginScreenModel().obs;
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   final baseApi =
//       dotenv.get('loginEmailUrl', fallback: 'loginEmailUrl not found');
//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.onClose();
//   }

//   @override
//   void onInit() {
//     emailController = TextEditingController();
//     passwordController = TextEditingController();

//     super.onInit();
//   }

//   Future login(email, password) async {
//     var url = Uri.parse(baseApi);
//     Map<String, String> header = {"Content-Type": "application/json"};
//     Map<String, String> body = {"email": "$email", "password": "$password"};

//     // Await the http get response, then decode the json-formatted response.
//     var response =
//         await http.post(url, body: convert.jsonEncode(body), headers: header);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString("userToken", jsonResponse["token"] ?? '');

//       print("jsonResponse: $jsonResponse");

//       Get.toNamed(AppRoutes.homeScreen);
//       // return jsonResponse;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       throw Exception('Failed to verify login');
//     }
//   }
// }
