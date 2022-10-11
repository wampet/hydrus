import 'dart:convert';

import 'package:hydrus/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:hydrus/core/widgets/navigationService.dart';

Future<Map<String, dynamic>?> verifyEmail({required String emailAddress}) async {
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request('POST', Uri.parse('$baseUrl/auth/verify-email'));
  request.body = json.encode({
    "emailAddress": emailAddress,
    "otpCode": "string",
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>?;
  } else {
    var reasonPhrase = response.reasonPhrase;
    print(reasonPhrase);
    snackBar(reasonPhrase ?? "Invalid arguments");
  }
  return jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>?;
}

Future<Map<String, dynamic>?> verifyOTP({required String emailAddress, required String otpCode}) async {
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request('POST', Uri.parse('$baseUrl/auth/complete-email-verification'));
  request.body = json.encode({
    "emailAddress": emailAddress,
    "otpCode": otpCode,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>?;
  } else {
    var reasonPhrase = response.reasonPhrase;
    print(reasonPhrase);
    snackBar(reasonPhrase ?? "Invalid arguments");
  }
  return jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>?;
}
