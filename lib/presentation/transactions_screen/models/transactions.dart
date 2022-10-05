import 'package:hydrus/core/app_export.dart';

class TransactionModel {
  static final transactions = [
    Transaction(
        companyName: "NWSC",
        date: "07 May, 09:30 AM",
        amount: "Ugx 230,000",
        image: ImageConstant.imgNwsc1),
    Transaction(
        companyName: "UMEME",
        date: "09 May, 07:30 PM",
        amount: "Ugx 160,000",
        image: ImageConstant.imgUmeme1),
    Transaction(
        companyName: "Nike Store",
        date: "11 May, 12:25 PM",
        amount: "Ugx 958,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/7.jpg"),
    Transaction(
        companyName: "DSTV",
        date: "15 June, 10:25 AM",
        amount: "Ugx 890,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/6.jpg"),
    Transaction(
        companyName: "KCCA",
        date: "19 June, 12:25 PM",
        amount: "Ugx 100,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/5.jpg"),
    Transaction(
        companyName: "Nike Store",
        date: "11 May, 12:25 PM",
        amount: "Ugx 958,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/7.jpg"),
    Transaction(
        companyName: "DSTV",
        date: "15 June, 10:25 AM",
        amount: "Ugx 890,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/6.jpg"),
    Transaction(
        companyName: "KCCA",
        date: "19 June, 12:25 PM",
        amount: "Ugx 100,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/5.jpg"),
    Transaction(
        companyName: "Nike Store",
        date: "11 May, 12:25 PM",
        amount: "Ugx 958,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/7.jpg"),
    Transaction(
        companyName: "DSTV",
        date: "15 June, 10:25 AM",
        amount: "Ugx 890,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/6.jpg"),
    Transaction(
        companyName: "KCCA",
        date: "19 June, 12:25 PM",
        amount: "Ugx 100,000",
        image:
            "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/5.jpg"),
  ];
}

class Transaction {
  final String image;
  final String companyName;
  final String date;
  final String amount;

  Transaction(
      {required this.companyName,
      required this.date,
      required this.amount,
      required this.image});
}
