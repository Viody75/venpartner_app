import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/auth/register_page.dart';
import 'package:venpartner/widgets/venvice-button.dart';
import 'package:venpartner/widgets/venvice-secondary-button.dart';

import 'auth-num-page.dart';

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
          child: ListView(
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
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Mitra Venvice! udah siap membantu?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Yuk, masuk untuk mulai terima orderan!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // auth button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: Column(
                  children: [
                    VenvicePrimaryBtn('Masuk', onTap: () {
                      Get.to(() => AuthNumberPage());
                    }),
                    SizedBox(height: 16),
                    VenviceSecondaryBtn('Daftar Jadi Mitra', onTap: () {
                      Get.to(() => RegisterPage());
                    }),
                    SizedBox(height: 16),
                    Text(
                      'Klik Daftar Jadai Mitra untuk mulai daftar, lanjutkan atau cek status pendaftaran',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
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
