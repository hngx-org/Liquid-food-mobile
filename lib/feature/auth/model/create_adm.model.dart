import 'dart:convert';

class CreateAdmModel {
  String? message;
  int? statusCode;
  Data? data;

  CreateAdmModel({
    this.message,
    this.statusCode,
    this.data,
  });

  CreateAdmModel copyWith({
    String? message,
    int? statusCode,
    Data? data,
  }) =>
      CreateAdmModel(
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory CreateAdmModel.fromRawJson(String str) =>
      CreateAdmModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateAdmModel.fromJson(Map<String, dynamic> json) => CreateAdmModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic refreshToken;
  DateTime? updatedAt;
  DateTime? createdAt;
  dynamic bankNumber;
  dynamic bankCode;
  dynamic bankName;
  String? bankRegion;
  String? currencyCode;
  String? currency;
  bool? isAdmin;
  int? lunchCreditBalance;
  Organizations? organizations;
  dynamic profilePic;

  Data({
    this.id,
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
    this.profilePic,
  });

  Data copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    dynamic refreshToken,
    DateTime? updatedAt,
    DateTime? createdAt,
    dynamic bankNumber,
    dynamic bankCode,
    dynamic bankName,
    String? bankRegion,
    String? currencyCode,
    String? currency,
    bool? isAdmin,
    int? lunchCreditBalance,
    Organizations? organizations,
    dynamic profilePic,
  }) =>
      Data(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        refreshToken: refreshToken ?? this.refreshToken,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        bankNumber: bankNumber ?? this.bankNumber,
        bankCode: bankCode ?? this.bankCode,
        bankName: bankName ?? this.bankName,
        bankRegion: bankRegion ?? this.bankRegion,
        currencyCode: currencyCode ?? this.currencyCode,
        currency: currency ?? this.currency,
        isAdmin: isAdmin ?? this.isAdmin,
        lunchCreditBalance: lunchCreditBalance ?? this.lunchCreditBalance,
        organizations: organizations ?? this.organizations,
        profilePic: profilePic ?? this.profilePic,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        refreshToken: json["refreshToken"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        bankNumber: json["bankNumber"],
        bankCode: json["bankCode"],
        bankName: json["bankName"],
        bankRegion: json["bankRegion"],
        currencyCode: json["currencyCode"],
        currency: json["currency"],
        isAdmin: json["isAdmin"],
        lunchCreditBalance: json["lunchCreditBalance"],
        organizations: json["organizations"] == null
            ? null
            : Organizations.fromJson(json["organizations"]),
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "refreshToken": refreshToken,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "bankNumber": bankNumber,
        "bankCode": bankCode,
        "bankName": bankName,
        "bankRegion": bankRegion,
        "currencyCode": currencyCode,
        "currency": currency,
        "isAdmin": isAdmin,
        "lunchCreditBalance": lunchCreditBalance,
        "organizations": organizations?.toJson(),
        "profilePic": profilePic,
      };
}

class Organizations {
  int? id;
  String? name;
  int? lunchPrice;
  String? currencyCode;
  DateTime? createdAt;
  dynamic updatedAt;
  bool? isDeleted;

  Organizations({
    this.id,
    this.name,
    this.lunchPrice,
    this.currencyCode,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
  });

  Organizations copyWith({
    int? id,
    String? name,
    int? lunchPrice,
    String? currencyCode,
    DateTime? createdAt,
    dynamic updatedAt,
    bool? isDeleted,
  }) =>
      Organizations(
        id: id ?? this.id,
        name: name ?? this.name,
        lunchPrice: lunchPrice ?? this.lunchPrice,
        currencyCode: currencyCode ?? this.currencyCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );

  factory Organizations.fromRawJson(String str) =>
      Organizations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organizations.fromJson(Map<String, dynamic> json) => Organizations(
        id: json["id"],
        name: json["name"],
        lunchPrice: json["lunchPrice"],
        currencyCode: json["currencyCode"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lunchPrice": lunchPrice,
        "currencyCode": currencyCode,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
      };
}
