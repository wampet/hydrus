import 'dart:convert';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:deep_pick/deep_pick.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:hydrus/core/utils/helpers/app_helpers.dart';
import 'package:hydrus/models/response_model.dart';

import '../../../config/authentication/controllers/auth_controller.dart';

/// contains all service to get data from Server
class RestApiServices {
  String apiBaseUrl = 'http://sandbox666353.westeurope.cloudapp.azure.com:8087/api/v4/';
  AuthenticationRepository? authenticationRepository;
  AuthController authCtrlr = Get.find();

  RestApiServices();

  RestApiServices.withAuthRepository(this.authenticationRepository);

  static const errMessage = "We encountered a problem. Please try again later.";

  Map<String, String> requestHeader() {
    Map<String, String> headers = {'Access-Control-Allow-Origin': '*'};
    String token = authCtrlr.token.value;
    if (token.isNotEmpty || token.isNotEmpty) {
      headers['AUTHORIZATION'] = 'Bearer ' + token;
      headers['HTTP-AUTHORIZATION'] = 'Bearer ' + token;
    }
    headers['Content-Type'] = 'application/json';

    return headers;
  }

  ResponseModel responseHandler(http.Response response) {
    ResponseModel responseModel = ResponseModel();
    var jsonRes = json.decode(response.body);
    print(jsonRes);
    responseModel = ResponseModel(
      message: jsonRes['message'] ?? '',
      status: pick(jsonRes['status']).asBoolOrNull() ?? false,
      statusCode: jsonRes['status_code'] ?? 0,
    );

    if (response.statusCode != 200) {
      switch (response.statusCode) {
        case 400:
          // print(response.body);
          responseModel.message = "Bad request.";
          break;
        case 401:
          if (responseModel.message == "Account is not yet verified.") {
            authenticationRepository?.onboardingReqAcctVerification();
            // } else if (responseModel.message == "Invalid credentials") {
          } else if (responseModel.message == "Expired Session" || responseModel.message == "Token has expired" || responseModel.message == "Invalid Token") {
            Snackbar.infoSnackBar(responseModel.message ?? RestApiServices.errMessage);
            authCtrlr.logout();
          }
          break;
        case 500:
          responseModel.message = "Could not connect";
          break;
        default:
      }

      return responseModel;
    } else {
      try {
        responseModel.status = true;
        responseModel.data = jsonRes['data'];
      } on Exception catch (_) {
        responseModel.status = false;
      }
      return responseModel;
    }
  }

  Future<ResponseModel> makePost({required String url, Map<String, String>? data, String? defaultMessage}) async {
    try {
      return await post(url, data);
    } on Exception catch (_) {
      return ResponseModel(message: defaultMessage ?? errMessage);
    }
  }

  Future<ResponseModel> post(String url, Map<String, String>? data) async {
    var headers = requestHeader();
    var uri = Uri.parse('$apiBaseUrl$url');
    print(uri);
    var response = await http.post(uri, body: jsonEncode(data), headers: headers);
    // log(response.body);
    // log(jsonEncode(data));
    return responseHandler(response);
  }

  Future<ResponseModel> makeGet({Map<String, dynamic>? data, required String url, String? defaultMessage}) async {
    try {
      var uri = Uri.parse('$apiBaseUrl$url/');
      var response = await http.get(uri);
      return responseHandler(response);
    } on Exception catch (_) {
      return ResponseModel(message: defaultMessage != "" ? defaultMessage : errMessage);
    }
  }

  Future<ResponseModel> get(String url) async {
    var headers = requestHeader();
    var uri = Uri.parse('$apiBaseUrl/$url');
    var response = await http.get(uri, headers: headers);
    return responseHandler(response);
  }
}
