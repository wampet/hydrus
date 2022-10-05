import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class AppDropDownButton<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T> onChanged;
  final T value;
  final bool isEnabled;
  final bool isBorder;
  final double radius;
  final TextStyle? textStyle;
  final Color? color;
  final Widget? icon;

  const AppDropDownButton({
    Key? key,
    required this.dropdownMenuItemList,
    required this.onChanged,
    required this.value,
    this.isEnabled = true,
    this.isBorder = false,
    this.radius = 10.0,
    this.textStyle,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  _AppDropDownButtonState createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            border: widget.isBorder
                ? Border.all(
                    color: ColorConstant.gray100,
                    width: 0,
                  )
                : Border(),
            color: widget.isEnabled
                ? (widget.color ?? Colors.black)
                : ColorConstant.xenteOrange),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            itemHeight: 50.0,
            style: (widget.textStyle ?? AppStyle.buttontextstyleregular18)
                .copyWith(
                    color: widget.isEnabled
                        ? ColorConstant.xenteOrange
                        : ColorConstant.indigoA70099),
            items: widget.dropdownMenuItemList,
            onChanged: widget.onChanged,
            value: widget.value,
            dropdownColor: Colors.white,
            // iconEnabledColor: ColorConstant.grey,
            icon: widget.icon ?? Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }
}
