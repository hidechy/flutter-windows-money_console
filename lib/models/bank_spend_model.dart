// To parse this JSON data, do
//
//     final bankSpend = bankSpendFromJson(jsonString);

import 'dart:convert';

BankSpend bankSpendFromJson(String str) => BankSpend.fromJson(json.decode(str));

String bankSpendToJson(BankSpend data) => json.encode(data.toJson());

class BankSpend {
  BankSpend({
    required this.data,
  });

  List<BankSpendData> data;

  factory BankSpend.fromJson(Map<String, dynamic> json) => BankSpend(
        data: List<BankSpendData>.from(
            json["data"].map((x) => BankSpendData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BankSpendData {
  BankSpendData({
    required this.date,
    required this.item,
    required this.price,
  });

  DateTime date;
  String item;
  String price;

  factory BankSpendData.fromJson(Map<String, dynamic> json) => BankSpendData(
        date: DateTime.parse(json["date"]),
        item: json["item"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "item": item,
        "price": price,
      };
}
