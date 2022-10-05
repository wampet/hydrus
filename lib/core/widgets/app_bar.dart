import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydrus/core/app_export.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  WidgetAppBar({
    this.title,
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            onPressed: () => {},
            icon: Container(
                height: getSize(40.00),
                width: getSize(40.00),
                child: SvgPicture.asset(ImageConstant.imgBellpin2,
                    fit: BoxFit.fill))),
        IconButton(
            onPressed: () => {},
            icon: Container(
                height: getSize(40.00),
                width: getSize(40.00),
                child: SvgPicture.asset(ImageConstant.imgUsercicrleduo2,
                    fit: BoxFit.fill))),
      ],
      toolbarHeight: preferredSize.height,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: kOrange,
        ),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
      title: Text(title!, style: AppStyle.textstylexenteblue20),
      backgroundColor: ColorConstant.whiteA700,
      centerTitle: true,
      elevation: 0,
    );
  }
}
