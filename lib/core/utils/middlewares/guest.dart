import 'package:flutter/material.dart';
import 'package:hydrus/config/authentication/controllers/auth_controller.dart';
import 'package:hydrus/core/app_export.dart';

class GuestMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    if (authController.isAuthenticated) {
      return RouteSettings(name: AppRoutes.homeScreen);
    }
    return null;
  }
}
