class UserModel {
  String? message;
  int? statusCode;
  UserData? data;

  UserModel({this.message, this.statusCode, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
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

class UserData {
  String? accessToken;
  String? refreshToken;
  String? email;
  int? id;
  bool? isAdmin;
  String? fullName;
  String? orgName;
  

  UserData({this.accessToken, this.refreshToken, this.email, this.id, this.isAdmin});

  UserData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    id = json['id'];
    isAdmin = json['isAdmin'];
    fullName = json['fullName'];
    orgName = json['orgName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['email'] = email;
    data['id'] = id;
    data['isAdmin'] = isAdmin;
    data['fullName'] = fullName;
    data['orgName'] = orgName;
    return data;
  }
}