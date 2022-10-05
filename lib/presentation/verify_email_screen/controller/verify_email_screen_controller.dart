import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydrus/presentation/verify_email_screen/models/verify_email_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '/core/app_export.dart';

class VerifyEmailController extends GetxController with StateMixin<dynamic> {
  Rx<VerifyEmailModel> verifyEmailModelObj = VerifyEmailModel().obs;

  static String verifyotpApi =
      'http://sandbox666353.westeurope.cloudapp.azure.com:8087/api/v4/Auth/verify-email';

  late TextEditingController emailPassController;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    emailPassController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    emailPassController.dispose();
  }

  verifyOtp(emailAddress, otpCode) async {
    var url = Uri.parse(verifyotpApi);
    Map<String, String> header = {"Content-Type": "application/json"};
    Map<String, String> body = {
      "emailAddress": "$emailAddress",
      "otpCode": "$otpCode"
    };
    // Map<String, String> body = {"emailAddress": "wampet232@gmail.com"};

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("EmailAddress", jsonResponse["EmailAddress"] ?? '');

      print(prefs);
      Get.toNamed(AppRoutes.setupCompanyScreen);

      print("jsonResponse: $jsonResponse");
      Get.snackbar(
        "VERIFY",
        "please enter correct info",
        titleText: const Text(
          "Proceed",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          "Email confirmed",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.verified,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // print('Request failed with status: ${response[0].errors.EmailAddress}');
      Get.snackbar(
        "ERROR",
        "please enter correct info",
        titleText: const Text(
          "ERROR",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          "${response.statusCode}",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.error_outlined,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      );
    }
  }
}
