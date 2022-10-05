import 'package:flutter/material.dart';
import 'package:hydrus/config/authentication/controllers/auth_controller.dart';
import 'package:hydrus/core/app_export.dart';

// Check if the app is locked. redirect to locked page if app is locked or ignore redirect
class CheckLockedMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    if (authController.isAppLocked && route != AppRoutes.getStartedScreen) {
      return RouteSettings(name: AppRoutes.getStartedScreen);
    }

    return null;
  }
}
