import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class HomeIndividualNavigationCard extends StatelessWidget {
  HomeIndividualNavigationCard(
      {required this.cardIcon,
      required this.cardLabel,
      required this.navigationFunction});
  final IconData cardIcon;
  final String cardLabel;
  final VoidCallback navigationFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      height: getVerticalSize(100.0),
      width: getHorizontalSize(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: kElevationToShadow[1],
      ),
      child: InkWell(
        onTap: navigationFunction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              cardIcon,
              color: ColorConstant.orange400,
              size: getSize(30.0),
            ),
            SizedBox(height: getVerticalSize(10)),
            Center(
              child: Text(
                cardLabel,
                textAlign: TextAlign.center,
                style: AppStyle.textstyleregular13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
