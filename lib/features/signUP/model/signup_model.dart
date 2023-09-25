import 'dart:convert';

class SignupModel {
  final String? email;
  final String? password;
  final String? fullName;
  final String? phoneNumber;
  final String? organizationName;
  final String? otpToken;
  final String? firstName;
  final String? lastName;
  bool isAdmin;
  SignupModel({
    this.email,
    this.password,
    this.fullName,
    this.phoneNumber,
    this.organizationName,
    this.otpToken,
    this.firstName,
    this.lastName,
    required this.isAdmin,
  });

  SignupModel copyWith({
    String? email,
    String? password,
    String? fullName,
    String? phoneNumber,
    String? organizationName,
    String? otpToken,
    String? firstName,
    String? lastName,
    bool? isAdmin,
  }) {
    return SignupModel(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      organizationName: organizationName ?? this.organizationName,
      otpToken: otpToken ?? this.otpToken,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'organizationName': organizationName,
      'otpToken': otpToken,
      'firstName': firstName,
      'lastName': lastName,
      'isAdmin' : isAdmin,
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      organizationName: map['organizationName'] != null ? map['organizationName'] as String : null,
      otpToken: map['otpToken'] != null ? map['otpToken'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      isAdmin: map['isAdmin'] != null ? map['isAdmin'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignupModel(email: $email, password: $password, fullName: $fullName, phoneNumber: $phoneNumber, organizationName: $organizationName, otpToken: $otpToken, firstName: $firstName, lastName: $lastName)';

  @override
  bool operator ==(covariant SignupModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.organizationName == organizationName &&
        other.otpToken == otpToken &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode =>
      email.hashCode ^
      password.hashCode ^
      fullName.hashCode ^
      phoneNumber.hashCode ^
      organizationName.hashCode ^
      otpToken.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;
}