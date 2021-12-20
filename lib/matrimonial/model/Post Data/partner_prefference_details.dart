// To parse this JSON data, do
//
//     final partnerPreferenceModel = partnerPreferenceModelFromJson(jsonString);

import 'dart:convert';

PartnerPreferenceModel partnerPreferenceModelFromJson(String str) => PartnerPreferenceModel.fromJson(json.decode(str));

String partnerPreferenceModelToJson(PartnerPreferenceModel data) => json.encode(data.toJson());

class PartnerPreferenceModel {
  PartnerPreferenceModel({
    this.mId,
    this.preferredCountry,
    this.preferredNationality,
    this.preferredLivingStatus,
    this.preferredWorkingStatus,
    this.preferredAge,
    this.preferredHeight,
    this.preferredHighestQualification,
    this.preferredMaritalStatus,
    this.preferredBodyType,
    this.preferredComplexion,
    this.preferredDiet,
    this.preferredDrinking,
    this.preferredSmoking,
    this.preferredMotherTounge,
  });

  String? mId;
  String? preferredCountry;
  String? preferredNationality;
  String? preferredLivingStatus;
  String? preferredWorkingStatus;
  String? preferredAge;
  String? preferredHeight;
  String? preferredHighestQualification;
  String? preferredMaritalStatus;
  String? preferredBodyType;
  String? preferredComplexion;
  String? preferredDiet;
  String? preferredDrinking;
  String? preferredSmoking;
  String? preferredMotherTounge;

  factory PartnerPreferenceModel.fromJson(Map<String, dynamic> json) => PartnerPreferenceModel(
    mId: json["mId"],
    preferredCountry: json["PreferredCountry"],
    preferredNationality: json["PreferredNationality"],
    preferredLivingStatus: json["PreferredLivingStatus"],
    preferredWorkingStatus: json["PreferredWorkingStatus"],
    preferredAge: json["PreferredAge"],
    preferredHeight: json["PreferredHeight"],
    preferredHighestQualification: json["PreferredHighestQualification"],
    preferredMaritalStatus: json["PreferredMaritalStatus"],
    preferredBodyType: json["PreferredBodyType"],
    preferredComplexion: json["PreferredComplexion"],
    preferredDiet: json["PreferredDiet"],
    preferredDrinking: json["PreferredDrinking"],
    preferredSmoking: json["PreferredSmoking"],
    preferredMotherTounge: json["PreferredMotherTounge"],
  );

  Map<String, dynamic> toJson() => {
    "mId": mId,
    "PreferredCountry": preferredCountry,
    "PreferredNationality": preferredNationality,
    "PreferredLivingStatus": preferredLivingStatus,
    "PreferredWorkingStatus": preferredWorkingStatus,
    "PreferredAge": preferredAge,
    "PreferredHeight": preferredHeight,
    "PreferredHighestQualification": preferredHighestQualification,
    "PreferredMaritalStatus": preferredMaritalStatus,
    "PreferredBodyType": preferredBodyType,
    "PreferredComplexion": preferredComplexion,
    "PreferredDiet": preferredDiet,
    "PreferredDrinking": preferredDrinking,
    "PreferredSmoking": preferredSmoking,
    "PreferredMotherTounge": preferredMotherTounge,
  };
}
