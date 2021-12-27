import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/utils/my_style.dart';
import 'package:venpartner/view/auth/register_page.dart';
import 'package:venpartner/view/auth/verify-acc-page.dart';
import 'package:venpartner/widgets/venvice-button.dart';
import 'package:venpartner/widgets/venvice-secondary-button.dart';

import 'auth-num-page.dart';
import 'completing_profile.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Column(
            children: [
              // logo venpartner
              Container(
                padding: EdgeInsets.symmetric(horizontal: 96, vertical: 32),
                child: Image.asset(
                  'assets/images/vv_logo_venvice.png',
                  fit: BoxFit.fill,
                ),
              ),

              // ilustrasi
              Container(
                padding: EdgeInsets.symmetric(horizontal: 96, vertical: 16),
                child: Image.asset(
                  'assets/images/welcome-venpartner.png',
                  fit: BoxFit.fill,
                ),
              ),

              // title
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Text(
                  'Halo, Mitra Venvice! sudah siap menerima orderan?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyStyle.primaryColor(),
                  ),
                ),
              ),

              Spacer(),

              // auth button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Column(
                  children: [
                    VenvicePrimaryBtn('Masuk', onTap: () {
                      Get.to(() => AuthNumberPage());
                    }),
                    SizedBox(height: 16),
                    VenviceSecondaryBtn('Belum punya akun? Daftar', onTap: () {
                      Get.to(() => CompletingProfilePage());
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
