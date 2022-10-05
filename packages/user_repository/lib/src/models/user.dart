import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';
import 'package:user_repository/src/extra/type_helper.dart';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  dynamic? profileThumbnailUrl;
  List<Account>? accounts;
  List<int>? roleIds;
  List<dynamic>? permissionIds;
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profileThumbnailUrl,
    this.accounts,
    this.roleIds,
    this.permissionIds,
  });

  static final empty = User();
  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    dynamic? profileThumbnailUrl,
    List<Account>? accounts,
    List<int>? roleIds,
    List<dynamic>? permissionIds,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileThumbnailUrl: profileThumbnailUrl ?? this.profileThumbnailUrl,
      accounts: accounts ?? this.accounts,
      roleIds: roleIds ?? this.roleIds,
      permissionIds: permissionIds ?? this.permissionIds,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "profileThumbnailUrl": profileThumbnailUrl,
        'accounts': accounts?.map((x) => x.toMap()).toList(),
        'roleIds': roleIds?.map((x) => x.toInt()).toList(),
        'permissionIds': permissionIds?.map((x) => x.toMap()).toList(),
      };
  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map["id"],
        firstName: map["firstName"],
        lastName: map["lastName"],
        email: map["email"],
        phoneNumber: map["phoneNumber"],
        profileThumbnailUrl: map["profileThumbnailUrl"],
        accounts: map['accounts'] != null
            ? List<Account>.from(
                map["accounts"]?.map((x) => Account?.fromMap(x)))
            : null,
        roleIds: List<int>.from(map["roleIds"].map((x) => x)),
        permissionIds: List<dynamic>.from(map["permissionIds"].map((x) => x)),
      );

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  factory User.fromDynamic(source) {
    return User().copyWith(
      id: source?["id"],
      firstName: source?["firstName"],
      lastName: source?["lastName"],
      email: source?["email"],
      phoneNumber: source?["phoneNumber"],
      profileThumbnailUrl: source?["profileThumbnailUrl"],
    );
  }
  @override
  String toString() {
    return 'User(id: $id,firstName: $firstName,lastName: $lastName,email: $email ,phoneNumber: $phoneNumber , profileThumbnailUrl: $profileThumbnailUrl ,accounts: $accounts,roleIds: $roleIds,permissionIds: $permissionIds )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    Function eq = const ListEquality().equals;
    return other is User &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.profileThumbnailUrl == profileThumbnailUrl &&
        other.accounts == accounts &&
        other.roleIds == roleIds &&
        other.permissionIds == permissionIds;
    // eq(other.accounts, accounts);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        profileThumbnailUrl.hashCode ^
        accounts.hashCode ^
        roleIds.hashCode ^
        permissionIds.hashCode;
  }
}

class Account {
  int? accountId;
  int? subscriptionId;
  dynamic? type;
  DateTime? createdOn;
  String? currencyCode;
  String? countryCode;
  String? status;
  String? apiKey;
  String? ipnUri;
  String? alertLevel;
  String? alertChannel;
  String? alertEmailAddress;
  String? alertPhoneNumber;
  String? name;
  String? shortDescription;
  String? longDescription;
  DateTime? apiPasswordExpiresOn;
  int? balance;
  int? totalAvailableBalance;

  Account({
    this.accountId,
    this.subscriptionId,
    this.type,
    this.createdOn,
    this.currencyCode,
    this.countryCode,
    this.status,
    this.apiKey,
    this.ipnUri,
    this.alertLevel,
    this.alertChannel,
    this.alertEmailAddress,
    this.alertPhoneNumber,
    this.name,
    this.shortDescription,
    this.longDescription,
    this.apiPasswordExpiresOn,
    this.balance,
    this.totalAvailableBalance,
  });
  static final empty = Account();

