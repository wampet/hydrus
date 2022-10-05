// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/setup_company_screen/controller/setup_company_controller.dart';

class SetupCompanyScreen extends GetWidget<SetupCompanyController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
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
          backgroundColor: Colors.grey[50]),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20), vertical: getVerticalSize(10)),
          decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Set up your company',
                  style: kHeadingStyle,
                )),
                Center(
                    child: Text(
                  'Tell us more about your company',
                  textAlign: TextAlign.center,
                  style: kBRegularStyle,
                )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        title: 'Your company name',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: 'Your account name',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: 'Industry',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: 'Your role',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: 'How did you hear about us?',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SubmitButton(
                          buttonTitle: 'Create  Account',
                          buttonIcon: Icons.save_as_outlined,
                          buttonColor: kOrange,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushNamed(context, '/login_screen');
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
