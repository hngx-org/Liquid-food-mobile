import 'dart:convert';

class SendLunchItem {
  final String lunchCount;
  final String message;
  final String coworkerName;
  final String id;
  SendLunchItem({
    required this.lunchCount,
    required this.message,
    required this.coworkerName,
    required this.id,
  });

  SendLunchItem copyWith({
    String? lunchCount,
    String? message,
    String? coworkerName,
    String? id,
  }) {
    return SendLunchItem(
      lunchCount: lunchCount ?? this.lunchCount,
      message: message ?? this.message,
      coworkerName: coworkerName ?? this.coworkerName,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lunchCount': lunchCount,
      'message': message,
      'coworkerName': coworkerName,
      'id': id,
    };
  }

  factory SendLunchItem.fromMap(Map<String, dynamic> map) {
    return SendLunchItem(
      lunchCount: map['lunchCount'] as String,
      message: map['message'] as String,
      coworkerName: map['coworkerName'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendLunchItem.fromJson(String source) =>
      SendLunchItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
