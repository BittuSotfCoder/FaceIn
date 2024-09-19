// flutter build apk --build-name=1.0 --build-number=1 
import 'package:facein/Page/splasg.dart';
import 'package:facein/cropimage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceIndia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
      // home: const HomeScreen(),
    );
  }
}

