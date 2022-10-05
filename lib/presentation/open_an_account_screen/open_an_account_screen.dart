// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/utils/regex.dart';
import 'package:hydrus/presentation/open_an_account_screen/controller/open_an_account_controller.dart';

// Create a Form widget.
class OpenAnAccountScreen extends StatefulWidget {
  const OpenAnAccountScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpenAnAccountScreenState();
}

class _OpenAnAccountScreenState extends State<OpenAnAccountScreen> {
  final OpenAnAccountController openAnAccountController =
      Get.put(OpenAnAccountController());
  final _formKey = GlobalKey<FormState>();
  bool agree = false;

// this bool will check rememberMe is checked
  bool showErrorMessage = false;
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
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Open an account',
                  style: AppStyle.textstyleregular25,
                )),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Center(
                    child: Text(
                  'Let\'s get you started',
                  textAlign: TextAlign.center,
                  style: AppStyle.textstyleregorange16,
                )),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Center(
                    child: Text(
                  'What email address do you use for your company?',
                  textAlign: TextAlign.center,
                  style: AppStyle.textstyleregular16,
                )),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        title: 'Enter your email',
                        // controller: openAnAccountController.emailController,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill out this field';
                          } else if (!emailReg.hasMatch(value)) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'I have read and agree with the ',
                                    style: AppStyle.textstyleregular13),
                                TextSpan(
                                  text: 'Terms and Conditions of use',
                                  style: AppStyle.textstyleregorange13,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(40),
                      ),
                      showErrorMessage
                          ?

                          //  MessageDialog(
                          //     title: 'Terms and Conditions',
                          //     message:
                          //         'Please accept the terms and conditions to proceed')

                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(80.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      'Please accept the terms and conditions to proceed...')))
                          : Container(),
                      SendButton(
                          buttonTitle: 'Proceed',
                          buttonColor: ColorConstant.xenteblue,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              if (agree != true) {
                                setState(() => showErrorMessage = true);
                              } else {
                                setState(() => showErrorMessage = false);
                                // openAnAccountController.verifyEmail(
                                //     openAnAccountController
                                //         .emailController.text);
                                _formKey.currentState!.save();
                              }
                              Get.toNamed(AppRoutes.verifyEmailScreen);
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
