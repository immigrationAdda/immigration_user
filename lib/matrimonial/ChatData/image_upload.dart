// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:immigration/matrimonial/ChatData/masseges.dart';
// import 'package:immigration/matrimonial/Constants/const.dart';
// import 'package:immigration/matrimonial/Post/post_view.dart';
//
// class ImageUpload extends StatefulWidget {
//   const ImageUpload({Key? key}) : super(key: key);
//
//   @override
//   _ImageUploadState createState() => _ImageUploadState();
// }
//
// class _ImageUploadState extends State<ImageUpload> {
//   final ImagePicker _picker = ImagePicker();
//   late File _image;
//
//
//
//
//   void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             height: 230,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     "Pic Image From",
//                     style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                     },
//                     icon: const Icon(Icons.camera),
//                     label: const Text("CAMERA"),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateColor.resolveWith(
//                             (states) => const Color(0xffff5275),
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40.0),
//                         ),
//                       ),
//                       ),
//                     ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//
//                     },
//                     icon: const Icon(Icons.image),
//                     label: const Text("GALLERY"),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateColor.resolveWith(
//                             (states) => const Color(0xffff5275),
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(Icons.close),
//                     label: const Text("CANCEL"),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateColor.resolveWith(
//                             (states) => const Color(0xffff5275),
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffff5275),
//         leading: IconButton(icon: const Icon(Icons.arrow_back),
//           tooltip: "Cancel and Return to List",
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//         ),
//         automaticallyImplyLeading: false,
//         title: const Center(
//           child: Text('Upload your Status',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//
//             ),),
//         ),
//         actions: <Widget>[
//           TextButton(onPressed: (){ Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) =>  Masseges()),
//           );},
//               child: const Text('Skip',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                 ),)),
//         ],
//       ),
//
//       bottomNavigationBar: GestureDetector(
//
//         onTap: () {
//           // Navigator.pushReplacement(
//           //   context,
//           //   MaterialPageRoute(builder: (context) =>  PostView()),
//           // );
//         },
//         child: Container(
//           color: const Color(0xffff5275),
//           height: 45,
//           child: const Center(
//             child: Text('Next',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//               ),),
//           ),
//         ),
//       ),
//
//       body: Stack(
//         children: [
//       Center(
//       child: GestureDetector(
//       onTap: () async {
//
//     XFile? image = await _picker.pickImage(
//     source: ImageSource.gallery , imageQuality: 50, preferredCameraDevice: CameraDevice.front);
//     setState(() {
//     _image = (File(image!.path));
//     });
//     },
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             color: Colors.red[200]),
//         child: _image != null
//             ? Image.file(
//           _image,
//           width: 200.0,
//           height: 200.0,
//           fit: BoxFit.fitHeight,
//         )
//             : Container(
//           decoration: BoxDecoration(
//               color: Colors.red[200]),
//           width: 200,
//           height: 200,
//           child: Icon(
//             Icons.camera_alt,
//             color: Colors.grey[800],
//           ),
//         ),)),),
//           Center(
//             child: Card(
//               shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(130)),
//
//               margin: EdgeInsets.all(10),
//               child: _image != null
//                   ? ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: Image.file(
//                   _image!,
//                   width: 250,
//                   height: 250,
//                   fit: BoxFit.cover,
//                 ),
//               )
//                   : Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.black26,width: 0.8),
//                     borderRadius: BorderRadius.circular(130)),
//                 width: 250,
//                 height: 250,
//                 child: Icon(
//                   Icons.person,
//                   size: 150,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ),
//           ),
//
//           ],
//       ),
//     );
//   }
// }
