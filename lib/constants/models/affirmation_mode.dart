// To parse this JSON data, do
//
//     final affirmationResponseMode = affirmationResponseModeFromJson(jsonString);

import 'dart:convert';

AffirmationResponseMode affirmationResponseModeFromJson(String str) =>
    AffirmationResponseMode.fromJson(json.decode(str));

String affirmationResponseModeToJson(AffirmationResponseMode data) =>
    json.encode(data.toJson());

class AffirmationResponseMode {
  AffirmationResponseMode({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory AffirmationResponseMode.fromJson(Map<String, dynamic> json) =>
      AffirmationResponseMode(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.name,
    this.title,
    this.content,
    this.datumFor,
    this.school,
    this.schoolId,
    this.reaction,
    this.reason,
    this.better,
    this.outcome,
    this.file,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic userId;
  dynamic name;
  String? title;
  String? content;
  String? datumFor;
  dynamic school;
  dynamic schoolId;
  dynamic reaction;
  dynamic reason;
  dynamic better;
  dynamic outcome;
  dynamic file;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        title: json["title"],
        content: json["content"],
        datumFor: json["for"],
        school: json["school"],
        schoolId: json["school_id"],
        reaction: json["reaction"],
        reason: json["reason"],
        better: json["better"],
        outcome: json["outcome"],
        file: json["file"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "title": title,
        "content": content,
        "for": datumFor,
        "school": school,
        "school_id": schoolId,
        "reaction": reaction,
        "reason": reason,
        "better": better,
        "outcome": outcome,
        "file": file,
        "description": description,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
