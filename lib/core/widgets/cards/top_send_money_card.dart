import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class TopSendMoneyCard extends StatelessWidget {
  TopSendMoneyCard({
    required this.navigationFunction,
    required this.cardContact,
    required this.cardName,
    this.color,
  });
  final VoidCallback navigationFunction;

  final String cardName;
  final String cardContact;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: navigationFunction,
          child: ListTile(
            leading: Icon(
              Icons.circle,
              size: getSize(50),
              color: ColorConstant.gray400,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardName, style: AppStyle.textstyleregular16),
                SizedBox(
                  height: getVerticalSize(5),
                ),
                Text(cardContact, style: AppStyle.textstyleregular13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
