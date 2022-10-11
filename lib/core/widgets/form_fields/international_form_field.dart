import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hydrus/core/app_export.dart';

class CustomInternationalFormField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validateFunction;

  CustomInternationalFormField({Key? key, this.controller, required this.title, required this.validateFunction, bool isPassword = false}) : super(key: key);

  @override
  State<CustomInternationalFormField> createState() => _CustomInternationalFormFieldState();
}

class _CustomInternationalFormFieldState extends State<CustomInternationalFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
      child: IntlPhoneField(
        disableLengthCheck: true,
        controller: widget.controller,
        flagsButtonMargin: EdgeInsets.symmetric(horizontal: getVerticalSize(20)),
        cursorColor: ColorConstant.black900,
        showDropdownIcon: false,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          hintText: widget.title,
          labelStyle: AppStyle.textstyleregularform16,
          contentPadding: EdgeInsets.symmetric(horizontal: getHorizontalSize(0), vertical: getVerticalSize(0)),
        ),
        initialCountryCode: 'UG',
      ),
    );
  }
}
