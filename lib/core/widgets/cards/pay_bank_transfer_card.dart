import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class PayBankTransferCard extends StatelessWidget {
  PayBankTransferCard({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getVerticalSize(10)),
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(
            Icons.circle,
            size: getSize(50),
            color: ColorConstant.gray400,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(0),
                    vertical: getVerticalSize(10)),
                child: Text('Amount', style: AppStyle.textstylebold16),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Phone Number: ',
                      style: AppStyle.textstylemedium16),
                  TextSpan(
                      text: '0771123456', style: AppStyle.textstylebluegray16),
                ]),
              ),
              SizedBox(
                height: getVerticalSize(5),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Account No: ', style: AppStyle.textstylemedium16),
                  TextSpan(
                      text: '0100123456789',
                      style: AppStyle.textstylebluegray16),
                ]),
              ),
              SizedBox(
                height: getVerticalSize(5),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Account Name:', style: AppStyle.textstylemedium16),
                  TextSpan(
                      text: ' 0100123456789',
                      style: AppStyle.textstylebluegray16),
                ]),
              ),
              SizedBox(
                height: getVerticalSize(5),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Bank Name: ', style: AppStyle.textstylemedium16),
                    TextSpan(
                        text: 'Stanbic Bank',
                        style: AppStyle.textstylebluegray16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
