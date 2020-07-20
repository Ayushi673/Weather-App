import 'package:flutter/material.dart';
import 'pages/signup.dart';
import 'pages/login.dart';
import 'pages/homepage.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignUpPage(),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context)=>LoginPage(),
        SignUpPage.id: (context)=>SignUpPage(),
        HomePage.id:  (context)=>HomePage(),
      },
    );
  }
}

/*
 firebase_auth: ^0.14.0+5
  cloud_firestore: ^0.12.9+4
  firebase_core: 0.4.2+1
 */