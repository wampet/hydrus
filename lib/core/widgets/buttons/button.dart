import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrus/core/app_export.dart';

class CustomButton extends StatelessWidget {
  //
  CustomButton(
      {required this.buttonTitle,
      required this.buttonIcon,
      required this.buttonColor,
      required this.navigationFunction});
  final String buttonTitle;
  final VoidCallback navigationFunction;
  final IconData buttonIcon;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHorizontalSize(50),
      margin: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(20), vertical: getHorizontalSize(20)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: InkWell(
        onTap: navigationFunction,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(10),
              vertical: getHorizontalSize(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                buttonTitle,
                style: AppStyle.buttontextstyleregular18,
              ),
              SizedBox(
                width: getHorizontalSize(60),
              ),
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Submission Button
class SubmitButton extends StatelessWidget {
  SubmitButton(
      {required this.buttonTitle,
      this.buttonIcon,
      required this.buttonColor,
      required this.function});
  final String buttonTitle;
  final Function function;
  final IconData? buttonIcon;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(50),
      margin: EdgeInsets.symmetric(vertical: getHorizontalSize(20)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(10),
              vertical: getHorizontalSize(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                buttonTitle,
                style: AppStyle.buttontextstyleregular18,
              ),
              SizedBox(
                width: getHorizontalSize(60),
              ),
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//This is the send or submit button
class SendButton extends StatelessWidget {
  SendButton(
      {required this.buttonTitle,
      required this.buttonColor,
      required this.function});
  final String buttonTitle;
  final Function function;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: getHorizontalSize(308),
      height: getVerticalSize(60),
      margin: EdgeInsets.symmetric(vertical: getVerticalSize(20)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: AppStyle.buttontextstyleregular20,
          ),
        ),
      ),
    );
  }
}

class AttachButton extends StatelessWidget {
  AttachButton({required this.buttonTitle, this.function});
  final String buttonTitle;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getVerticalSize(70),
          margin: EdgeInsets.symmetric(vertical: getHorizontalSize(20)),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.07),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: DottedBorder(
              color: Colors.black.withOpacity(0.07),
              borderType: BorderType.RRect,
              radius: Radius.circular(15),
              child: InkWell(
                onTap: () async {
                  //Using the file picker to choose a file from the device
                  final result = await FilePicker.platform.pickFiles();
                  //In case we do not pick any file
                  if (result == null) return;

                  ///Open the single file from the results
                  final file = result.files.first;
                  openFile(file);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    buttonTitle,
                    style: AppStyle.textstyleregularattachbuttonform16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

//STEP THREE
  Future<File> saveFilePermanently(PlatformFile file) async {
    //App Storage where we can save our file
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

//STEP TWO
//We use the open file package to open the file
  void openFile(PlatformFile file) async {
    OpenFile.open(file.path);

    //We can also access information from what has been selected
    print('Name: ${file.name}');
    print('Bytes: ${file.bytes}');
    print('Size: ${file.size}');
    print('Extension: ${file.extension}');
    print('Path: ${file.path}');

//Save the cached file permanently
    final newFile = await saveFilePermanently(file);
    print('From Path:${file.path!}');
    print('To Path:${newFile.path}');
  }
}
