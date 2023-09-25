class UserModel {
  String? message;
  int? statusCode;
  Data? data;

  UserModel({this.message, this.statusCode, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String? accessToken;
  String? refreshToken;
  String? email;
  int? id;
  bool? admin;

  Data({this.accessToken, this.refreshToken, this.email, this.id, this.admin});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    id = json['id'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['email'] = email;
    data['id'] = id;
    data['admin'] = admin;
    return data;
  }
}
