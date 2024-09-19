import 'dart:async';

import 'package:facein/Page/Home.dart';
import 'package:facein/Page/LoginPage.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../services/NotificationService.dart'; // Ensure you create this file for navigation

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEY_LOGIN = 'login';
  @override
  void initState() {
    super.initState();
      super.initState();
      _checkPermissions();
      _initialize();
    _navigateToHome();
  }

  Future<void> _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.notification,
    ].request();
  }


  Future<void> _initialize() async {
    final notificationService = NotificationServices();
    notificationService.firebaseInit();
    notificationService.getDeviceToken().then((onValue){
      if (kDebugMode) {
        print('New token: $onValue');
      }
    });
  }

  _navigateToHome() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getString(KEY_LOGIN);
    Timer(const Duration(seconds: 3), () {
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
            const SizedBox(height: 20),
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
