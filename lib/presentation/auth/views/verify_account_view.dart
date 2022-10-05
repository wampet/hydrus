// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:hydrus/core/app_export.dart';

// class VerifyAccountScreen extends StatefulWidget {
//   const VerifyAccountScreen({Key? key}) : super(key: key);

//   @override
//   VerifyAccountScreenState createState() {
//     return VerifyAccountScreenState();
//   }
// }

// class VerifyAccountScreenState extends State<VerifyAccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Center(
//           child: SizedBox(
//             width: getHorizontalSize(348),
//             child: Column(
//               children: <Widget>[
     
//                 SubmitButton(
//                     buttonTitle: 'Verify Email',
//                     buttonIcon: Icons.vpn_key_outlined,
//                     buttonColor: kBlack,
//                     function: () {
//                       Get.toNamed(AppRoutes.verifyEmailScreen);
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
