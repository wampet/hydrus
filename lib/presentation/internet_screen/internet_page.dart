import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/internet_screen/models/internet_model.dart';

import 'controller/internet_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class InternetPage extends StatelessWidget {
  InternetController controller =
      Get.put(InternetController(InternetModel().obs));

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: WidgetAppBar(
        title: 'Bank Payment',
      ),
      body: SingleChildScrollView(
          child: CustomWhiteFormContainer(
              column: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  title: 'Phone Number',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  title: 'Recipient Name',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  title: 'Data bundles',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  title: 'Reason',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                AttachButton(
                    buttonTitle: 'Click to add supporting documents',
                    function: () {}),
                SendButton(
                    buttonTitle: 'Send',
                    buttonColor: ColorConstant.orange400,
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    }),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
