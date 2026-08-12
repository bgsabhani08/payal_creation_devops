import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:payal_creation/pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  // This line is required before using any Firebase services
  WidgetsFlutterBinding.ensureInitialized();
  
  // This connects your app to the Firebase project you just selected
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payal creation admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home_Page(),
    );
  }
}