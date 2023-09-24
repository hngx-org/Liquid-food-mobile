import 'dart:convert';

class CoWorker {
  final String? name;
  final String? designation;
  final String? profilePath;
  CoWorker({
    this.name,
    this.designation,
    this.profilePath,
  });

  CoWorker copyWith({
    String? name,
    String? designation,
    String? profilePath,
  }) {
    return CoWorker(
      name: name ?? this.name,
      designation: designation ?? this.designation,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'designation': designation,
      'profilePath': profilePath,
    };
  }

  factory CoWorker.fromMap(Map<String, dynamic> map) {
    return CoWorker(
      name: map['name'] != null ? map['name'] as String : null,
      designation:
          map['designation'] != null ? map['designation'] as String : null,
      profilePath:
          map['profilePath'] != null ? map['profilePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoWorker.fromJson(String source) =>
      CoWorker.fromMap(json.decode(source) as Map<String, dynamic>);
}
