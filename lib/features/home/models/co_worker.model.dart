import 'dart:convert';

class CoWorker {
  String? id;
  String? email;
  String? fullName;
  String? organizationName;

  CoWorker({this.id, this.email, this.fullName, this.organizationName});

  CoWorker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    organizationName = json['organizationName'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': fullName,
      'organizationName': organizationName,
    };
  }

  factory CoWorker.fromMap(Map<String, dynamic> map) {
    return CoWorker(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      organizationName: map['organizationName'] != null
          ? map['organizationName'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  CoWorker copyWith({
    String? id,
    String? email,
    String? fullName,
    String? organizationName,
  }) {
    return CoWorker(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      organizationName: organizationName ?? this.organizationName,
    );
  }
}
