import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

// Create a Form widget.
class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({Key? key}) : super(key: key);

  @override
  AboutYouScreenState createState() {
    return AboutYouScreenState();
  }
}

class AboutYouScreenState extends State<AboutYouScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController otherNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                    'About you',
                    style: AppStyle.textstyleregular25,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Center(
                  child: Text(
                    'Share with us more about you',
                    textAlign: TextAlign.center,
                    style: AppStyle.textstyleregorange16,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        title: 'Your first name',
                        controller: firstNameController,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill out this field';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        title: 'Your other names',
                        controller: otherNameController,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill out this field';
                          }
                          return null;
                        },
                      ),
                      CustomInternationalFormField(
                        title: 'Phone number',
                        controller: phoneController,
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill out this field';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getVerticalSize(40),
                      ),
                      SendButton(
                          buttonTitle: 'Next step',
                          buttonColor: ColorConstant.xenteblue,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              db.put("first_name", firstNameController.text.trim());
                              db.put("other_name", otherNameController.text.trim());
                              db.put("phone", phoneController.text.trim());
                              Get.toNamed(AppRoutes.passwordScreen);
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
