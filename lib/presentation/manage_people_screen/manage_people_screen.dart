// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/core/widgets/buttons/add_button.dart';
import 'package:hydrus/presentation/manage_people_screen/controller/manage_people_screen_controller.dart';
import 'package:hydrus/presentation/manage_people_screen/models/manage_people_model.dart';

class ManagePeopleScreen extends StatelessWidget {
  ManagePeopleController controller =
      Get.put(ManagePeopleController(ManagePeopleModel().obs));
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: WidgetAppBar(
          title: 'People',
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Team members, suppliers and beneficiaries',
                    style: kHeadingStyle,
                  ),
                  AddButton(
                      buttonTitle: 'Add People',
                      buttonColor: ColorConstant.orange400,
                      function: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  title: const Text(
                                      'Assign access rights to only your team'),
                                  content: Form(
                                      key: _formKey,
                                      child: Column(children: [
                                        CustomFormField(
                                          title: 'First Name',
                                          validateFunction: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomFormField(
                                          title: 'Last Name',
                                          validateFunction: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomInternationalFormField(
                                          title: 'Enter phone number',
                                          validateFunction: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomFormField(
                                          title: 'Email',
                                          validateFunction: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomFormField(
                                          title: 'Category',
                                          validateFunction: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                        SendButton(
                                            buttonTitle: 'Save',
                                            buttonColor:
                                                ColorConstant.orange400,
                                            function: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                Navigator.pushNamed(context,
                                                    '/verify_account_screen');
                                              }
                                            }),
                                      ])));
                            });
                      }),
                ],
              ),
              DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Full Name',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Category',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Access Level',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Contact',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: AppStyle.textstylemedium16,
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah Doe')),
                      DataCell(Text('Team Member')),
                      DataCell(Text('Admin')),
                      DataCell(Text('0751772772')),
                      DataCell(Text('wampet232@gmail.com')),
                      DataCell(Text('Active')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Janine Yoweri')),
                      DataCell(Text('Member')),
                      DataCell(Text('User')),
                      DataCell(Text('0751772772')),
                      DataCell(Text('wampet232@gmail.com')),
                      DataCell(Text('Offline')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William Gallas')),
                      DataCell(Text('Business')),
                      DataCell(Text('Admin')),
                      DataCell(Text('0751772772')),
                      DataCell(Text('wampet232@gmail.com')),
                      DataCell(Text('Active')),
                    ],
                  ),
                ],
              ),
            ],
          ),
          //     child: CustomWhiteFormContainer(
          //         column: Column(
          //   children: [
          //     Text(
          //       'Assign access rights to only your team',
          //       style: kHeadingStyle,
          //     ),
          //     Form(
          //       key: _formKey,
          //       child: Column(
          //         children: [
          //           CustomFormField(
          //             title: 'First Name',
          //             validateFunction: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Please enter some text';
          //               }
          //               return null;
          //             },
          //           ),
          //           CustomFormField(
          //             isPassword: true,
          //             title: 'Last Name',
          //             validateFunction: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Please enter some text';
          //               }
          //               return null;
          //             },
          //           ),
          //           CustomInternationalFormField(
          //             title: 'Enter phone number',
          //             validateFunction: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Please enter some text';
          //               }
          //               return null;
          //             },
          //           ),
          //           CustomFormField(
          //             title: 'Email',
          //             validateFunction: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Please enter some text';
          //               }
          //               return null;
          //             },
          //           ),
          //           CustomFormField(
          //             title: 'Category',
          //             validateFunction: (value) {
          //               if (value == null || value.isEmpty) {
          //                 return 'Please enter some text';
          //               }
          //               return null;
          //             },
          //           ),
          //           SendButton(
          //               buttonTitle: 'Save',
          //               buttonColor: ColorConstant.orange400,
          //               function: () {
          //                 if (_formKey.currentState!.validate()) {
          //                   _formKey.currentState!.save();
          //                   Navigator.pushNamed(context, '/verify_account_screen');
          //                 }
          //               }),
          //         ],
          //       ),
          //     ),
          //   ],
          // ))),
        ));
  }
}
