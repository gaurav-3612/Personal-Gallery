// import 'package:detect_it/pages/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Info extends StatelessWidget {
//   Info({super.key});
//   final user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 214, 197, 214),
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment(0.8, 1),
//               colors: <Color>[
//                 Color(0xff1f005c),
//                 Color(0xff5b0060),
//                 Color(0xff870160),
//                 Color(0xffac255e),
//                 Color(0xffca485c),
//                 Color(0xffe16b5c),
//                 Color(0xfff39060),
//                 Color(0xffffb56b),
//               ], // Gradient from https://learnui.design/tools/gradient-generator.html
//               tileMode: TileMode.mirror,
//             ),
//           ),
//         ),
//         // backgroundColor: Color.fromARGB(170, 252, 175, 168),
//         elevation: 0,

//         title: Center(
//           child: Text(
//             'About',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: const Color.fromARGB(255, 255, 255, 255)),
//           ),
//         ),
//         iconTheme: IconThemeData(
//             color: Color.fromARGB(255, 255, 255, 255), size: 30.0),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 214, 197, 214),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   "Detect It App",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             color: const Color.fromARGB(255, 214, 197, 214),
//             height: 150,
//             child:
//                 Image.asset('lib/images/face-scan.png'), // Ensure correct path
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 214, 197, 214),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: Text(
//                   "2024-present",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Divider(
//                   thickness: 2,
//                   color: const Color.fromARGB(255, 95, 93, 93),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   gradient: const LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment(0.8, 1),
//                     colors: <Color>[
//                       Color(0xff1f005c),
//                       Color(0xff5b0060),
//                       Color(0xff870160),
//                       Color(0xffac255e),
//                       Color(0xffca485c),
//                       Color(0xffe16b5c),
//                       Color(0xfff39060),
//                       Color(0xffffb56b),
//                     ], // Gradient from https://learnui.design/tools/gradient-generator.html
//                     tileMode: TileMode.mirror,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: MediaQuery.sizeOf(context).width * .05),
//                   child: Text(
//                     "Help",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Divider(
//                   thickness: 2,
//                   color: const Color.fromARGB(255, 95, 93, 93),
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 214, 197, 214),
//               ),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Text(
//                       "Welcome to the Object Detection app! Our app allows you to identify and analyze objects in both live images and photos from your gallery. To use the app, simply follow these steps:",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                         text: "Live Image Detection:",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 "Tap the camera icon to start a live feed from your device’s camera. The app will process the live image and highlight detected objects in real-time.",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               wordSpacing: 1.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                         text: "Gallery Image Detection:",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 "Tap the gallery icon to select a photo from your device’s gallery. Once you choose an image, the app will analyze it and display detected objects with relevant information.",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               wordSpacing: 1.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
