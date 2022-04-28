// To parse this JSON data, do
//
//     final everydaySpend = everydaySpendFromJson(jsonString);

import 'dart:convert';

EverydaySpend everydaySpendFromJson(String str) =>
    EverydaySpend.fromJson(json.decode(str));

String everydaySpendToJson(EverydaySpend data) => json.encode(data.toJson());

class EverydaySpend {
  EverydaySpend({
    required this.data,
  });

  List<EverydaySpendData> data;

  factory EverydaySpend.fromJson(Map<String, dynamic> json) => EverydaySpend(
        data: List<EverydaySpendData>.from(
            json["data"].map((x) => EverydaySpendData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EverydaySpendData {
  EverydaySpendData({
    this.date,
    required this.spend,
    required this.record,
    required this.diff,
    required this.step,
    required this.distance,
  });

  DateTime? date;
  int spend;
  String record;
  int diff;
  String step;
  String distance;

  factory EverydaySpendData.fromJson(Map<String, dynamic> json) =>
      EverydaySpendData(
        date: DateTime.parse(json["date"]),
        spend: json["spend"],
        record: json["record"],
        diff: json["diff"],
        step: json["step"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "spend": spend,
        "record": record,
        "diff": diff,
        "step": step,
        "distance": distance,
      };
}
