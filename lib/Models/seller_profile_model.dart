class SellerProfileModel {
  SellerProfileModel({
    required this.sId,
    required this.companyName,
    required this.phoneNo,
    required this.email,
    required this.address,
    required this.city,
    required this.profilePicture,
    required this.joiningDate,
    required this.plan,
    required this.accountStatus,
    required this.status,
    required this.view,
    required this.star,
    required this.companyCertification,
    required this.companyImages,
    required this.reviews,
    required this.previousResult,
    required this.categories,
  });
  late final String sId;
  late final String companyName;
  late final String phoneNo;
  late final String email;
  late final String address;
  late final String city;
  late final String profilePicture;
  late final String joiningDate;
  late final String plan;
  late final String accountStatus;
  late final String status;
  late final int view;
  late final int star;
  late final List<String> companyCertification;
  late final List<String> companyImages;
  late final List<String> reviews;
  late final List<String> previousResult;
  late final List<String> categories;

  SellerProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['sId'];
    companyName = json['companyName'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    profilePicture = json['profilePicture'];
    joiningDate = json['joiningDate'];
    plan = json['plan'];
    accountStatus = json['accountStatus'];
    status = json['status'];
    view = json['view'];
    star = json['star'];
    companyCertification =
        List.castFrom<dynamic, String>(json['companyCertification']);
    companyImages = List.castFrom<dynamic, String>(json['companyImages']);
    reviews = List.castFrom<dynamic, String>(json['reviews']);
    previousResult = List.castFrom<dynamic, String>(json['previousResult']);
    categories = List.castFrom<dynamic, String>(json['categories']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sId'] = sId;
    _data['companyName'] = companyName;
    _data['phoneNo'] = phoneNo;
    _data['email'] = email;
    _data['address'] = address;
    _data['city'] = city;
    _data['profilePicture'] = profilePicture;
    _data['joiningDate'] = joiningDate;
    _data['plan'] = plan;
    _data['accountStatus'] = accountStatus;
    _data['status'] = status;
    _data['view'] = view;
    _data['star'] = star;
    _data['companyCertification'] = companyCertification;
    _data['companyImages'] = companyImages;
    _data['reviews'] = reviews;
    _data['previousResult'] = previousResult;
    _data['categories'] = categories;
    return _data;
  }
}
