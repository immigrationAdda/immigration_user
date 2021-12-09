
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/constants.dart';

class TravelInsuranse extends StatefulWidget {
  const TravelInsuranse({Key? key}) : super(key: key);

  @override
  _TravelInsuranseState createState() => _TravelInsuranseState();
}

class _TravelInsuranseState extends State<TravelInsuranse> {
  TextEditingController? nameController = new TextEditingController();
  TextEditingController? companyNameController = new TextEditingController();
  TextEditingController? companyAddressController = new TextEditingController();
  TextEditingController? gstController = new TextEditingController();
  TextEditingController? licenseController = new TextEditingController();
  TextEditingController? stablizeController = new TextEditingController();
  TextEditingController? employeeController = new TextEditingController();
  TextEditingController fathernameController = new TextEditingController();
  late TextEditingController? addressController = new TextEditingController();
  late TextEditingController? mobileController = new TextEditingController();
  late TextEditingController? alternateMobileController =
  new TextEditingController();
  late TextEditingController? passportController = new TextEditingController();
  late TextEditingController? aadhaarController = new TextEditingController();
  late TextEditingController? noEmployeeController =
  new TextEditingController();
  late TextEditingController? annualTurnOverController =
  new TextEditingController();
  late TextEditingController? investmentRatioController =
  new TextEditingController();
  late TextEditingController? returnInvestmentController =
  new TextEditingController();
  late TextEditingController? totalAreaController = new TextEditingController();
  late TextEditingController? alterMobileController =
  new TextEditingController();
  late TextEditingController? contactPersonController =
  new TextEditingController();

  var yearSelected;
  var floorSelected;

  //File? _image;
  Dio dio = Dio();
//  PostMethods _postMethods = PostMethods();
  List areaType = [
    "Commercial",
    "Residential",
    "SCO",
    "Booth",
  ];

  var selectedAreaType;

  int statuscode = 0;
  String imgUrl = '';
  final picker = ImagePicker();

  late TextEditingController? franchiseOfferCityController =
  new TextEditingController();
  // showToast(BuildContext context, String msg) {
  //   Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  // }

  var newConteoller;
  // postData() {
  //   var franchiseData = FranchiseModel(
  //       sId: FirebaseAuth.instance.currentUser!.uid,
  //       companyName: companyNameController!.text,
  //       contactPerson: contactPersonController!.text,
  //       gstNo: gstController!.text,
  //       licenseNo: licenseController!.text,
  //       offerCity: franchiseOfferCityController!.text,
  //       companyAddress: companyAddressController!.text,
  //       mobileNo: mobileController!.text,
  //       alternateMobileNo: alternateMobileController!.text,
  //       year: yearSelected,
  //       totalNoOfEmployess: noEmployeeController!.text,
  //       turnOver: annualTurnOverController!.text,
  //       areaRequired: totalAreaController!.text,
  //       areaType: selectedAreaType,
  //       totalInvestmentRequired: investmentRatioController!.text,
  //       returnOfInvestment: returnInvestmentController!.text,
  //       postImage: imgUrl);
  //
  //   _postMethods.franchisePost(franchiseData);
  // }

  // Future getImage() async {
  //   final pickedFile =
  //   await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print("Image is not added!");
  //     }
  //   });
  // }

  // uploadImage() async {
  //   setState(() {
  //     statuscode = 100;
  //   });
  //   String fileName = _image!.path.split('.').last;
  //   print(fileName);
  //   FormData formData = FormData.fromMap({
  //     "file": await MultipartFile.fromFile(_image!.path,
  //         contentType: MediaType("image", fileName))
  //   });
  //   return await dio
  //       .postUri(Uri.parse(ApiConfig.BASE_URL + "User/upload"), data: formData)
  //       .then((value) {
  //     // if (response!.statusCode != 200) {
  //
  //     // }
  //
  //     if (value.statusCode == 200) {
  //       print(value.data);
  //       setState(() {
  //         statuscode = value.statusCode!;
  //         imgUrl = value.data;
  //       });
  //     }
  //   });
  // }

  //bool? submitcheck = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Travel Insurance")),
        ),
        backgroundColor: kBlueColor,
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text('Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CustomTextFormField(
                          readOnly: false,
                          controller: companyNameController,
                          hintText: "Enter Name here",
                          labelText: "Name"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: companyAddressController,
                          hintText: "Enter Father/Husband Name here",
                          labelText: "Father / Husband Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: contactPersonController,
                          hintText: "Enter Date of Birth here",
                          labelText: "Date of Birth"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: mobileController,
                          hintText: "Enter City Name here",
                          labelText: "City Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: alterMobileController,
                          hintText: "Enter  Mobile here",
                          labelText: " Mobile No"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Email Id here",
                          labelText: "Email Id"),
                      Center(
                        child: Text('Travel Insurance Information',
                          style: TextStyle(
                              fontSize: 18,
                              color: kBlueColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      CustomTextFormField(
                          readOnly: false,
                          controller: stablizeController,
                          hintText: "Are you physically fit ?",
                          labelText: "Are you physically fit ?"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: noEmployeeController,
                          hintText: "Purpose of going Abroad",
                          labelText: "Purpose of going Abroad"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: annualTurnOverController,
                          hintText: "Which country do you want to go to?",
                          labelText: "Which country do you want to go to?"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: franchiseOfferCityController,
                          hintText: "Date of Travel ",
                          labelText: "Date of Travel "),
                      CustomTextFormField(
                          readOnly: false,
                          controller: totalAreaController,
                          hintText: "Return Date of Travel ",
                          labelText: "Return Date of Travel"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: investmentRatioController,
                          hintText: "Type of Trip",
                          labelText: "Type of Trip"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "When to take policy",
                          labelText: "When to take policy"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "Which company policy do you want to take?",
                          labelText: "Which company policy do you want to take?"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "how much insurance do you want to take",
                          labelText: "how much insurance do you want to take"),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Upload photo:",
                            style: TextStyle(
                              color: kBlueColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              child: statuscode == 100
                  ? AlertDialog(
                insetPadding:
                EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                content: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: SpinKitCubeGrid(
                    color: kBlueColor,
                  ),
                ),
              )
                  : Container())
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String titleName;
  final String hint;

  final String Function(String?)? validator;
  const NameTextField({
    Key? key,
    required this.titleName,
    // this.submit,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            titleName,
            style: TextStyle(
              color: kBlueColor,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please fill field";
              }
            },
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kBlueColor,
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
        required this.controller,
        required this.hintText,
        required this.labelText,
        this.onTap,
        required this.readOnly})
      : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: onTap,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please fill field";
          }
        },
        readOnly: readOnly,
        controller: controller,
        cursorColor: kBlueColor,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kBlueColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kBlueColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kBlueColor)),
          hoverColor: kBlueColor,
          focusColor: kBlueColor,
          labelText: labelText,
          labelStyle: TextStyle(color: kBlueColor),
          hintText: hintText,
          hintStyle: TextStyle(color: kBlueColor),
        ),
      ),
    );
  }
}