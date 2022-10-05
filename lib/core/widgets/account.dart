import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class SwitchAccountText extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  final Color kolor;
  const SwitchAccountText(
      {Key? key,
      required this.text1,
      required this.fontSize,
      required this.kolor,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(10), vertical: getHorizontalSize(10)),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: text1, style: AppStyle.textstyleregular16),
          TextSpan(
              text: text2,
              style: TextStyle(
                fontSize: fontSize,
                color: kolor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/login');
                })
        ]),
        textAlign: TextAlign.start,
      ),
    );
  }
}

//This is for the terms and conditions hyperlinks
class TermsText extends StatelessWidget {
  final String text1;
  final String text2;
  const TermsText({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(10), vertical: getHorizontalSize(10)),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: kBlueTerms,
            recognizer: TapGestureRecognizer()..onTap = () {}),
        TextSpan(text: ' | ', style: AppStyle.textstyleregular16),
        TextSpan(
            text: text2,
            style: kBlueTerms,
            recognizer: TapGestureRecognizer()..onTap = () {}),
      ])),
    );
  }
}

class HyperLink extends StatelessWidget {
  //This is for when someone has an account and they are tap to switch to the login screen
  final String text1;
  final double fontSize;
  final Color kolor;
  // final Function navigationFunction;
  const HyperLink({
    Key? key,
    required this.text1,
    required this.kolor,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(10), vertical: getHorizontalSize(10)),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: AppStyle.textstyleregular16,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/open_an_account_screen');
              })
      ])),
    );
  }
}
