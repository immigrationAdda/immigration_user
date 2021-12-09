
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Forms/education_loan.dart';
import 'package:immigration/Forms/travell_insurance.dart';
import 'package:immigration/constants.dart';

class Passport extends StatefulWidget {
  const Passport({Key? key}) : super(key: key);

  @override
  _PassportState createState() => _PassportState();
}

class _PassportState extends State<Passport> {
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
          child: Text("Education Loan"),
        ),
        backgroundColor: kBlueColor,
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Personal Information',
                    style: TextStyle(
                        fontSize: 18,
                        color: kBlueColor,
                        fontWeight: FontWeight.bold
                    ),
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
                        child: Text('Passport Information',
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
                          hintText: "Type of passport",
                          labelText: "Type of passport"),
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
                      // GestureDetector(
                      //     onTap: () {
                      //       getImage().then((value) => uploadImage());
                      //     },
                      //     child: Container(
                      //       height: height * 0.35,
                      //       width: width * 0.8,
                      //       child: Card(
                      //         elevation: 1,
                      //         child: _image != null
                      //             ? Container(
                      //           decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: FileImage(_image!)),
                      //           ),
                      //         )
                      //             : Icon(Icons.add_a_photo),
                      //       ),
                      //     )),
                    ],
                  ),
                ),
              ),



              // CustomButton(
              //     buttonName: "Submit",
              //     icon: Icons.done,
              //     onTap: () {
              //       // setState(() {
              //       //   submitcheck = true;
              //       // });
              //       if (_formKey.currentState!.validate()) {
              //         print("-----------------------object");
              //         postData();
              //       }
              //       if (companyNameController!.text.length < 3) {
              //         showToast(context, "Name should be correct");
              //       }
              //       // else if (fathernameController.text.length < 3) {
              //       //   showToast(context, "Father Name should be correct");
              //       // }
              //       else if (companyAddressController!.text.length < 3) {
              //         showToast(context, "Address should be correct");
              //       } else if (mobileController!.text.length < 10) {
              //         showToast(context, "Mobile Number should be correct");
              //       } else if (alterMobileController!.text.length < 10) {
              //         showToast(
              //             context, "Alternate Mobile Number should be correct");
              //       }
              //       // else if (aadhaarController!.text.length < 12) {
              //       //   showToast(context, "Aadhar Number should be correct");
              //       // }
              //       // else if (passportController!.text.length < 5) {
              //       //   showToast(context, "Passport Number should be correct");
              //       // }
              //       else if (noEmployeeController!.text.length == 0) {
              //         showToast(context, "No of employee  should be correct");
              //       } else if (annualTurnOverController!.text.length < 3) {
              //         showToast(context, "Annual turn over should be correct");
              //       } else if (totalAreaController!.text.length == 0) {
              //         showToast(context, "Total area should be correct");
              //       } else if (investmentRatioController!.text.length == 0) {
              //         showToast(context, "Investment ratio should be correct");
              //       } else if (returnInvestmentController!.text.length == 0) {
              //         showToast(context, "Return investment should be correct");
              //       } else if (_image == null) {
              //         showToast(context, "Please upload image");
              //       }
              //     }
              //
              //   // if (nameController!.text.isEmpty) {
              //   // showDialog(
              //   //     context: context,
              //   //     builder: (context) {
              //   //       return AlertDialog(
              //   //         title: Text("something went wrong!"),
              //
              //   //       );
              //   //     });
              //   // }
              //   //postData();
              //
              // ),
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

  //final bool? submit;
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
              // errorText: (submit == true && controller!.text.isEmpty)
              //     ? "Please fill"
              //     : null,
              hintText: hint,
              // suffixIcon: (submit == true && controller!.text.isEmpty)
              //     ? Icon(
              //         Icons.error,
              //         color: Colors.red,
              //       )
              //     : null
            ),
          ),
        ),
      ],
    );
  }
}
