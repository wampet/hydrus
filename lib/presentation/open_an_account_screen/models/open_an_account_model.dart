
class AuthModel {
  String? message;
  Data? data;
  int? code;
  String? status;

  AuthModel({this.message, this.data, this.code, this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    code = json["code"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["code"] = code;
    _data["status"] = status;
    return _data;
  }
}

class Data {
  Account? account;
  Subscription? subscription;
  User? user;

  Data({this.account, this.subscription, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    account = json["account"] == null ? null : Account.fromJson(json["account"]);
    subscription = json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(account != null) {
      _data["account"] = account?.toJson();
    }
    if(subscription != null) {
      _data["subscription"] = subscription?.toJson();
    }
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profileThumbnailUrl;
  List<Accounts>? accounts;
  List<int>? roleIds;
  List<dynamic>? permissionIds;

  User({this.id, this.firstName, this.lastName, this.email, this.phoneNumber, this.profileThumbnailUrl, this.accounts, this.roleIds, this.permissionIds});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    profileThumbnailUrl = json["profileThumbnailUrl"];
    accounts = json["accounts"] == null ? null : (json["accounts"] as List).map((e) => Accounts.fromJson(e)).toList();
    roleIds = json["roleIds"] == null ? null : List<int>.from(json["roleIds"]);
    permissionIds = json["permissionIds"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["profileThumbnailUrl"] = profileThumbnailUrl;
    if(accounts != null) {
      _data["accounts"] = accounts?.map((e) => e.toJson()).toList();
    }
    if(roleIds != null) {
      _data["roleIds"] = roleIds;
    }
    if(permissionIds != null) {
      _data["permissionIds"] = permissionIds;
    }
    return _data;
  }
}

class Accounts {
  int? accountId;
  int? subscriptionId;
  String? type;
  String? createdOn;
  int? createdBy;
  String? modifiedOn;
  int? modifiedBy;
  String? currencyCode;
  String? countryCode;
  String? status;
  String? apiKey;
  String? apiPassword;
  String? ipnUri;
  bool? isExternal;
  String? alertLevel;
  String? alertChannel;
  String? alertEmailAddress;
  String? alertPhoneNumber;
  String? name;
  String? shortDescription;
  String? longDescription;
  String? apiPasswordExpiresOn;

  Accounts({this.accountId, this.subscriptionId, this.type, this.createdOn, this.createdBy, this.modifiedOn, this.modifiedBy, this.currencyCode, this.countryCode, this.status, this.apiKey, this.apiPassword, this.ipnUri, this.isExternal, this.alertLevel, this.alertChannel, this.alertEmailAddress, this.alertPhoneNumber, this.name, this.shortDescription, this.longDescription, this.apiPasswordExpiresOn});

  Accounts.fromJson(Map<String, dynamic> json) {
    accountId = json["accountId"];
    subscriptionId = json["subscriptionId"];
    type = json["type"];
    createdOn = json["createdOn"];
    createdBy = json["createdBy"];
    modifiedOn = json["modifiedOn"];
    modifiedBy = json["modifiedBy"];
    currencyCode = json["currencyCode"];
    countryCode = json["countryCode"];
    status = json["status"];
    apiKey = json["apiKey"];
    apiPassword = json["apiPassword"];
    ipnUri = json["ipnUri"];
    isExternal = json["isExternal"];
    alertLevel = json["alertLevel"];
    alertChannel = json["alertChannel"];
    alertEmailAddress = json["alertEmailAddress"];
    alertPhoneNumber = json["alertPhoneNumber"];
    name = json["name"];
    shortDescription = json["shortDescription"];
    longDescription = json["longDescription"];
    apiPasswordExpiresOn = json["apiPasswordExpiresOn"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["accountId"] = accountId;
    _data["subscriptionId"] = subscriptionId;
    _data["type"] = type;
    _data["createdOn"] = createdOn;
    _data["createdBy"] = createdBy;
    _data["modifiedOn"] = modifiedOn;
    _data["modifiedBy"] = modifiedBy;
    _data["currencyCode"] = currencyCode;
    _data["countryCode"] = countryCode;
    _data["status"] = status;
    _data["apiKey"] = apiKey;
    _data["apiPassword"] = apiPassword;
    _data["ipnUri"] = ipnUri;
    _data["isExternal"] = isExternal;
    _data["alertLevel"] = alertLevel;
    _data["alertChannel"] = alertChannel;
    _data["alertEmailAddress"] = alertEmailAddress;
    _data["alertPhoneNumber"] = alertPhoneNumber;
    _data["name"] = name;
    _data["shortDescription"] = shortDescription;
    _data["longDescription"] = longDescription;
    _data["apiPasswordExpiresOn"] = apiPasswordExpiresOn;
    return _data;
  }
}

class Subscription {
  int? subscriptionId;
  String? name;
  bool? isPublic;
  String? status;
  String? createdOn;
  int? createdBy;
  String? modifiedOn;
  int? modifiedBy;
  String? longDescription;
  String? phoneNumber;
  String? website;
  String? emailAddress;
  String? imageUri;
  String? thumbnailUri;
  String? shortDescription;

  Subscription({this.subscriptionId, this.name, this.isPublic, this.status, this.createdOn, this.createdBy, this.modifiedOn, this.modifiedBy, this.longDescription, this.phoneNumber, this.website, this.emailAddress, this.imageUri, this.thumbnailUri, this.shortDescription});

  Subscription.fromJson(Map<String, dynamic> json) {
    subscriptionId = json["subscriptionId"];
    name = json["name"];
    isPublic = json["isPublic"];
    status = json["status"];
    createdOn = json["createdOn"];
    createdBy = json["createdBy"];
    modifiedOn = json["modifiedOn"];
    modifiedBy = json["modifiedBy"];
    longDescription = json["longDescription"];
    phoneNumber = json["phoneNumber"];
    website = json["website"];
    emailAddress = json["emailAddress"];
    imageUri = json["imageUri"];
    thumbnailUri = json["thumbnailUri"];
    shortDescription = json["shortDescription"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["subscriptionId"] = subscriptionId;
    _data["name"] = name;
    _data["isPublic"] = isPublic;
    _data["status"] = status;
    _data["createdOn"] = createdOn;
    _data["createdBy"] = createdBy;
    _data["modifiedOn"] = modifiedOn;
    _data["modifiedBy"] = modifiedBy;
    _data["longDescription"] = longDescription;
    _data["phoneNumber"] = phoneNumber;
    _data["website"] = website;
    _data["emailAddress"] = emailAddress;
    _data["imageUri"] = imageUri;
    _data["thumbnailUri"] = thumbnailUri;
    _data["shortDescription"] = shortDescription;
    return _data;
  }
}

class Account {
  int? accountId;
  int? subscriptionId;
  String? type;
  String? createdOn;
  int? createdBy;
  String? modifiedOn;
  int? modifiedBy;
  String? currencyCode;
  String? countryCode;
  String? status;
  String? apiKey;
  String? apiPassword;
  String? ipnUri;
  bool? isExternal;
  String? alertLevel;
  String? alertChannel;
  String? alertEmailAddress;
  String? alertPhoneNumber;
  String? name;
  String? shortDescription;
  String? longDescription;
  String? apiPasswordExpiresOn;

  Account({this.accountId, this.subscriptionId, this.type, this.createdOn, this.createdBy, this.modifiedOn, this.modifiedBy, this.currencyCode, this.countryCode, this.status, this.apiKey, this.apiPassword, this.ipnUri, this.isExternal, this.alertLevel, this.alertChannel, this.alertEmailAddress, this.alertPhoneNumber, this.name, this.shortDescription, this.longDescription, this.apiPasswordExpiresOn});

  Account.fromJson(Map<String, dynamic> json) {
    accountId = json["accountId"];
    subscriptionId = json["subscriptionId"];
    type = json["type"];
    createdOn = json["createdOn"];
    createdBy = json["createdBy"];
    modifiedOn = json["modifiedOn"];
    modifiedBy = json["modifiedBy"];
    currencyCode = json["currencyCode"];
    countryCode = json["countryCode"];
    status = json["status"];
    apiKey = json["apiKey"];
    apiPassword = json["apiPassword"];
    ipnUri = json["ipnUri"];
    isExternal = json["isExternal"];
    alertLevel = json["alertLevel"];
    alertChannel = json["alertChannel"];
    alertEmailAddress = json["alertEmailAddress"];
    alertPhoneNumber = json["alertPhoneNumber"];
    name = json["name"];
    shortDescription = json["shortDescription"];
    longDescription = json["longDescription"];
    apiPasswordExpiresOn = json["apiPasswordExpiresOn"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["accountId"] = accountId;
    _data["subscriptionId"] = subscriptionId;
    _data["type"] = type;
    _data["createdOn"] = createdOn;
    _data["createdBy"] = createdBy;
    _data["modifiedOn"] = modifiedOn;
    _data["modifiedBy"] = modifiedBy;
    _data["currencyCode"] = currencyCode;
    _data["countryCode"] = countryCode;
    _data["status"] = status;
    _data["apiKey"] = apiKey;
    _data["apiPassword"] = apiPassword;
    _data["ipnUri"] = ipnUri;
    _data["isExternal"] = isExternal;
    _data["alertLevel"] = alertLevel;
    _data["alertChannel"] = alertChannel;
    _data["alertEmailAddress"] = alertEmailAddress;
    _data["alertPhoneNumber"] = alertPhoneNumber;
    _data["name"] = name;
    _data["shortDescription"] = shortDescription;
    _data["longDescription"] = longDescription;
    _data["apiPasswordExpiresOn"] = apiPasswordExpiresOn;
    return _data;
  }
}