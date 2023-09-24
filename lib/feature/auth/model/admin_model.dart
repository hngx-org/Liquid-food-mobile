import 'dart:convert';

AdminUser adminUserFromJson(String str) => AdminUser.fromJson(json.decode(str));

String adminUserToJson(AdminUser data) => json.encode(data.toJson());

class AdminUser {
  String email;
  String password;
  String fullName;
  String phoneNumber;
  String organizationName;

  AdminUser({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.organizationName,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "organizationName": organizationName,
      };

  String toJson() => jsonEncode(toMap());

  AdminUser copyWith({
    String? email,
    String? password,
    String? fullName,
    String? phoneNumber,
    String? organizationName,
  }) =>
      AdminUser(
        email: email ?? this.email,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        organizationName: organizationName ?? this.organizationName,
      );

  factory AdminUser.fromJson(Map<String, dynamic> json) => AdminUser(
        email: json["email"],
        password: json["password"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        organizationName: json["organizationName"],
      );
}
