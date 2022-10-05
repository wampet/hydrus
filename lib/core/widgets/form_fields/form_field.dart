import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  final String? Function(String?)? validateFunction;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  void Function(String)? onChanged;

  CustomFormField(
      {Key? key,
      this.controller,
      required this.title,
      required this.validateFunction,
      this.onChanged,
      this.hintText,
      this.errorText,
      this.initialValue})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
      child: SizedBox(
        child: TextFormField(
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

class CustomFormzField extends StatelessWidget {
  final String? errorText;
  final String hintText;
  void Function(String)? onChanged;
  final String initialValue;
  CustomFormzField(
      {Key? key,
      required this.hintText,
      required this.errorText,
      required this.initialValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: initialValue,
        key: const Key('signUpForm_nameInput_textField'),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.76)),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        ),
      ),
    );
  }
}
