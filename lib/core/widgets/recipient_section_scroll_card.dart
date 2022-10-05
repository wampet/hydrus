import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class BottomSheetRecipientCard extends StatelessWidget {
  //This container is used for the bottom sheet drawer
  //This is for the ones in the bottom sheet
  BottomSheetRecipientCard({
    required this.navigationFunction,
    required this.cardHeading,
    required this.cardLabel,
    this.color,
  });
  final VoidCallback navigationFunction;

  final String cardLabel;
  final String cardHeading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: navigationFunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.circle,
                size: getSize(50),
                color: ColorConstant.gray400,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardHeading, style: AppStyle.textstyleregular16),
                  Text(cardLabel, style: AppStyle.textstyleregular13),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
