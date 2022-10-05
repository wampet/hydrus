import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/home_screen/models/home_row_navigation_card_model.dart';

import 'controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBar(
          title: '',
        ),
        bottomNavigationBar: BottomNavBarFb5(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20),
                vertical: getVerticalSize(20)),
            child: Column(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(20),
                        vertical: getVerticalSize(50)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hello Peter',
                        style: AppStyle.textstylebluegray20,
                      ),
                    ),
                  ),
                ],
              ),
              HomeScreenTopCard(),
              Container(
                height: getVerticalSize(350),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: HomeNavigationCardModel.homeNavigationCard.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // width: 100,
                      child: HomeRowNavigationCards(
                          homeNavigationCard: HomeNavigationCardModel
                              .homeNavigationCard[index]),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ]),
          )),
        ));
  }
}
