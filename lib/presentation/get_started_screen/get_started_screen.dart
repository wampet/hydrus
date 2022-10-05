// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/get_started_screen/controller/get_started_screen_controller.dart';

class GetStartedScreen extends GetWidget<GetStartedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getVerticalSize(20),
                  ),
                  CarouselWidget(),
                  SizedBox(
                    height: getVerticalSize(60),
                  ),
                  CustomButton(
                    buttonTitle: 'Login',
                    navigationFunction: () {
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    buttonIcon: Icons.login,
                    buttonColor: ColorConstant.xenteblue,
                  ),
                  SizedBox(
                    height: getVerticalSize(50),
                  ),
                  HyperLink(
                    text1: 'Open an account',
                    kolor: ColorConstant.black900,
                    fontSize: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
