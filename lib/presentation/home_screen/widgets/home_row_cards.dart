import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/home_screen/models/home_row_navigation_card_model.dart';

class HomeRowNavigationCards extends StatelessWidget {
  HomeRowNavigationCards({required this.homeNavigationCard});
  final HomeNavigationCard homeNavigationCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: getVerticalSize(100),
            width: getHorizontalSize(100),
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: ColorConstant.lightXenteOrange,
                child: Icon(homeNavigationCard.icon,
                    color: ColorConstant.orange400, size: getSize(30.0)),
                onPressed: () {
                  Navigator.pushNamed(context, homeNavigationCard.route);
                },
                elevation: 0,
              ),
            )),
        Center(
          child: Text(
            homeNavigationCard.cardtitle,
            textAlign: TextAlign.center,
            style: AppStyle.textstyleregular16,
          ),
        ),
      ],
    );
  }
}
