  // To parse this JSON data, do
//
//     final walletBalanceResponseModel = walletBalanceResponseModelFromJson(jsonString);

import 'dart:convert';

WalletBalanceResponseModel walletBalanceResponseModelFromJson(String str) => WalletBalanceResponseModel.fromJson(json.decode(str));

String walletBalanceResponseModelToJson(WalletBalanceResponseModel? data) => json.encode(data!.toJson());

class WalletBalanceResponseModel {
    WalletBalanceResponseModel({
        this.data,
    });

    String? data;

    factory WalletBalanceResponseModel.fromJson(Map<String, dynamic> json) => WalletBalanceResponseModel(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };
}
