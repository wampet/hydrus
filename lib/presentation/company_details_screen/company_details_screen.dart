import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';

// Create a Form widget.
class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({Key? key}) : super(key: key);

  @override
  CompanyDetailsScreenState createState() {
    return CompanyDetailsScreenState();
  }
}

class CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
  String? chosenValue;
  final _dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get roleDropDownItems {
    List<DropdownMenuItem<String>> roleItems = [
      DropdownMenuItem(child: Text("Owner"), value: "Owner"),
      DropdownMenuItem(child: Text("Management"), value: "Management"),
      DropdownMenuItem(
          child: Text("Finance & Administration"),
          value: "Finance & Administration"),
      DropdownMenuItem(child: Text("IT"), value: "IT"),
      DropdownMenuItem(child: Text("Other"), value: "Other"),
    ];
    return roleItems;
  }

  List<DropdownMenuItem<String>> get industryDropDownItems {
    List<DropdownMenuItem<String>> industryItems = [
      DropdownMenuItem(
          child: Text("Agriculture and Forestry"),
          value: "Agriculture and Forestry"),
      DropdownMenuItem(
          child: Text("Wildlife And Forestry"), value: "Wildlife And Forestry"),
      DropdownMenuItem(
          child: Text("Computer And Electronics"),
          value: "Finance & Administration"),
      DropdownMenuItem(
          child: Text("Business And Information"),
          value: "Computer And Electronics"),
      DropdownMenuItem(
          child: Text("Construction And Utilities And Contracting"),
          value: "Construction And Utilities And Contracting"),
      DropdownMenuItem(child: Text("Education"), value: "Education"),
      DropdownMenuItem(
          child: Text("Finance And Insurance"), value: "Finance And Insurance"),
      DropdownMenuItem(
          child: Text("Food And Hospitality"), value: "Food And Hospitality"),
      DropdownMenuItem(child: Text("Gaming"), value: "Gaming"),
      DropdownMenuItem(child: Text("Health"), value: "Health"),
      DropdownMenuItem(child: Text("Chemical"), value: "Chemical"),
      DropdownMenuItem(
          child: Text("Motor Vehicle And Automotive"),
          value: "Motor Vehicle And Automotive"),
      DropdownMenuItem(
          child: Text("Natural Resources"), value: "Natural Resources"),
      DropdownMenuItem(child: Text("Personal"), value: "Personal"),
      DropdownMenuItem(
          child: Text("Real Estate And Housing"),
          value: "Real Estate And Housing"),
      DropdownMenuItem(
          child: Text("Safety And Security"), value: "Safety And Security"),
      DropdownMenuItem(child: Text("Legal"), value: "Legal"),
      DropdownMenuItem(child: Text("Transportation"), value: "Transportation"),
      DropdownMenuItem(child: Text("Other"), value: "Other2"),
    ];
    return industryItems;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: kOrange,
            iconSize: 30,
          ),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20),
              vertical: getVerticalSize(100)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20), vertical: getVerticalSize(20)),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Finally, your company details',
                  style: AppStyle.textstyleregular25,
                )),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Center(
                    child: Text(
                  'Tell us more about your company',
                  textAlign: TextAlign.center,
                  style: AppStyle.textstyleregorange16,
                )),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your company name',
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylegrey16,
                          ),
                          CustomFormField(
                            title:
                                'As it appears on your certificate of incorporation',
                            validateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is the purpose for this account',
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylegrey16,
                          ),
                          CustomFormField(
                            title:
                                'e.g. Operations or Marketing or Project/Branch name',
                            validateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Industry this company is in',
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylegrey16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getVerticalSize(10)),
                            child: DropdownButtonFormField(
                                iconSize: 0.0,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  hintStyle: AppStyle.textstylegrey16,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.76)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Select industry',
                                  labelStyle: AppStyle.textstyleregularform16,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(20),
                                      vertical: getVerticalSize(0)),
                                ),
                                validator: (value) =>
                                    value == null ? "Select industry" : null,
                                dropdownColor: Colors.white,
                                value: chosenValue,
                                onChanged: (String? newcValue) {
                                  setState(() {
                                    chosenValue = newcValue!;
                                  });
                                },
                                items: industryDropDownItems),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What do you do in this company',
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylegrey16,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getVerticalSize(10)),
                            child: DropdownButtonFormField(
                                iconSize: 0.0,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  hintStyle: AppStyle.textstylegrey16,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.76)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Select',
                                  labelStyle: AppStyle.textstyleregularform16,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(20),
                                      vertical: getVerticalSize(0)),
                                ),
                                validator: (value) =>
                                    value == null ? "Select" : null,
                                dropdownColor: Colors.white,
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: roleDropDownItems),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How did you hear about xente',
                            textAlign: TextAlign.left,
                            style: AppStyle.textstylegrey16,
                          ),
                          CustomFormField(
                            title:
                                'Input your referral code below if you have one',
                            validateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
                      ),
                      SendButton(
                          buttonTitle: 'Create account',
                          buttonColor: ColorConstant.xenteOrange,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Get.toNamed(AppRoutes.loginScreen);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
