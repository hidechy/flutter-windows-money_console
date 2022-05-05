// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

Bank bankFromJson(String str) => Bank.fromJson(json.decode(str));

String bankToJson(Bank data) => json.encode(data.toJson());

class Bank {
  Bank({
    required this.data,
  });

  List<BankData> data;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        data:
            List<BankData>.from(json["data"].map((x) => BankData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BankData {
  BankData({
    required this.date,
    required this.price,
    required this.diff,
  });

  DateTime date;
  String price;
  int diff;

  factory BankData.fromJson(Map<String, dynamic> json) => BankData(
        date: DateTime.parse(json["date"]),
        price: json["price"],
        diff: json["diff"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "price": price,
        "diff": diff,
      };
}
