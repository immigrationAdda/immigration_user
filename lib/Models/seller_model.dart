// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

List<SellerModel> sellerModelFromJson(String str) => List<SellerModel>.from(
    json.decode(str).map((x) => SellerModel.fromJson(x)));

String sellerModelToJson(List<SellerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellerModel {
  SellerModel({
    this.sId,
    this.companyName,
    this.profilePicture,
    this.city,
    this.categories,
  });

  String? sId;
  String? companyName;
  String? profilePicture;
  String? city;
  List<String>? categories;

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        sId: json["sId"],
        companyName: json["companyName"],
        profilePicture: json["profilePicture"],
        city: json["city"],
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "sId": sId,
        "companyName": companyName,
        "profilePicture": profilePicture,
        "city": city,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
      };
}
