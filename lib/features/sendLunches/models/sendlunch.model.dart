// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendLunchItem {
  final int lunchCount;
  final String? message;
  final String id;
  SendLunchItem({
    required this.lunchCount,
    this.message,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': lunchCount,
      'note': message,
    };
  }

  String toJson() => json.encode(toMap());

  SendLunchItem copyWith({
    int? lunchCount,
    String? message,
    String? id,
  }) {
    return SendLunchItem(
      lunchCount: lunchCount ?? this.lunchCount,
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }
}
