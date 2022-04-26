// To parse this JSON data, do
//
//     final stock = stockFromJson(jsonString);

import 'dart:convert';

Stock stockFromJson(String str) => Stock.fromJson(json.decode(str));

String stockToJson(Stock data) => json.encode(data.toJson());

class Stock {
  Stock({
    required this.data,
  });

  StockData data;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        data: StockData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class StockData {
  StockData({
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
  List<StockRecord> record;

  factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        cost: json["cost"],
        price: json["price"],
        diff: json["diff"],
        date: DateTime.parse(json["date"]),
        record: List<StockRecord>.from(
            json["record"].map((x) => StockRecord.fromJson(x))),
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

class StockRecord {
  StockRecord({
    required this.name,
    required this.date,
    required this.num,
    required this.oneStock,
    required this.cost,
    required this.price,
    required this.diff,
    required this.data,
  });

  String name;
  DateTime date;
  int num;
  String oneStock;
  int cost;
  String price;
  int diff;
  String data;

  factory StockRecord.fromJson(Map<String, dynamic> json) => StockRecord(
        name: json["name"],
        date: DateTime.parse(json["date"]),
        num: json["num"],
        oneStock: json["oneStock"],
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
        "oneStock": oneStock,
        "cost": cost,
        "price": price,
        "diff": diff,
        "data": data,
      };
}
