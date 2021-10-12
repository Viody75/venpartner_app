import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/splashscreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  
  runApp(MyApp());
}



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  // aktifkan fcm
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  late String fcmToken;
  Future<void> activedFCM() async {
    Firebase.initializeApp();
    firebaseMessaging.getToken().then((value) {
      print(value);
      fcmToken = value!;
      print('script : firebaseMessaging.getToken() -> run!');
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      print('script : FirebaseMessaging.onMessage.listen');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
        Get.snackbar(
            "${message.notification!.title}", "${message.notification!.body}",
            backgroundColor: Colors.white,
            borderColor: Colors.deepPurple,
            borderWidth: 0.7);

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    activedFCM();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}
