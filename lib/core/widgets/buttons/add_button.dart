import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class AddButton extends StatelessWidget {
  AddButton(
      {required this.buttonTitle,
      required this.buttonColor,
      required this.function});
  final String buttonTitle;
  final Function function;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(50),
      margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              buttonTitle,
              style: AppStyle.buttontextstyleregular18,
            ),
          ),
        ),
      ),
    );
  }
}
