import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/Models/LuggagePost.dart';
import '../SizeConfig.dart';
import '../constants.dart';

class LuggageScreen extends StatefulWidget {
  const LuggageScreen({Key? key}) : super(key: key);

  @override
  _LuggageScreenState createState() => _LuggageScreenState();
}

class _LuggageScreenState extends State<LuggageScreen> {
  late LuggagePost luggagePost;

  var imageLoading = false;

  submit() async {
    luggagePost=  new LuggagePost(
        pId: "uyg",
        name: nameController.value.text,
        fatherName: fatherNameController.value.text,
        address: addressController.value.text,
        phoneNo: mobileNoController.value.text,
        passportNo: passportNoController.value.text,
        aadharCard: aadharNoController.value.text,
        city: cityController.value.text,
        flightTimeing: flightDateTimeNoController.value.text,
        flightNameAndNo: flightNameANDFlightNoController.value.text,
        description: descriptionOfLuggageController.value.text,
        detailsOfLuggage: detailOfLuggageController.value.text,
        totalWeight: totalWeightController.value.text,
        amountOffer: amountOfferController.value.text,
        receiverName: receiverNameController.value.text,
        receiverFatherName: receiverFatherNameController.value.text,
        receiverPassportNo: receiverPassportNoController.value.text,
        receiverAaddress: receiverAddressController.value.text,
        receiverPhoneNo: receiverMobileNoController.value.text,
        timing: 'tr',
        countryName: dropdownValue,
        alternatePhoneNo: 'tr',
        receiverPersonImage: 'tr',
        uId: 'tr');

    var res = await http.post(
        Uri.parse(
            "https://frozen-savannah-16893.herokuapp.com/User/luggagePost"),
        body:json.encode( luggagePost.toJson()),headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    if (res.statusCode == 200) {
      print("Luggage Post Success fully complete");
    }else {
      print("Luggage Post failed fully complete${res.statusCode}");

    }
  }

  bool imageupload() {
    setState(() async {
      if (CustomImagePicker().image != null) {
        var multipartFile = await http.MultipartFile.fromPath(
            'file', CustomImagePicker().image!.path.toString());
        var request = await http.MultipartRequest(
            "Post",
            Uri.parse(
                "https://frozen-savannah-16893.herokuapp.com/User/upload"));
        request.files.add(multipartFile);
        http.StreamedResponse response = await request.send();
        final respStr = await response.stream.bytesToString();
        var jsonData = jsonDecode(respStr);
        if (response.statusCode == 200) {
          // success
        }
        print("fbjkdvb hffr =er g=re =r-r"+response.statusCode.toString());
      }
      else{
        print("image url null");
      }
    });
    return false;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alterMobileNoController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController aadharNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController flightDateTimeNoController = TextEditingController();
  TextEditingController flightNameANDFlightNoController =
      TextEditingController();
  TextEditingController descriptionOfLuggageController =
      TextEditingController();
  TextEditingController detailOfLuggageController = TextEditingController();
  TextEditingController totalWeightController = TextEditingController();
  TextEditingController amountOfferController = TextEditingController();
  TextEditingController receiverNameController = TextEditingController();
  TextEditingController receiverFatherNameController = TextEditingController();
  TextEditingController receiverAddressController = TextEditingController();
  TextEditingController receiverMobileNoController = TextEditingController();
  TextEditingController receiverPassportNoController = TextEditingController();
  var countryNameList = [
    "Andorra",
    "United Arab Emirates",
    "Afghanistan",
    "Antigua and Barbuda",
    "Anguilla",
    "Albania",
    "Armenia",
    "Angola",
    "Antarctica",
    "Argentina",
    "American Samoa",
    "Austria",
    "Australia",
    "Aruba",
    "Åland",
    "Azerbaijan",
    "Bosnia and Herzegovina",
    "Barbados",
    "Bangladesh",
    "Belgium",
    "Burkina Faso",
    "Bulgaria",
    "Bahrain",
    "Burundi",
    "Benin",
    "Saint Barthélemy",
    "Bermuda",
    "Brunei",
    "Bolivia",
    "Bonaire, Sint Eustatius, and Saba",
    "Brazil",
    "Bahamas",
    "Bhutan",
    "Bouvet Island",
    "Botswana",
    "Belarus",
    "Belize",
    "Canada",
    "Cocos (Keeling) Islands",
    "DR Congo",
    "Central African Republic",
    "Congo Republic",
    "Switzerland",
    "Ivory Coast",
    "Cook Islands",
    "Chile",
    "Cameroon",
    "China",
    "Colombia",
    "Costa Rica",
    "Cuba",
    "Cabo Verde",
    "Curaçao",
    "Christmas Island",
    "Cyprus",
    "Czechia",
    "Germany",
    "Djibouti",
    "Denmark",
    "Dominica",
    "Dominican Republic",
    "Algeria",
    "Ecuador",
    "Estonia",
    "Egypt",
    "Western Sahara",
    "Eritrea",
    "Spain",
    "Ethiopia",
    "Finland",
    "Fiji",
    "Falkland Islands",
    "Micronesia",
    "Faroe Islands",
    "France",
    "Gabon",
    "United Kingdom",
    "Grenada",
    "Georgia",
    "French Guiana",
    "Guernsey",
    "Ghana",
    "Gibraltar",
    "Greenland",
    "The Gambia",
    "Guinea",
    "Guadeloupe",
    "Equatorial Guinea",
    "Greece",
    "South Georgia and South Sandwich Islands",
    "Guatemala",
    "Guam",
    "Guinea-Bissau",
    "Guyana",
    "Hong Kong",
    "Heard and McDonald Islands",
    "Honduras",
    "Croatia",
    "Haiti",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "Isle of Man",
    "India",
    "British Indian Ocean Territory",
    "Iraq",
    "Iran",
    "Iceland",
    "Italy",
    "Jersey",
    "Jamaica",
    "Jordan",
    "Japan",
    "Kenya",
    "Kyrgyzstan",
    "Cambodia",
    "Kiribati",
    "Comoros",
    "St Kitts and Nevis",
    "North Korea",
    "South Korea",
    "Kuwait",
    "Cayman Islands",
    "Kazakhstan",
    "Laos",
    "Lebanon",
    "Saint Lucia",
    "Liechtenstein",
    "Sri Lanka",
    "Liberia",
    "Lesotho",
    "Lithuania",
    "Luxembourg",
    "Latvia",
    "Libya",
    "Morocco",
    "Monaco",
    "Moldova",
    "Montenegro",
    "Saint Martin",
    "Madagascar",
    "Marshall Islands",
    "North Macedonia",
    "Mali",
    "Myanmar",
    "Mongolia",
    "Macao",
    "Northern Mariana Islands",
    "Martinique",
    "Mauritania",
    "Montserrat",
    "Malta",
    "Mauritius",
    "Maldives",
    "Malawi",
    "Mexico",
    "Malaysia",
    "Mozambique",
    "Namibia",
    "New Caledonia",
    "Niger",
    "Norfolk Island",
    "Nigeria",
    "Nicaragua",
    "Netherlands",
    "Norway",
    "Nepal",
    "Nauru",
    "Niue",
    "New Zealand",
    "Oman",
    "Panama",
    "Peru",
    "French Polynesia",
    "Papua New Guinea",
    "Philippines",
    "Pakistan",
    "Poland",
    "Saint Pierre and Miquelon",
    "Pitcairn Islands",
    "Puerto Rico",
    "Palestine",
    "Portugal",
    "Palau",
    "Paraguay",
    "Qatar",
    "Réunion",
    "Romania",
    "Serbia",
    "Russia",
    "Rwanda",
    "Saudi Arabia",
    "Solomon Islands",
    "Seychelles",
    "Sudan",
    "Sweden",
    "Singapore",
    "Saint Helena",
    "Slovenia",
    "Svalbard and Jan Mayen",
    "Slovakia",
    "Sierra Leone",
    "San Marino",
    "Senegal",
    "Somalia",
    "Suriname",
    "South Sudan",
    "São Tomé and Príncipe",
    "El Salvador",
    "Sint Maarten",
    "Syria",
    "Eswatini",
    "Turks and Caicos Islands",
    "Chad",
    "French Southern Territories",
    "Togo",
    "Thailand",
    "Tajikistan",
    "Tokelau",
    "Timor-Leste",
    "Turkmenistan",
    "Tunisia",
    "Tonga",
    "Turkey",
    "Trinidad and Tobago",
    "Tuvalu",
    "Taiwan",
    "Tanzania",
    "Ukraine",
    "Uganda",
    "U.S. Outlying Islands",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vatican City",
    "St Vincent and Grenadines",
    "Venezuela",
    "British Virgin Islands",
    "U.S. Virgin Islands",
    "Vietnam",
    "Vanuatu",
    "Wallis and Futuna",
    "Samoa",
    "Kosovo",
    "Yemen",
    "Mayotte",
    "South Africa",
    "Zambia",
    "Zimbabwe"
  ];
  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Immigration Adda',
          style: TextStyle(
            color: kBlueColor,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          textfield(context, nameController, "Name"),
          textfield(context, fatherNameController, "Father Name"),
          textfield(context, addressController, "Address"),
          textfield(context, mobileNoController, "Mobile No",
              keyboardType: TextInputType.phone),
          textfield(context, alterMobileNoController, "Alternate Mobile No",
              keyboardType: TextInputType.phone),
          textfield(context, passportNoController, "Passport Number"),
          textfield(context, aadharNoController, "Aadhaar Number",
              keyboardType: TextInputType.number),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Country"),
                value: dropdownValue,
                isExpanded: true,
                elevation: 16,
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 18,
                ),
                underline: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: kBlueColor,
                ),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value.toString();
                  });
                },
                items: countryNameList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          textfield(context, cityController, "City"),
          textfield(
              context, flightDateTimeNoController, "Flight date and time"),
          textfield(context, flightNameANDFlightNoController,
              "Flight Name and Number"),
          textfield(context, descriptionOfLuggageController,
              "Description of Luggage"),
          textfield(context, detailOfLuggageController, "Details of Luggage"),
          textfield(context, totalWeightController, "Total Weight",
              keyboardType: TextInputType.number),
          textfield(context, amountOfferController, "Amount offer",
              keyboardType: TextInputType.number),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              color: kBlueColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Center(
                  child: Text("Receiver Details",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          textfield(context, receiverNameController, "Receiver Name"),
          textfield(
              context, receiverFatherNameController, "Receiver Father Name"),
          textfield(context, receiverAddressController, "Receiver Address"),
          textfield(
              context, receiverMobileNoController, "Receiver Mobile Number",
              keyboardType: TextInputType.phone),
          textfield(context, receiverPassportNoController,
              "Receiver Passport Number"),
          CustomImagePicker(),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: kBlueColor),
                onPressed: () {
                  submit();
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenHeight! / 40),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textfield(
      BuildContext context, TextEditingController controller, String hint,
      {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
            border: OutlineInputBorder(),
            labelText: hint),
      ),
    );
  }
}

