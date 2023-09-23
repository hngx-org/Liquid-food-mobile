class LunchCredits {
  String? message;
  int? statusCode;
  int? data;

  LunchCredits({this.message, this.statusCode, this.data});

  LunchCredits.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['data'] = this.data;
    return data;
  }
}
