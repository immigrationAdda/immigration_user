class SellerListModel {
  SellerListModel({
    required this.sId,
    required this.companyName,
    required this.profilePicture,
    required this.city,
  });
  late final String sId;
  late final String companyName;
  late final String profilePicture;
  late final String city;

  SellerListModel.fromJson(Map<String, dynamic> json){
    sId = json['sId'];
    companyName = json['companyName'];
    profilePicture = json['profilePicture'];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sId'] = sId;
    _data['companyName'] = companyName;
    _data['profilePicture'] = profilePicture;
    _data['city'] = city;
    return _data;
  }
}