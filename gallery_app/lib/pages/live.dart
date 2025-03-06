// import 'package:detect_it/pages/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:detect_it/components/nav_bar.dart';
// import 'package:detect_it/pages/camera.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Live extends StatefulWidget {
//   const Live({super.key});

//   @override
//   State<Live> createState() => _LiveState();
// }

// class _LiveState extends State<Live> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final user = FirebaseAuth.instance.currentUser;

//   // Sign user out method
//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: NavBar(), // The drawer is assigned here
//       appBar: AppBar(
//         /* automaticallyImplyLeading:
//             false, // this will hide Drawer hamburger icon
//         actions: <Widget>[
//           Container()
//         ],*/ // this will hide endDrawer hamburger icon
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
//         elevation: 0,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 95),
//           child: Text(
//             'Live',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 color: const Color.fromARGB(255, 254, 254, 254)),
//           ),
//         ),
//         iconTheme: IconThemeData(
//             color: Color.fromARGB(255, 255, 255, 255), size: 30.0),
//         //actions: [], // Ensure no drawer icon or action is included here
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 214, 197, 214),
//         ),
//         child: Center(
//           child: Text(""),
//         ),
//       ),
//       bottomNavigationBar: Stack(
//         // we will have a custom container and bottom navigation bar on top of each other
//         children: [
//           Container(
//             // this is the decoration of the container for gradient look
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment(0.8, 1),
//                 colors: <Color>[
//                   Color(0xff1f005c),
//                   Color(0xff5b0060),
//                   Color(0xff870160),
//                   Color(0xffac255e),
//                   Color(0xffca485c),
//                   Color(0xffe16b5c),
//                   Color(0xfff39060),
//                   Color(0xffffb56b),
//                 ], // Gradient from https://learnui.design/tools/gradient-generator.html
//                 tileMode: TileMode.mirror,
//               ),
//             ),
//             // i have found out the height of the bottom navigation bar is roughly 60
//             height: 60,
//           ),
//           CurvedNavigationBar(
//             backgroundColor: Colors.transparent,
//             color: const Color.fromARGB(255, 214, 197, 214),

//             // remove elevation because it causes weird shadow
//             animationDuration: Duration(milliseconds: 300),
//             index: 2,
//             onTap: (index) {
//               if (index == 1) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Camera()),
//                 );
//               }
//               if (index == 0) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               }
//             },
//             items: [
//               Icon(
//                 Icons.photo,
//                 size: 30.0, // Adjust size as needed
//                 color: Color.fromARGB(255, 76, 133, 255),
//               ),
//               Icon(
//                 Icons.camera,
//                 size: 30.0, // Adjust size as needed
//                 color: Color.fromARGB(255, 76, 133, 255),
//               ),
//               Icon(
//                 Icons.camera_enhance,
//                 size: 30.0, // Adjust size as needed
//                 color: Color.fromARGB(255, 76, 133, 255),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
