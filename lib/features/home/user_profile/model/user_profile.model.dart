class UserProfile {
  String? message;
  int? statusCode;
  Data? data;

  UserProfile({this.message, this.statusCode, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? refreshToken;
  String? updatedAt;
  String? createdAt;
  String? bankNumber;
  String? bankCode;
  String? bankName;
  String? bankRegion;
  String? currencyCode;
  String? currency;
  bool? isAdmin;
  int? lunchCreditBalance;
  Organizations? organizations;
  String? profilePic;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.refreshToken,
      this.updatedAt,
      this.createdAt,
      this.bankNumber,
      this.bankCode,
      this.bankName,
      this.bankRegion,
      this.currencyCode,
      this.currency,
      this.isAdmin,
      this.lunchCreditBalance,
      this.organizations,
      this.profilePic});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    refreshToken = json['refreshToken'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    bankNumber = json['bankNumber'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    bankRegion = json['bankRegion'];
    currencyCode = json['currencyCode'];
    currency = json['currency'];
    isAdmin = json['isAdmin'];
    lunchCreditBalance = json['lunchCreditBalance'];
    organizations = json['organizations'] != null
        ? Organizations.fromJson(json['organizations'])
        : null;
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['refreshToken'] = refreshToken;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    data['bankNumber'] = bankNumber;
    data['bankCode'] = bankCode;
    data['bankName'] = bankName;
    data['bankRegion'] = bankRegion;
    data['currencyCode'] = currencyCode;
    data['currency'] = currency;
    data['isAdmin'] = isAdmin;
    data['lunchCreditBalance'] = lunchCreditBalance;
    if (organizations != null) {
      data['organizations'] = organizations!.toJson();
    }
    data['profilePic'] = profilePic;
    return data;
  }
}

class Organizations {
  int? id;
  String? name;
  int? lunchPrice;
  String? currencyCode;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;

  Organizations(
      {this.id,
      this.name,
      this.lunchPrice,
      this.currencyCode,
      this.createdAt,
      this.updatedAt,
      this.isDeleted});

  Organizations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lunchPrice = json['lunchPrice'];
    currencyCode = json['currencyCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lunchPrice'] = lunchPrice;
    data['currencyCode'] = currencyCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
