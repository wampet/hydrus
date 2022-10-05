import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/transactions_screen/models/transactions.dart';

class TransactionsCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? navigationFunction;
  const TransactionsCard({
    Key? key,
    required this.transaction,
    this.navigationFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(getHorizontalSize(10), getVerticalSize(5),
          getHorizontalSize(10), getVerticalSize(0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: navigationFunction,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0x6639D2C0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Icon(
                      Icons.monetization_on_rounded,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.companyName,
                        style: AppStyle.textstyleregular20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          transaction.date,
                          style: AppStyle.textstyleregular13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      transaction.amount,
                      style: AppStyle.textstyleregular20,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
