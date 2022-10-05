import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrus/routes/app_routes.dart';

void finalScreen(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Thank you for your submission"),
    content: Text(
        "You'll receive a message when your account info has been reviewed"),
    actions: <Widget>[
      TextButton(
        onPressed: () => Get.toNamed(AppRoutes.homeScreen),
        child: const Text('OK'),
      ),
    ],
  );
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}
