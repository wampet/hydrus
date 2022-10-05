// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/utils/regex.dart';
import 'package:hydrus/presentation/open_an_account_screen/controller/open_an_account_controller.dart';
import 'package:hydrus/presentation/verify_email_screen/controller/verify_email_screen_controller.dart';

// Create a Form widget.
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  VerifyEmailScreenState createState() {
    return VerifyEmailScreenState();
  }
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final VerifyEmailController verifyEmailController =
      Get.put(VerifyEmailController());

  var emailInstance = OpenAnAccountController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kOrange,
            iconSize: 30,
          ),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20),
              vertical: getVerticalSize(100)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Verify your email',
                  style: AppStyle.textstyleregular25,
                )),
                SizedBox(
                  height: getVerticalSize(50),
                ),
                Center(
                    child: Text(
                  'Please enter the One-Time-Pin you have received in your email',
                  textAlign: TextAlign.center,
                  style: AppStyle.textstyleregular16,
                )),
                SizedBox(
                  height: getVerticalSize(60),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PinCodeTextField(
                        length: 4,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textStyle: kBRegularStyle,
                        obscureText: false,
                        controller: verifyEmailController.emailPassController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill out this field';
                          } else if (!codeReg.hasMatch(value)) {
                            return 'Invalid pin';
                          }
                          return null;
                        },
                        appContext: context,
                        autoDismissKeyboard: true,
                        onChanged: (String value) {},
                        pinTheme: PinTheme(
                          inactiveColor: ColorConstant.gray500,
                          activeColor: kBlack,
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: getVerticalSize(60),
                          fieldWidth: getVerticalSize(60),
                          activeFillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      SendButton(
                          buttonTitle: 'Verify email',
                          buttonColor: ColorConstant.xenteblue,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // verifyEmailController.verifyOtp(
                              //     emailInstance.emailController.text,
                              //     verifyEmailController
                              //         .emailPassController.text);
                              Get.toNamed(AppRoutes.aboutYouScreen);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
