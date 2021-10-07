import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/auth/welcome_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 3), () {
      Get.to(() => WelcomePage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ini SplashScreen Yaah'),
      ),
    );
  }
}
