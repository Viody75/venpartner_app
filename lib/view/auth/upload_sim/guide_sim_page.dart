import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class GuideSimPage extends StatelessWidget {
  const GuideSimPage({Key? key}) : super(key: key);

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
              // top-nav
              Container(
                width: deviceWidth,
                height: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    Text(
                      'Panduan Unggah SIM',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // content
              Container(
                width: deviceWidth,
                height: deviceHeight - 224,
                child: ListView(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      child: Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/sim-benar.png',
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 4),
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/sim-salah.png',
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 4),
                              Icon(
                                Icons.cancel,
                                color: Colors.red,
                              )
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              //button
              Container(
                height: 140,
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified_user),
                        SizedBox(width: 8),
                        Container(
                          width: 300,
                          child: Text(
                            'Data anda dilindungi dan dirahasiakan dalam sistem kami.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        child: VenvicePrimaryBtn(
                      'Oke, sip',
                      onTap: () {
                        // Get.to(() => CompletingDocsPage());
                      },
                    )),
                    Spacer(),
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
