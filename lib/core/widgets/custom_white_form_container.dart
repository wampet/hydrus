import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class CustomWhiteFormContainer extends StatelessWidget {
  final Column column;
  const CustomWhiteFormContainer({Key? key, required this.column})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getVerticalSize(10)),
      decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
      child: Align(alignment: Alignment.center, child: column),
    );
  }
}
