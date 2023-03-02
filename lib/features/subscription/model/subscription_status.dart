// To parse this JSON data, do
//
//     final statusResponseModel = statusResponseModelFromJson(jsonString);

import 'dart:convert';

StatusResponseModel statusResponseModelFromJson(String str) => StatusResponseModel.fromJson(json.decode(str));

String statusResponseModelToJson(StatusResponseModel data) => json.encode(data.toJson());

class StatusResponseModel {
    StatusResponseModel({
        this.status,
        this.message,
    });

    int? status;
    String? message;

    factory StatusResponseModel.fromJson(Map<String, dynamic> json) => StatusResponseModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
