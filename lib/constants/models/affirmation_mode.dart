// To parse this JSON data, do
//
//     final affirmationResponseMode = affirmationResponseModeFromJson(jsonString);

import 'dart:convert';

AffirmationResponseMode affirmationResponseModeFromJson(String str) => AffirmationResponseMode.fromJson(json.decode(str));

String affirmationResponseModeToJson(AffirmationResponseMode data) => json.encode(data.toJson());

class AffirmationResponseMode {
    AffirmationResponseMode({
        this.status,
        this.data,
    });

    bool? status;
    Data? data;

    factory AffirmationResponseMode.fromJson(Map<String, dynamic> json) => AffirmationResponseMode(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.makeSureYouGotAim,
    });

    String? makeSureYouGotAim;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        makeSureYouGotAim: json["make sure you got aim"],
    );

    Map<String, dynamic> toJson() => {
        "make sure you got aim": makeSureYouGotAim,
    };
}
