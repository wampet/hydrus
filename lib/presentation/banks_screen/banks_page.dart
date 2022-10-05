// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

import 'package:hydrus/presentation/banks_screen/controller/banks_controller.dart';

import 'models/banks_model.dart';

class BanksScreen extends StatelessWidget {
  BanksController controller = Get.put(BanksController(BanksModel().obs));
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
                  title: 'Select a bank',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  title: 'Account Name',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  title: 'Amount',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
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
                  title: 'Recipient Email',
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
