import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hydrus/presentation/open_an_account_screen/models/open_an_account_model.dart';
import '/core/app_export.dart';

class AccountRepo {
  bool isLoading = false;
  String baseApi =
      'http://sandbox666353.westeurope.cloudapp.azure.com:8087/api/v4/Auth/verify-email';
  Future verifyEmail(emailAddress) async {
    OpenAccountModel? openAccountModel;
    var url = Uri.parse(baseApi);
    isLoading = true;
    Map<String, String> header = {"Content-Type": "application/json"};
    Map<String, String> body = {"emailAddress": "$emailAddress"};

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    isLoading = false;
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Request successful: $jsonResponse');
      openAccountModel = OpenAccountModel.fromJson(jsonResponse);

      return openAccountModel;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      print(response.body);

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
