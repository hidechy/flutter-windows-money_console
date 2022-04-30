// To parse this JSON data, do
//
//     final credit = creditFromJson(jsonString);

import 'dart:convert';

Credit creditFromJson(String str) => Credit.fromJson(json.decode(str));

String creditToJson(Credit data) => json.encode(data.toJson());

class Credit {
  Credit({
    required this.data,
  });

  List<CreditData> data;

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        data: List<CreditData>.from(
            json["data"].map((x) => CreditData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CreditData {
  CreditData({
    required this.item,
    required this.price,
    required this.date,
    required this.kind,
  });

  String item;
  String price;
  DateTime date;
  String kind;

  factory CreditData.fromJson(Map<String, dynamic> json) => CreditData(
        item: json["item"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        kind: json["kind"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "price": price,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "kind": kind,
      };
}
