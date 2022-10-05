import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class BottomBillsCard extends StatelessWidget {
  BottomBillsCard(
      {required this.cardIcon,
      required this.cardLabel,
      required this.navigationFunction});
  final IconData cardIcon;
  final String cardLabel;
  final VoidCallback navigationFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0x6639D2C0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Icon(
                Icons.monetization_on_rounded,
                size: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_NWSC".tr,
                  style: AppStyle.textstyleregular20,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    "lbl_bills_card".tr,
                    style: AppStyle.textstyleregular13,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "lbl_amount_bills_card".tr,
                style: AppStyle.textstyleregular20,
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
