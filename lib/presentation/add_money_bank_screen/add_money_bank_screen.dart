import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/add_money_bank_screen/controller/add_money_bank_controller.dart';

// ignore: must_be_immutable
class AddMoneyBankScreen extends GetWidget<AddMoneyBankController> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: WidgetAppBar(
        title: 'Add Funds to Bank Account',
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBarCurvedFb1(),
      body: SingleChildScrollView(
          child: CustomWhiteFormContainer(
              column: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  title: 'Amount',
                  validateFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                AttachButton(
                    buttonTitle: 'Click to browse documents', function: () {}),
                SendButton(
                    buttonTitle: 'Add Funds',
                    buttonColor: ColorConstant.orange400,
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, '/verify_account_screen');
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
