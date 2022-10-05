import 'package:hydrus/presentation/setup_company_screen/models/setup_company_model.dart';

import '/core/app_export.dart';

class SetupCompanyController extends GetxController with StateMixin<dynamic> {
  Rx<SetupCompanyModel> setupCompanyModelObj = SetupCompanyModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hydrus/presentation/setup_company_screen/models/setup_company_model.dart';

// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import '/core/app_export.dart';

// class SetupCompanyController extends GetxController with StateMixin<dynamic> {
//   Rx<SetupCompanyModel> setupCompanyModelObj = SetupCompanyModel().obs;
//   late TextEditingController businessNameController;
//   late TextEditingController websiteController;
//   late TextEditingController currencyCodeController;
//   late TextEditingController countryCodeController;
//   late TextEditingController ipnUriController;
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   late TextEditingController emailAddressController;
//   late TextEditingController phoneNumberController;
//   late TextEditingController passwordController;
//   late TextEditingController confirmPasswordController;
//   static String createAccountApi =
//       'http://sandbox666353.westeurope.cloudapp.azure.com:8087/api/v4/Subscriptions';

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     businessNameController.dispose();
//     websiteController.dispose();
//     currencyCodeController.dispose();
//     countryCodeController.dispose();
//     ipnUriController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailAddressController.dispose();
//     phoneNumberController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }

//   @override
//   void onInit() {
//     businessNameController = TextEditingController();
//     websiteController = TextEditingController();
//     currencyCodeController = TextEditingController();
//     countryCodeController = TextEditingController();
//     ipnUriController = TextEditingController();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     emailAddressController = TextEditingController();
//     phoneNumberController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmPasswordController = TextEditingController();

//     super.onInit();
//   }

//    createAccount(
//       businessName,
//       website,
//       currencyCode,
//       countryCode,
//       ipnUri,
//       firstName,
//       lastName,
//       emailAddress,
//       phoneNumber,
//       password,
//       confirmPassword) async {
//     var url = Uri.parse(createAccountApi);
//     Map<String, String> header = {"Content-Type": "application/json"};
//     Map<String, String> body = {
//       "businessName": "$businessName",
//       "website": "$website",
//       "currencyCode": "$currencyCode",
//       "countryCode": "$countryCode",
//       "ipnUri": "$ipnUri",
//       "firstName": "$firstName",
//       "lastName": "$lastName",
//       "emailAddress": "$emailAddress",
//       "phoneNumber": "$phoneNumber",
//       "password": "$password",
//       "confirmPassword": "$confirmPassword"
//     };

//     // Await the http get response, then decode the json-formatted response.
//     var response =
//         await http.post(url, body: convert.jsonEncode(body), headers: header);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString("userToken", jsonResponse["token"] ?? '');

//       print("jsonResponse: $jsonResponse");
//       Get.snackbar(
//         "SUCCESS",
//         "please enter correct info",
//         titleText: const Text(
//           "You have officially created an account",
//           style: TextStyle(color: Colors.black),
//         ),
//         messageText: Text(
//           "${response.statusCode}",
//           style: TextStyle(color: Colors.black),
//         ),
//         icon: const Icon(
//           Icons.verified,
//           color: Colors.green,
//         ),
//         backgroundColor: Colors.white,
//       );
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//           print('Request failed with status: ${response.body}.');
//       Get.snackbar(
//         "ERROR",
//         "please enter correct info",
//         titleText: const Text(
//           "ERROR",
//           style: TextStyle(color: Colors.black),
//         ),
//         messageText: Text(
//           "${response.statusCode}",
//           style: TextStyle(color: Colors.black),
//         ),
//         icon: const Icon(
//           Icons.error_outlined,
//           color: Colors.red,
//         ),
//         backgroundColor: Colors.white,
//       );
//     }
//   }
// }
