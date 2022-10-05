import 'package:hydrus/core/app_export.dart';

class BillsItemModel {}

class Bills {
  final String description;
  final String logo;

  Bills({required this.description, required this.logo});
}

List<Bills> billsList = [
  Bills(
    description:
        'The best way to pay teams, vendors, and other business beneficiaries',
    logo: ImageConstant.imgSend,
  ),
  Bills(
    description: 'The easy way to collect & track payments',
    logo: ImageConstant.imgCards,
  ),
  Bills(
    description: 'Say goodbye to paperwork, manual work, and busywork',
    logo: ImageConstant.imgApproved,
  ),
  Bills(
    description: 'Supercharge your business growth',
    logo: ImageConstant.imgCards,
  ),
];
