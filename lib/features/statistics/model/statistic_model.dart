// To parse this JSON data, do
//
//     final statisticsResponseModel = statisticsResponseModelFromJson(jsonString);

import 'dart:convert';

StatisticsResponseModel statisticsResponseModelFromJson(String str) => StatisticsResponseModel.fromJson(json.decode(str));

String statisticsResponseModelToJson(StatisticsResponseModel data) => json.encode(data.toJson());

class StatisticsResponseModel {
    StatisticsResponseModel({
        this.status,
        this.stat,
        this.journal,
        this.feel,
        this.affirmGrowth,
    });

    bool? status;
    Map<String, int>? stat;
    int? journal;
    int? feel;
    int? affirmGrowth;

    factory StatisticsResponseModel.fromJson(Map<String, dynamic> json) => StatisticsResponseModel(
        status: json["status"],
        stat: Map.from(json["stat"]!).map((k, v) => MapEntry<String, int>(k, v)),
        journal: json["journal"],
        feel: json["feel"],
        affirmGrowth: json["affirm/growth"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "stat": Map.from(stat!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "journal": journal,
        "feel": feel,
        "affirm/growth": affirmGrowth,
    };
}
