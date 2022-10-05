import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class HomeScreenTopCard extends StatelessWidget {
  //This container is used for the bottom sheet drawer
  HomeScreenTopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(getHorizontalSize(20), getVerticalSize(0),
          getHorizontalSize(10), getVerticalSize(5)),
      child: Container(
        height: getVerticalSize(140),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Your current Balance',
                    style: AppStyle.textstylexenteblue16,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Text(
                        '+Add Funds',
                        style: AppStyle.textstyleorangemedium20,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return Container(
                                constraints: BoxConstraints(
                                    minHeight: 100,
                                    minWidth: double.infinity,
                                    maxHeight: 800),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    )),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: getVerticalSize(50),
                                    ),
                                    CustomCard(
                                      iconUsed: Icons.phone_android_outlined,
                                      cardLabel:
                                          "Add funds from your mobile money account"
                                              .tr,
                                      cardHeading: "Mobile Money",
                                      navigationFunction: () {
                                        Get.toNamed(AppRoutes
                                            .addMoneyMobileMoneyScreen);
                                      },
                                    ),
                                    SizedBox(
                                      width: getHorizontalSize(330),
                                      child: Divider(
                                        color: ColorConstant.black900,
                                      ),
                                    ),
                                    CustomCard(
                                        navigationFunction: () {
                                          Get.toNamed(
                                              AppRoutes.addMoneyBankScreen);
                                        },
                                        iconUsed: Icons.business_outlined,
                                        cardLabel:
                                            "Add funds from your bank account"
                                                .tr,
                                        cardHeading: "Bank"),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: getVerticalSize(10),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '40,000', style: AppStyle.textstylereggrey32),
                    TextSpan(
                      text: 'UGX',
                      style: AppStyle.textstylereggrey20,
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
