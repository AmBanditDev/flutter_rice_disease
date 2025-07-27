import 'package:flutter/material.dart';

class RiceDiseaseModel with ChangeNotifier {
  String? image;
  String? nameTH;
  String? nameEN;
  String? cause;
  String? causeName;
  String? source;
  String? details;
  String? methods;
  String? epidemic;
  String? caution;

  RiceDiseaseModel({
    this.image,
    this.nameTH,
    this.nameEN,
    this.cause,
    this.causeName,
    this.source,
    this.details,
    this.methods,
    this.epidemic,
    this.caution,
  });

  factory RiceDiseaseModel.fromJson(Map<String, dynamic> json) =>
      RiceDiseaseModel(
        image: json["image"] == null ? null : json["image"],
        nameTH: json["nameTH"] == null ? null : json["nameTH"],
        nameEN: json["nameEN"] == null ? null : json["nameEN"],
        cause: json["cause"] == null ? null : json["cause"],
        causeName: json["causeName"] == null ? null : json["causeName"],
        source: json["source"] == null ? null : json["source"],
        details: json["details"] == null ? null : json["details"],
        methods: json["methods"] == null ? null : json["methods"],
        epidemic: json["epidemic"] == null ? null : json["epidemic"],
        caution: json["caution"] == null ? null : json["caution"],
      );
}
