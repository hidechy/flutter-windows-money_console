// To parse this JSON data, do
//
//     final amazonPurchase = amazonPurchaseFromJson(jsonString);

import 'dart:convert';

AmazonPurchase amazonPurchaseFromJson(String str) =>
    AmazonPurchase.fromJson(json.decode(str));

String amazonPurchaseToJson(AmazonPurchase data) => json.encode(data.toJson());

class AmazonPurchase {
  AmazonPurchase({
    required this.data,
  });

  List<AmazonPurchaseData> data;

  factory AmazonPurchase.fromJson(Map<String, dynamic> json) => AmazonPurchase(
        data: List<AmazonPurchaseData>.from(
            json["data"].map((x) => AmazonPurchaseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AmazonPurchaseData {
  AmazonPurchaseData({
    required this.date,
    required this.price,
    required this.orderNumber,
    required this.item,
    required this.img,
  });

  DateTime date;
  String price;
  String orderNumber;
  String item;
  String img;

  factory AmazonPurchaseData.fromJson(Map<String, dynamic> json) =>
      AmazonPurchaseData(
        date: DateTime.parse(json["date"]),
        price: json["price"],
        orderNumber: json["order_number"],
        item: json["item"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "price": price,
        "order_number": orderNumber,
        "item": item,
        "img": img,
      };
}
