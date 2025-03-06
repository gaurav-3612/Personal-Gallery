import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/firebase_options.dart';
import 'package:gallery_app/pages/auth_page.dart';
import 'package:gallery_app/pages/home_page.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
