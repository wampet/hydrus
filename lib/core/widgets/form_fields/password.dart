import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  final String? Function(String?)? validateFunction;
  void Function(String)? onChanged;

  PasswordFormField({
    Key? key,
    this.controller,
    required this.title,
    required this.validateFunction,
    this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
      child: SizedBox(
        child: TextFormField(
          obscureText: true,
          onChanged: (value) {},
          controller: widget.controller,
          cursorColor: ColorConstant.black900,
          decoration: InputDecoration(
            hintStyle: AppStyle.textstylegrey16,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.76)),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            hintText: widget.title,
            labelStyle: AppStyle.textstyleregularform16,
            contentPadding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20),
                vertical: getVerticalSize(0)),
          ),
          validator: widget.validateFunction,
        ),
      ),
    );
  }
}
