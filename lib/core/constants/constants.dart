
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../app_export.dart';
///////////////////////////////////////////////////////
const baseUrl = 'http://sandbox666353.westeurope.cloudapp.azure.com:5000/api';
final db = Hive.box('app');
const kBorderRadius = 20.0;
const kSpacing = 20.0;
const lockAppIn = 6000; // millisecs to lock the app
const Color kNotifColor = Color.fromRGBO(74, 177, 120, 1);
//const Color kGrayTextColor = Color.fromRGBO(170, 170, 170, 1);
const Color kLightGrayTextColor = Color.fromRGBO(210, 210, 210, 1);
const Color kWhiteTextColor = Color.fromRGBO(255, 255, 255, 1);

const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;




/////////////////////////////////////////////////////////
const kOrange = Color(0xFFFF9933);
const kBlack = Color(0xFF1C1C1C);
const kDarkBlue = Color(0xFF303E67);
const kLightBlue = Color(0xFF7081B9);
Color grayshade = const Color(0xFF9FA4AF);
Color kBlueLink = const Color(0xFF1F65EE);

Color inputField = grayshade.withOpacity(0.3);

const String sharedPreferencesTokenKey = 'token';
const String sharedPreferencesLanguage = 'languageCode';

//TextStyles

var kRegularStyle = TextStyle(
  fontSize: getFontSize(16.0) ,
  color: Colors.white,
);
var kCarouselStyle = TextStyle(
  fontSize: getFontSize(20.0) ,
  color: kBlack,
);
var kBRegularStyle = TextStyle(
  fontSize: getFontSize(16.0) ,
  color: kBlack,
);

var kBlueRegularStyle = TextStyle(
  fontSize: getFontSize(16.0) ,
  color: kDarkBlue,
);

var kBlueLinkStyle = TextStyle(
  fontSize:getFontSize(16.0) ,
  color: kBlueLink,
);
var kBlueTerms = TextStyle(
  fontSize:getFontSize(13.0) ,
  color: kBlueLink,
);

var kButtonStyle = TextStyle(
  fontSize:getFontSize(16.0) ,
  color: Colors.white,
  // fontWeight: FontWeight.w500,
);


var kSplashStyle = TextStyle(
  fontSize: getFontSize(18.0) ,
  color: Colors.white,
  // fontWeight: FontWeight.w500,
);

var ksmallStyle = TextStyle(
  fontSize: getFontSize(18.0) ,
  color: kBlack,
);

var kHeadingStyle = TextStyle(
  fontSize: getFontSize(25.0) ,
  color: kBlack,
  
);
