import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class CustomCard extends StatelessWidget {
  //This container is used for the bottom sheet drawer
  CustomCard({
    required this.navigationFunction,
    required this.iconUsed,
    required this.cardHeading,
    required this.cardLabel,
  });
  final VoidCallback navigationFunction;
  final IconData iconUsed;
  final String cardLabel;
  final String cardHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(120),
      margin: EdgeInsets.fromLTRB(getHorizontalSize(10), getVerticalSize(5),
          getHorizontalSize(10), getVerticalSize(0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: navigationFunction,
          child: ListTile(
            leading: Icon(
              iconUsed,
              size: getSize(35),
              color: ColorConstant.orange400,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardHeading, style: AppStyle.textstyleregular16),
                  Text(cardLabel, style: AppStyle.textstyleregular13),
                ],
              ),
            ),
            trailing: Icon(
              Icons.navigate_next_sharp,
              color: ColorConstant.orange400,
            ),
          ),
        ),
      ),
    );
  }
}
