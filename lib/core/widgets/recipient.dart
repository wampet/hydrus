import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class AddCustomerCardCheck extends StatefulWidget {
  //This container is used for the bottom sheet drawer
  //This is for the ones in the bottom sheet
  AddCustomerCardCheck({
    required this.cardHeading,
    required this.cardLabel,
  });

  final String cardLabel;
  final String cardHeading;

  @override
  State<AddCustomerCardCheck> createState() => _AddCustomerCardCheckState();
}

class _AddCustomerCardCheckState extends State<AddCustomerCardCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getVerticalSize(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                  leading: Icon(
                    Icons.circle,
                    size: getSize(50),
                    color: ColorConstant.gray400,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.cardHeading,
                          style: AppStyle.textstyleregular16),
                      SizedBox(
                        height: getVerticalSize(5),
                      ),
                      Text(widget.cardLabel,
                          style: AppStyle.textstyleregular13),
                    ],
                  ),
                  trailing: AddCustomerBottomDrawer()),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCustomerBottomDrawer extends StatefulWidget {
  const AddCustomerBottomDrawer({Key? key}) : super(key: key);

  @override
  State<AddCustomerBottomDrawer> createState() =>
      _AddCustomerBottomDrawerState();
}

class _AddCustomerBottomDrawerState extends State<AddCustomerBottomDrawer> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        activeColor: ColorConstant.orange400,
        value: isChecked,
        onChanged: (newValue) {
          setState(() {
            isChecked = newValue!;
          });
        });
  }
}

class RecipientCard extends StatelessWidget {
//This is for the cards in the slider
  //This is for the ones in the Slider
  RecipientCard({
    required this.navigationFunction,
    required this.cardHeading,
    required this.cardLabel,
  });
  final VoidCallback navigationFunction;

  final String cardLabel;
  final String cardHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: navigationFunction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: getSize(50),
                color: ColorConstant.gray400,
              ),
              SizedBox(height: getVerticalSize(5)),
              Text(cardHeading, style: AppStyle.textstyleregular16),
              SizedBox(height: getVerticalSize(3)),
              Text(cardLabel, style: AppStyle.textstyleregular13),
            ],
          ),
        ),
      ),
    );
  }
}
