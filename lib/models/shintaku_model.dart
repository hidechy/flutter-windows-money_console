// To parse this JSON data, do
//
//     final shintaku = shintakuFromJson(jsonString);

import 'dart:convert';

Shintaku shintakuFromJson(String str) => Shintaku.fromJson(json.decode(str));

String shintakuToJson(Shintaku data) => json.encode(data.toJson());

class Shintaku {
  Shintaku({
    required this.data,
  });

  ShintakuData data;

  factory Shintaku.fromJson(Map<String, dynamic> json) => Shintaku(
        data: ShintakuData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ShintakuData {
  ShintakuData({
    required this.cost,
    required this.price,
    required this.diff,
    required this.date,
    required this.record,
  });

  int cost;
  int price;
  int diff;
  DateTime date;
  List<ShintakuRecord> record;

  factory ShintakuData.fromJson(Map<String, dynamic> json) => ShintakuData(
        cost: json["cost"],
        price: json["price"],
        diff: json["diff"],
        date: DateTime.parse(json["date"]),
        record: List<ShintakuRecord>.from(
            json["record"].map((x) => ShintakuRecord.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "price": price,
        "diff": diff,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "record": List<dynamic>.from(record.map((x) => x.toJson())),
      };
}

class ShintakuRecord {
  ShintakuRecord({
    required this.name,
    required this.date,
    required this.num,
    required this.shutoku,
    required this.cost,
    required this.price,
    required this.diff,
    required this.data,
  });

  String name;
  DateTime date;
  String num;
  String shutoku;
  String cost;
  String price;
  int diff;
  String data;

  factory ShintakuRecord.fromJson(Map<String, dynamic> json) => ShintakuRecord(
        name: json["name"],
        date: DateTime.parse(json["date"]),
        num: json["num"],
        shutoku: json["shutoku"],
        cost: json["cost"],
        price: json["price"],
        diff: json["diff"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "num": num,
        "shutoku": shutoku,
        "cost": cost,
        "price": price,
        "diff": diff,
        "data": data,
      };
}
