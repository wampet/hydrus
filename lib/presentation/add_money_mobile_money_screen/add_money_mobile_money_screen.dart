import 'package:hydrus/core/app_export.dart';
import 'controller/add_money_mobile_money_controller.dart';
import 'package:flutter/material.dart';

class AddMoneyMobileMoneyScreen
    extends GetWidget<AddMoneyMobileMoneyController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: WidgetAppBar(
        title: 'Add Funds to Mobile Money',
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBarCurvedFb1(),
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                      CustomInternationalFormField(
                        title: 'Phone Number',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SendButton(
                          buttonTitle: 'Add Funds',
                          buttonColor: ColorConstant.orange400,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushNamed(
                                  context, '/verify_account_screen');
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ))),
      ),
    );
  }
}