  Account copyWith({
    int? accountId,
    int? subscriptionId,
    dynamic? type,
    DateTime? createdOn,
    String? currencyCode,
    String? countryCode,
    String? status,
    String? apiKey,
    String? ipnUri,
    String? alertLevel,
    String? alertChannel,
    String? alertEmailAddress,
    String? alertPhoneNumber,
    String? name,
    String? shortDescription,
    String? longDescription,
    DateTime? apiPasswordExpiresOn,
    int? balance,
    int? totalAvailableBalance,
  }) {
    return Account(
      accountId: accountId ?? this.accountId,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      currencyCode: currencyCode ?? this.currencyCode,
      countryCode: countryCode ?? this.countryCode,
      status: status ?? this.status,
      apiKey: apiKey ?? this.apiKey,
      ipnUri: ipnUri ?? this.ipnUri,
      alertLevel: alertLevel ?? this.alertLevel,
      alertChannel: alertChannel ?? this.alertChannel,
      alertEmailAddress: alertEmailAddress ?? this.alertEmailAddress,
      alertPhoneNumber: alertPhoneNumber ?? this.alertPhoneNumber,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      apiPasswordExpiresOn: apiPasswordExpiresOn ?? this.apiPasswordExpiresOn,
      balance: balance ?? this.balance,
      totalAvailableBalance:
          totalAvailableBalance ?? this.totalAvailableBalance,
    );
  }

  factory Account.fromMap(Map<String, dynamic> map) => Account(
        accountId: map["accountId"],
        subscriptionId: map["subscriptionId"],
        type: map["type"],
        createdOn: DateTime.parse(map["createdOn"]),
        currencyCode: map["currencyCode"],
        countryCode: map["countryCode"],
        status: map["status"],
        apiKey: map["apiKey"],
        ipnUri: map["ipnUri"],
        alertLevel: map["alertLevel"],
        alertChannel: map["alertChannel"],
        alertEmailAddress: map["alertEmailAddress"],
        alertPhoneNumber: map["alertPhoneNumber"],
        name: map["name"],
        shortDescription: map["shortDescription"],
        longDescription: map["longDescription"],
        apiPasswordExpiresOn: DateTime.parse(map["apiPasswordExpiresOn"]),
        balance: map["balance"],
        totalAvailableBalance: map["totalAvailableBalance"],
      );

  Map<String, dynamic> toMap() => {
        "accountId": accountId,
        "subscriptionId": subscriptionId,
        "type": type,
        "createdOn": createdOn?.toIso8601String(),
        "currencyCode": currencyCode,
        "countryCode": countryCode,
        "status": status,
        "apiKey": apiKey,
        "ipnUri": ipnUri,
        "alertLevel": alertLevel,
        "alertChannel": alertChannel,
        "alertEmailAddress": alertEmailAddress,
        "alertPhoneNumber": alertPhoneNumber,
        "name": name,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "apiPasswordExpiresOn": apiPasswordExpiresOn?.toIso8601String(),
        "balance": balance,
        "totalAvailableBalance": totalAvailableBalance,
      };
}


class OpenAnAccount extends Equatable {
  const OpenAnAccount({
    required this.email,
  });

  final String email;

  factory OpenAnAccount.empty() {
    return const OpenAnAccount(
      email: '',
    );
  }

  OpenAnAccount copyWith({
    String? email,
  }) {
    return OpenAnAccount(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [email];
}
class AboutYou extends Equatable {
  const AboutYou({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  final String firstName;
  final String lastName;
  final String phoneNumber;

  factory AboutYou.empty() {
    return const AboutYou(
      firstName: '',
      lastName: '',
      phoneNumber: '',
    );
  }

  AboutYou copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    return AboutYou(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber];
}

class YourSecurity extends Equatable {
  const YourSecurity({
    required this.password,
    required this.confirmPassword,
  });

  final String password;
  final String confirmPassword;

  factory YourSecurity.empty() {
    return const YourSecurity(
      password: '',
      confirmPassword: '',
    );
  }

  YourSecurity copyWith({
    String? password,
    String? confirmPassword,
  }) {
    return YourSecurity(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [password, confirmPassword];
}

class CompanyDetails extends Equatable {
  const CompanyDetails({
    required this.businessName,
    required this.countryCode,
    required this.currencyCode,
    required this.website,
    required this.ipnUri,
  });

  final String businessName;
  final String countryCode;
  final String currencyCode;
  final String website;
  final String ipnUri;

  factory CompanyDetails.empty() {
    return const CompanyDetails(
      businessName: '',
      countryCode: '',
      currencyCode: '',
      website: '',
      ipnUri: '',
    );
  }

  CompanyDetails copyWith({
    String? businessName,
    String? countryCode,
    String? currencyCode,
    String? website,
    String? ipnUri,
  }) {
    return CompanyDetails(
      businessName: businessName ?? this.businessName,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      website: website ?? this.website,
      ipnUri: ipnUri?? this.ipnUri,
    );
  }

  @override
  List<Object?> get props => [businessName, countryCode, currencyCode, website, ipnUri];
}


