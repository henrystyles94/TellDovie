// To parse this JSON data, do
//
//     final lessonHubResponseModel = lessonHubResponseModelFromJson(jsonString);

import 'dart:convert';

LessonHubResponseModel lessonHubResponseModelFromJson(String str) => LessonHubResponseModel.fromJson(json.decode(str));

String lessonHubResponseModelToJson(LessonHubResponseModel data) => json.encode(data.toJson());

class LessonHubResponseModel {
    LessonHubResponseModel({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory LessonHubResponseModel.fromJson(Map<String, dynamic> json) => LessonHubResponseModel(
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
        this.title,
        this.description,
        this.image,
        this.progress,
        this.classId,
        this.datumClass,
        this.teacher,
        this.teacherId,
        this.school,
        this.schoolId,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? description;
    String? image;
    dynamic progress;
    String ?classId;
    String ?datumClass;
    String? teacher;
    String? teacherId;
    String? school;
    String? schoolId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        progress: json["progress"],
        classId: json["class_id"],
        datumClass: json["class"],
        teacher: json["teacher"],
        teacherId: json["teacher_id"],
        school: json["school"],
        schoolId: json["school_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "progress": progress,
        "class_id": classId,
        "class": datumClass,
        "teacher": teacher,
        "teacher_id": teacherId,
        "school": school,
        "school_id": schoolId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
