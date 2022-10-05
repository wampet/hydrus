import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/transactions_screen/models/transactions.dart';
import 'package:hydrus/presentation/transactions_screen/widgets/transactions_card_item.dart';

import 'controller/transactions_controller.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends GetWidget<TransactionsController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: WidgetAppBar(
          title: 'Manage Transactions',
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavBarFb5(),
        body: ListView.builder(
            itemCount: TransactionModel.transactions.length,
            itemBuilder: (context, index) {
              return TransactionsCard(
                  transaction: TransactionModel.transactions[index]);
            }),
      ),
    );
  }
}