class CustomTextFieldForData extends StatelessWidget {
  final String? title;
  final String? dataToShow;

  const CustomTextFieldForData({
    Key? key,
    required this.title,
    required this.dataToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        child: TextFormField(
          controller: TextEditingController(
            text: dataToShow,
          ),
          decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(color: Colors.white, fontSize: 22)),
          readOnly: true,
          style: TextStyle(
            fontSize: 18,
            color: kBlueColor,
          ),
        ),
      ),
    );
  }
}

class CustomImagePicker extends StatefulWidget {
  late File? image;

  CustomImagePicker({Key? key, this.image}) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final picker = ImagePicker();
late File image;
 String url="";
  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);


      if (pickedFile != null) {
        url=pickedFile.path;
        image = File(pickedFile.path);
        var multipartFile = await http.MultipartFile.fromPath(
            'file', image.path.toString());
        var request = await http.MultipartRequest(
            "Post",
            Uri.parse(
                "https://frozen-savannah-16893.herokuapp.com/User/upload"));
        request.files.add(multipartFile);
        http.StreamedResponse response = await request.send();
        final respStr = await response.stream.bytesToString();
        var jsonData = jsonDecode(respStr);

        if (response.statusCode == 200) {
          // success
        }
        print("fbjkdvb hffr =er g=re =r-r"+response.statusCode.toString());
        print("fbjkdvb hffr =er g=re =r-r"+jsonData);
      }
      else{
        print("image url null");
      }



  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
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
        GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              height: 200,
              width: width * 1,
              child: Card(
                elevation: 1,
                child: url != ""
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 0.8),
                          borderRadius: BorderRadius.circular(3),
                          image:
                              DecorationImage(image: FileImage(image)),
                        ),
                      )
                    : Icon(Icons.add_a_photo),
              ),
            )),
      ],
    );
  }
}
