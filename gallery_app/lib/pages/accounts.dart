// import 'package:detect_it/pages/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Accounts extends StatelessWidget {
//   Accounts({super.key});
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

//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 110),
//           child: Text(
//             'Info',
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
//             padding: const EdgeInsets.symmetric(vertical: 50),
//             color: const Color.fromARGB(255, 214, 197, 214),
//             height: 300,
//             child: Image.asset('lib/images/boy.png'), // Ensure correct path
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 214, 197, 214),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: Text(
//                   "LOGGED IN AS: " + (user?.email ?? 'No email available'),
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
