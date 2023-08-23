// To parse this JSON data, do
//
//     final boredApi = boredApiFromJson(jsonString);

import 'dart:convert';

BoredApiModel boredApiFromJson(String str) =>
    BoredApiModel.fromJson(json.decode(str));

String boredApiToJson(BoredApiModel data) => json.encode(data.toJson());

class BoredApiModel {
  String activity;
  String type;
  int participants;
  int price;
  String link;
  String key;
  double accessibility;

  BoredApiModel({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory BoredApiModel.fromJson(Map<String, dynamic> json) => BoredApiModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}
