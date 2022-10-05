import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String contact;

  const Accordion({
    Key? key,
    required this.title,
    required this.contact,
  }) : super(key: key);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getVerticalSize(5)),
      child: Column(children: [
        ListTile(
          leading: Icon(
            Icons.circle,
            size: getSize(50),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppStyle.textstylebluegray20,
              ),
              Text(
                widget.contact,
                style: AppStyle.textstyleregular16,
              ),
            ],
          ),
          trailing: IconButton(
            iconSize: 35,
            icon: Icon(_showContent
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Column(
                children: [
                  AccordionCustomCard(
                    navigationFunction: () {
                      Get.toNamed(AppRoutes.payPeopleMobileMoneyTwoScreen);
                    },
                    cardLabel: 'Mobile Money',
                  ),
                  AccordionCustomCard(
                    navigationFunction: () {
                      Get.toNamed(AppRoutes.payPeopleBankTransferScreen);
                    },
                    cardLabel: 'Bank Transfer',
                  ),
                  AccordionCustomCard(
                    navigationFunction: () {},
                    cardLabel: 'Airtime',
                  ),
                  AccordionCustomCard(
                    navigationFunction: () {
                      Get.toNamed(AppRoutes.payPeopleInternetScreen);
                    },
                    cardLabel: 'Internet',
                  ),
                ],
              )
            : Container()
      ]),
    );
  }
}

class AccordionCustomCard extends StatelessWidget {
  //this is used in the accordion drop down for th pay screen
  AccordionCustomCard({
    required this.navigationFunction,
    required this.cardLabel,
  });
  final VoidCallback navigationFunction;
  final String cardLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: navigationFunction,
              child: Text(
                cardLabel,
                style: AppStyle.textstyleregular16,
              ),
            ),
            SizedBox(
              width: getHorizontalSize(308),
              child: Divider(
                color: ColorConstant.bluegray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
