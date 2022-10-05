// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () {
        Get.toNamed(AppRoutes.getStartedScreen);
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: getVerticalSize(135),
                    width: getHorizontalSize(350),
                    child: LogoAnimation(
                        imageUsed:
                            Image.asset(ImageConstant.imgBlackXenteLogo)),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  SizedBox(
                    height: getVerticalSize(25),
                    width: getHorizontalSize(25),
                    child: CircularProgressIndicator(
                      // backgroundColor: kOrange,
                      strokeWidth: 2.5,
                      color: kOrange,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
