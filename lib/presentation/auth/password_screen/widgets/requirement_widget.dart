import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

class PassCheckRequirements extends StatelessWidget {
  /// a `bool` value as check [required] field in case you want to `modify` the package
  final bool? passCheck;

  /// requirement text [required] field in case you want to `modify` the package
  final String? requirementText;

  /// IconData when requirement is completed
  final IconData? activeIcon;

  /// IconData when requirement is not completed/inActive
  final IconData? inActiveIcon;

  /// inActive color
  final Color? inActiveColor;

  /// Active color
  final Color? activeColor;

  PassCheckRequirements({
    Key? key,
    @required this.passCheck,

    /// [required parameters] in case you want to modify the package
    @required this.requirementText,

    /// [required parameters] in case you want to modify the package

    /// [default] value of in-active IconData
    this.inActiveIcon = Icons.check,

    /// [default] value of active IconData
    this.activeIcon = Icons.check,

    /// [default] color of in-active field
    this.inActiveColor = Colors.grey,

    /// [default] color of active field
    this.activeColor = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        children: [
          /// requirement IconData based on check!
          passCheck!
              ? Icon(
                  Icons.check,
                  color: activeColor,
                  size: getSize(20),
                )
              : Icon(
                  Icons.check,
                  color: inActiveColor,
                  size: getSize(20),
                ),
          SizedBox(width: 8.0),

          /// requirement text
          Text(
            requirementText!,
            style: TextStyle(
              fontSize: getFontSize(16),
              color: passCheck! ? activeColor : inActiveColor,
            ),
          )
        ],
      ),
    );
  }
}
