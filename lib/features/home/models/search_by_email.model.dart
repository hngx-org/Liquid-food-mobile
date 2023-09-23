class SearchUserbyEmail {
  String? message;
  int? statusCode;
  UserbyEmail? data;

  SearchUserbyEmail({this.message, this.statusCode, this.data});

  SearchUserbyEmail.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? UserbyEmail.fromJson(json['data']) : null;
  }
}

class UserbyEmail {
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? email;
  String? phoneNumber;
  String? passwordHash;
  String? refreshToken;
  String? bankNumber;
  String? bankCode;
  String? bankName;
  String? organizationName;
  String? id;
  String? isAdmin;

  UserbyEmail(
      {this.firstName,
      this.lastName,
      this.profilePicture,
      this.email,
      this.phoneNumber,
      this.passwordHash,
      this.refreshToken,
      this.bankNumber,
      this.bankCode,
      this.bankName,
      this.organizationName,
      this.id,
      this.isAdmin});

  UserbyEmail.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePicture = json['profilePicture'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    passwordHash = json['passwordHash'];
    refreshToken = json['refreshToken'];
    bankNumber = json['bankNumber'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    organizationName = json['organizationName'];
    id = json['id'];
    isAdmin = json['isAdmin'];
  }
}
