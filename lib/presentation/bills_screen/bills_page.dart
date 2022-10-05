import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/bills_screen/controller/bills_controller.dart';
import 'package:hydrus/presentation/bills_screen/models/bills_model.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class BillsScreen extends StatelessWidget {
  BillsController controller = Get.put(BillsController(BillsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
