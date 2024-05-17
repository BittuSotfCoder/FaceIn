import 'dart:async';

import 'package:facein/Page/Home.dart';
import 'package:facein/Page/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart'; // Ensure you create this file for navigation

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEY_LOGIN = 'login';
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getString(KEY_LOGIN);
    Timer(Duration(seconds: 3), () {
      if (isLoggedIn!=null) {
        if (isLoggedIn.isEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginPage(
                      title: 'Home',
                    )),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Home(
                      title: 'Login',
                    )),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage(
                    title: 'Login',
                  )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/bittuScotter.jpg',
                height: 120, width: 120),
            SizedBox(height: 20),
            const Text(
              'Welcome to MyApp',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
