import 'package:free_lunch_app/features/home/models/co_worker.model.dart';

class AllUserModel {
  String? message;
  int? statusCode;
  List<CoWorker>? data;

  AllUserModel({this.message, this.statusCode, this.data});

  AllUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <CoWorker>[];
      json['data'].forEach((v) {
        data!.add(CoWorker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
