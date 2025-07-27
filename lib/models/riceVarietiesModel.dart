import 'package:flutter/material.dart';

class RiceVarietiesModel with ChangeNotifier {
  String? image;
  String? nameTH;
  String? nameEN;
  String? category;
  String? type;
  String? mating_couple;
  String? history;
  String? cert;
  String? product;
  String? characteristics;
  String? distinctive_feature;
  String? caution;
  String? recomd_area;

  RiceVarietiesModel({
    this.image,
    this.nameTH,
    this.nameEN,
    this.category,
    this.type,
    this.mating_couple,
    this.history,
    this.cert,
    this.product,
    this.characteristics,
    this.distinctive_feature,
    this.caution,
    this.recomd_area,
  });

  factory RiceVarietiesModel.fromJson(Map<String, dynamic> json) =>
      RiceVarietiesModel(
        image: json["image"] == null ? null : json["image"],
        nameTH: json["nameTH"] == null ? null : json["nameTH"],
        nameEN: json["nameEN"] == null ? null : json["nameEN"],
        category: json["category"] == null ? null : json["category"],
        type: json["type"] == null ? null : json["type"],
        mating_couple:
            json["mating_couple"] == null ? null : json["mating_couple"],
        history: json["history"] == null ? null : json["history"],
        cert: json["cert"] == null ? null : json["cert"],
        product: json["product"] == null ? null : json["product"],
        characteristics:
            json["characteristics"] == null ? null : json["characteristics"],
        distinctive_feature: json["distinctive_feature"] == null
            ? null
            : json["distinctive_feature"],
        caution: json["caution"] == null ? null : json["caution"],
        recomd_area: json["recomd_area"] == null ? null : json["recomd_area"],
      );
}
