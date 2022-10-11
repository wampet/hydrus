// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hydrus/core/api/api.dart';
import 'package:hydrus/core/widgets/navigationService.dart';
import 'package:hydrus/presentation/verify_otp_screen/models/verify_otp_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/utils/regex.dart';

// Create a Form widget.
class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  VerifyOTPScreenState createState() {
    return VerifyOTPScreenState();
  }
}

class VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
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
          margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(20), vertical: getVerticalSize(100)),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
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
                        length: 6,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textStyle: kBRegularStyle,
                        obscureText: false,
                        controller: otpController,
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
                              /* snackBar("Verifying...");
                              verifyOTP(emailAddress: widget.email, otpCode: otpController.text).then((value) {
                                var verifyOTPModel = VerifyOtpModel.fromJson(value ?? {});
                                snackBar(verifyOTPModel.status!);
                                if (verifyOTPModel.status == "success") {
                                  Get.toNamed(AppRoutes.aboutYouScreen);
                                }
                              }); */
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
