// To parse this JSON data, do
//
//     final subcriptionPlanResponseModel = subcriptionPlanResponseModelFromJson(jsonString);

import 'dart:convert';

SubcriptionPlanResponseModel subcriptionPlanResponseModelFromJson(String str) => SubcriptionPlanResponseModel.fromJson(json.decode(str));

String subcriptionPlanResponseModelToJson(SubcriptionPlanResponseModel data) => json.encode(data.toJson());

class SubcriptionPlanResponseModel {
    SubcriptionPlanResponseModel({
        this.data,
    });

    List<Datum>? data;

    factory SubcriptionPlanResponseModel.fromJson(Map<String, dynamic> json) => SubcriptionPlanResponseModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.price,
        this.amount,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? price;
    String? amount;
    dynamic status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        amount: json["amount"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "amount": amount,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
