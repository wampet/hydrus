import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/my_flutter_app_icons.dart';

class HomeNavigationCardModel {
  static final homeNavigationCard = [
    HomeNavigationCard(
        icon: Icons.phone_android,
        cardtitle: "Mobile Money",
        route: AppRoutes.sendMobileMoneyScreen),
    HomeNavigationCard(
        icon: Icons.phonelink_ring_rounded,
        cardtitle: "Airtime",
        route: AppRoutes.sendAirtimeScreen),
    HomeNavigationCard(
        icon: MyFlutterApp.rss_1,
        cardtitle: "Internet",
        route: AppRoutes.sendInternetScreen),
    HomeNavigationCard(
        icon: FontAwesomeIcons.buildingColumns,
        cardtitle: "Bank Transfer",
        route: AppRoutes.sendBankScreen),
    HomeNavigationCard(
        icon: Icons.grading_sharp,
        cardtitle: "Bills and Taxes",
        route: AppRoutes.transactionsScreen),
    HomeNavigationCard(
        icon: MyFlutterApp.exchange,
        cardtitle: "Transfers",
        route: AppRoutes.addMoneyMobileMoneyScreen),
  ];
}

class HomeNavigationCard {
  final IconData icon;
  final String cardtitle;
  final String route;

  HomeNavigationCard({
    required this.icon,
    required this.cardtitle,
    required this.route,
  });
}
