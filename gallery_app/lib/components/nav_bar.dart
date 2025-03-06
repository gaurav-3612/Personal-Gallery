// import 'package:gallery_app/pages/accounts.dart';
// import 'package:gallery_app/pages/info.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   NavBar({super.key});
//   final user = FirebaseAuth.instance.currentUser;

//   // Sign user out method
//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color.fromARGB(255, 214, 197, 214),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
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
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'DETECT IT',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.person, // Use an icon of your choice
//               size: 30.0, // Adjust size as needed
//               color: Color.fromARGB(255, 76, 133, 255),
//             ),
//             title: Text(
//               'Accounts',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Accounts()),
//               );
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(
//               Icons.info, size: 30.0, // Adjust size as needed
//               color: Color.fromARGB(255, 76, 133, 255),
//             ),
//             title: Text(
//               'App info',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Info()),
//               );
//             },
//           ),

//           Divider(),
//           ListTile(
//             leading: Icon(
//               Icons.logout,
//               size: 30.0, // Adjust size as needed
//               color: Color.fromARGB(255, 76, 133, 255),
//             ),
//             title: Text(
//               'LogOut',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             onTap: signUserOut,
//           ),
//           // Uncomment and modify this section if needed

//           /* Divider(),
//           ListTile(
//             leading: Icon(Icons.policy),
//             title: Text('Theme'),
//             onTap: () => null,
//           ),*/
//         ],
//       ),
//     );
//   }
// }
