

// import 'package:user_repository/user_repository.dart';

// class UserRepository {
//   User? _user;

//   Future<User?> getUser() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return _user ?? User.empty;
//   }

//   Future<void> updateAboutYou({
//     required String firstName,
//     required String lastName,
//     required String phoneNumber,
//   }) async {
//     _user ??= User.empty;
//     await Future.delayed(const Duration(seconds: 1));
//     _user = _user?.copyWith(
//       AboutYou: AboutYou(firstname: firstname, lastName: lastName, phoneNumber: phoneNumber),
//     );
//   }

//   Future<void> updateCompanyDetails({
//       required  String businessName,
//     required  String countryCode,
//     required  String currencyCode,
//     required  String website,
//     required  String ipnUri,
//   }) async {
//     _user ??= User.empty;
//     await Future.delayed(const Duration(seconds: 1));
//     _user = _user?.copyWith(
//       CompanyDetails: CompanyDetails(
//   businessName:businessName ,
//   countryCode:countryCode ,
//   currencyCode: currencyCode,
//   website: website,
//   ipnUri: ipnUri

//       ),
//     );
//   }

//   Future<void> updatePayment({
//     required String cardName,
//     required String cardNumber,
//     required String expiryDate,
//     required String cvvNumber,
//   }) async {
//     _user ??= User.empty();
//     await Future.delayed(const Duration(seconds: 1));
//     _user = _user?.copyWith(
//       payment: Payment(
//         cardName: cardName,
//         cardNumber: cardNumber,
//         expiryDate: expiryDate,
//         cvvNumber: cvvNumber,
//       ),
//     );
//   }
// }
