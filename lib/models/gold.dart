// To parse this JSON data, do
//
//     final gold = goldFromJson(jsonString);

import 'dart:convert';

Gold goldFromJson(String str) => Gold.fromJson(json.decode(str));

String goldToJson(Gold data) => json.encode(data.toJson());

class Gold {
  Gold({
    required this.data,
  });

  List<GoldData> data;

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        data:
            List<GoldData>.from(json["data"].map((x) => GoldData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GoldData {
  GoldData({
    required this.year,
    required this.month,
    required this.day,
    required this.goldTanka,
    this.upDown,
    this.diff,
    this.gramNum,
    this.totalGram,
    this.goldValue,
    required this.goldPrice,
    this.payPrice,
  });

  String year;
  String month;
  String day;
  String goldTanka;
  dynamic upDown;
  dynamic diff;
  dynamic gramNum;
  dynamic totalGram;
  dynamic goldValue;
  String goldPrice;
  dynamic payPrice;

  factory GoldData.fromJson(Map<String, dynamic> json) => GoldData(
        year: json["year"],
        month: json["month"],
        day: json["day"],
        goldTanka: json["gold_tanka"],
        upDown: json["up_down"],
        diff: json["diff"],
        gramNum: json["gram_num"],
        totalGram: json["total_gram"],
        goldValue: json["gold_value"],
        goldPrice: json["gold_price"],
        payPrice: json["pay_price"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "gold_tanka": goldTanka,
        "up_down": upDown,
        "diff": diff,
        "gram_num": gramNum,
        "total_gram": totalGram,
        "gold_value": goldValue,
        "gold_price": goldPrice,
        "pay_price": payPrice,
      };
}
