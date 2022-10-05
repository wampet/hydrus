// import 'package:hydrus/presentation/verify_an_account/model_view/model_view_account.dart';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// class AccountServices {
//   static Future<Object> getUsers() async {
//     try {
//       var url = Uri.parse(userList);
//       var response = await http.get(url);
//       if (200 == response.statusCode) {
//         // return usersListModelFromJson(response.body);
//         return Success(response: openAccountModelFromJson(response.body));
//       }
//     //   return Failure(code: 100, errorResponse: 'Invalid Response');
//     // } on HttpException {
//     //   return Failure(code: 101, errorResponse: 'No internet ');
//     // } on FormatException {
//     //   return Failure(code: 102, errorResponse: 'Invalid Format');
//     // } catch (e) {
//     //   return Failure(code: 102, errorResponse: 'Unknown Error');
//     }
//   }
// }
