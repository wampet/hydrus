import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/widgets/form_fields/password.dart';
import 'package:hydrus/presentation/auth/password_screen/widgets/requirement_widget.dart';

class PasswordValidatedFields extends StatefulWidget {
  /// Password `validation` is given at the bottom which can be `modified` accordingly.
  final InputDecoration? inputDecoration;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final void Function()? onEditComplete;
  final String Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Color? cursorColor;
  final TextStyle? textStyle;

  /// Password requirements attributes
  /// iconData for the icons when requirement is completed
  final IconData? activeIcon;

  /// iconData for the icons when the requirement is incomplete/inActive
  final IconData? inActiveIcon;

  /// color of the text when requirement is completed
  final Color? activeRequirementColor;
  // color of the text when the requirement is not completed/inActive
  final Color? inActiveRequirementColor;

  PasswordValidatedFields({
    Key? key,
    this.inputDecoration = const InputDecoration(
        hintText: "Enter password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder()),
    this.textEditingController,
    this.textInputAction = TextInputAction.done,
    this.onEditComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.cursorColor,
    this.textStyle,
    this.inActiveIcon = Icons.check_circle_outline_rounded,

    /// [default activeIcon]
    this.activeIcon = Icons.check_circle_rounded,

    /// [default inActive Color]
    this.inActiveRequirementColor = Colors.grey,

    /// [default active color]
    this.activeRequirementColor = Colors.black,
  }) : super(key: key);

  @override
  _PasswordValidatedFieldsState createState() =>
      _PasswordValidatedFieldsState();
}

class _PasswordValidatedFieldsState extends State<PasswordValidatedFields> {
  String _pass = "";
  final TextEditingController _passw = TextEditingController();
  final TextEditingController _confirmPassw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            textInputAction: widget.textInputAction,
            controller: _passw,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: widget.inputDecoration,
            onEditingComplete: widget.onEditComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            cursorColor: widget.cursorColor,
            style: widget.textStyle,
            onChanged: (value) {
              setState(() {
                _pass = value;
                print(_pass);
              });
            },
            validator: passwordValidation,
          ),
          SizedBox(
            height: getVerticalSize(20),
          ),
          //I have added my custom field as well
          PasswordFormField(
            title: 'Confirm your password',
            validateFunction: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (value != _passw.text) {
                return '*Password doesn\'t match';
              }
              return null;
            },
          ),

          /// [default requirements]
          /// `8 character length` requirement
          PassCheckRequirements(
            passCheck: _pass.length >= 8,
            requirementText: "Atleast 8 characters",
          ),

          /// `1 lowercase` requirement
          PassCheckRequirements(
            passCheck: _pass.contains(RegExp(r'[a-z]')),
            requirementText: "Atleast 1 Lower case letter (a-z)",
          ),

          /// `1 Upper case` requirement
          PassCheckRequirements(
            passCheck: _pass.contains(RegExp(r'[A-Z]')),
            requirementText: "Atleast 1 Upper case letter (A-Z)",
          ),

          /// `1 numeric value` requirement
          PassCheckRequirements(
            passCheck: _pass.contains(RegExp(r'[0-9]')),
            requirementText: "Atleast 1 Number (0-9)",
          ),
        ],
      ),
    );
  }

  ///The following are the conditions for the password to pass
  /// [password validation]
  /// 1 Uppercase
  /// 1 lowercase
  /// 1 numeric value
  /// 1 special character
  /// 8 length password

  /// In case one  wants to `modify` the requirements change the `RegExp` given below
  String? passwordValidation(String? value) {
    bool passValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')

        /// [RegExp]
        .hasMatch(value!);
    if (value.isEmpty) {
      return "Password cannot be empty!";
    } else if (!passValid) {
      return "Requirement(s) missing!";
    }
    return null;
  }
}
