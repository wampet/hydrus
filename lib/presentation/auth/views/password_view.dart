// ignore_for_file: unused_field, prefer_const_constructors

// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/auth/password_screen/widgets/validated_field.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  PasswordScreenState createState() {
    return PasswordScreenState();
  }
}

class PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validPassword = false;
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
                  'Your security',
                  style: AppStyle.textstyleregular25,
                )),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Center(
                    child: Text(
                  'Let us keep your account safe',
                  textAlign: TextAlign.center,
                  style: AppStyle.textstyleregorange16,
                )),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        // height: getVerticalSize(60),
                        child: PasswordValidatedFields(
                          // textStyle: AppStyle.textstyleregularform16,
                          cursorColor: ColorConstant.black900,
                          inputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20), vertical: getVerticalSize(0)),
                            hintText: 'Create a password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      SendButton(
                          buttonTitle: 'Verify',
                          buttonColor: ColorConstant.xenteblue,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Get.toNamed(AppRoutes.companyDetailsScreen);
                              
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
