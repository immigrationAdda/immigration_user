import 'package:dio/dio.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/Screens/partner_prefrence.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/model/Get%20Data/get_profile.dart';
import 'package:immigration/matrimonial/model/Post%20Data/abroad_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/business_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/family_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/ilets_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/marriage_interested_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/partner_prefference_details.dart';
import 'package:immigration/matrimonial/model/Post%20Data/property_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/qualification_model.dart';

class GetFunction{
  ProfileModel? _profileModel;
  List<ProfileModel> profileModelList = [];
  Dio dio = Dio();
 Future<ProfileModel> getUserDetails()async{
   Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.PERSONAL_DETAILS_GET+"0123");
      if(value.statusCode == 200)
        {
          _profileModel = ProfileModel.fromJson(value.data);
          profileModelList.add(_profileModel!);
          print(value.data);
        }
      return _profileModel!;
  }


  FamilyModel? _personalInfoModel;
  List<FamilyModel> PersonalInfoModelList = [];
  Future<FamilyModel> getFamilyDetails()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.FAMILY_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _personalInfoModel = FamilyModel.fromJson(value.data);
      PersonalInfoModelList.add(_personalInfoModel!);
      print(value.data);
    }
    return _personalInfoModel!;
  }
  QualificationModel? _QualificationModel;
  List<QualificationModel> QualificationModelList = [];
  Future<QualificationModel> getQualifictionDetails()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.QUALIFICATION_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _QualificationModel = QualificationModel.fromJson(value.data);
      QualificationModelList.add(_QualificationModel!);
      print(value.data);
    }
    return _QualificationModel!;
  }
  PropertyModel? _PropertyModel;
  List<PropertyModel>PropertyModelList = [];
  Future<PropertyModel> getPropertyModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.PROPERTIES_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _PropertyModel = PropertyModel.fromJson(value.data);
      PropertyModelList.add(_PropertyModel!);
      print(value.data);
    }
    return _PropertyModel!;
  }
  BusinessModel? _BusinessModel;
  List<BusinessModel>BusinessModelList = [];
  Future<BusinessModel> getBusinessModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.BUSINESS_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _BusinessModel = BusinessModel.fromJson(value.data);
      BusinessModelList.add(_BusinessModel!);
      print(value.data);
    }
    return _BusinessModel!;
  }
  IletsModel? _IletsModel;
  List<IletsModel>IletsModelList = [];
  Future<IletsModel> getIletsModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.IELTS_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _IletsModel = IletsModel.fromJson(value.data);
      IletsModelList.add(_IletsModel!);
      print(value.data);
    }
    return _IletsModel!;
  }
  MarriageInterestModel? _MarriageInterestModel;
  List<MarriageInterestModel>MarriageInterestModelList = [];
  Future<MarriageInterestModel> getMarriageInterestModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.MARRIGEINTEREST_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _MarriageInterestModel= MarriageInterestModel.fromJson(value.data);
      MarriageInterestModelList.add(_MarriageInterestModel!);
      print(value.data);
    }
    return _MarriageInterestModel!;
  }
  PartnerPreferenceModel? _PartnerPreferenceModel;
  List<PartnerPreferenceModel>PartnerPreferenceModelList = [];
  Future<PartnerPreferenceModel> getPartnerPreferenceModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.PARTNER_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _PartnerPreferenceModel = PartnerPreferenceModel.fromJson(value.data);
      PartnerPreferenceModelList.add(_PartnerPreferenceModel!);
      print(value.data);
    }
    return _PartnerPreferenceModel!;
  }
 AbroadModel? _AbroadModel;
  List<AbroadModel>AbroadModelList = [];
  Future<AbroadModel> getAbroadModel()async{
    Response value = await dio.get(ApiConfig.BASE_URL+ApiConfig.ABROAD_DETAILS_GET+"0123");
    if(value.statusCode == 200)
    {
      _AbroadModel = AbroadModel.fromJson(value.data);
      AbroadModelList.add(_AbroadModel!);
      print(value.data);
    }
    return _AbroadModel!;
  }
}


