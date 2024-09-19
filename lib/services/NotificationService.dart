import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Request notification permission from the user
  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User denied permission');
      }
    }
  }

  // Retrieve the device token
  Future<String?> getDeviceToken() async {
    return await messaging.getToken();
  }

  // Listen for token refresh
  Future<void> isTokenRefresh() async {
    messaging.onTokenRefresh.listen((String newToken) {
    });
  }

  // Initialize local notifications
  Future<void> initLocalNotification() async {
    var androidInitSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialization = const DarwinInitializationSettings();
    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitialization,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap here
        print('Notification tapped with payload: ${response.payload}');
      },
    );
  }

  // Initialize Firebase and set up message listeners
  void firebaseInit() async {
    await Firebase.initializeApp();
    await initLocalNotification();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(message.notification?.title);
        print(message.notification?.body);
      }
      showMessage(message);
    });
  }

  // Background message handler
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    final notificationService = NotificationServices();
    await notificationService.initLocalNotification();
    notificationService.showMessage(message);
  }

  // Show the notification
  void showMessage(RemoteMessage message) async {
    const channelId = 'your_default_channel_id'; // Use a constant channel ID
    var androidNotificationDetails = const AndroidNotificationDetails(
      channelId,
      'Your Channel Name',
      channelDescription: 'Your Channel Description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }
}