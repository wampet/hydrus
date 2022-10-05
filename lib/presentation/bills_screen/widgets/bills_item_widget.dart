import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/bills_screen/controller/bills_controller.dart';
import 'package:hydrus/presentation/bills_screen/models/bills_item_model.dart';

// ignore: must_be_immutable
class BillsItemWidget extends StatelessWidget {
  BillsItemWidget(this.billsItemModelObj);

  BillsItemModel billsItemModelObj;

  var controller = Get.find<BillsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [Icon(Icons.edit), Icon(Icons.delete)],
          ),
          Row(
            children: [
              Image.asset('hydrus\assets\images\approved.png'),
              Text('NWSC')
            ],
          ),
        ],
      ),
    );
  }
}
