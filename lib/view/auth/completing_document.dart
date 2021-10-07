import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/auth/upload_docs_widget.dart';
import 'package:venpartner/view/auth/upload_ktp/upload_ktp_page.dart';
import 'package:venpartner/view/auth/upload_photo/upload_photo_page.dart';
import 'package:venpartner/view/auth/upload_rek/upload_rek_page.dart';
import 'package:venpartner/view/auth/upload_sim/upload_sim_page.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class CompletingDocsPage extends StatelessWidget {
  CompletingDocsPage({Key? key}) : super(key: key);

  bool formIsDone = false;

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
                      'Lengkapi Profil Anda',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Container(
                width: deviceWidth,
                height: deviceHeight - 60,
                child: ListView(
                  children: [
                    // info akun profile
                    Container(
                      width: deviceWidth,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Ujang Kasep',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'ujangkasep@gmail.com',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '+62 81234567890',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),

                    // info texts
                    Container(
                      width: deviceWidth,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Unggah Dokumen',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: 280,
                            child: Text(
                              'Mohon unggah foto dari dokumen-dokumen berikut dan isi informasi yang dibutuhkan',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                    ),

                    UploadDocsWidget(
                      name: 'Foto Profil',
                      status: 'Unggah Dokumen',
                      onTap: () {
                        print('foto profil');
                        Get.to(() => UploadPhotoPage());
                      },
                    ),

                    UploadDocsWidget(
                      name: 'KTP',
                      status: 'Unggah Dokumen',
                      onTap: () {
                        print('ktp');
                        Get.to(() => UploadKtpPage());
                      },
                    ),

                    UploadDocsWidget(
                      name: 'SIM',
                      status: 'Unggah Dokumen',
                      onTap: () {
                        print('sim');
                        Get.to(() => UploadSimPage());
                      },
                    ),

                    UploadDocsWidget(
                      name: 'Rekening Bank',
                      status: 'Unggah Dokumen',
                      onTap: () {
                        print('rekening');
                        Get.to(() => UploadRekPage());
                      },
                    ),

                    // button
                    Container(
                        margin: EdgeInsets.all(18),
                        child: formIsDone
                            ? VenvicePrimaryBtn(
                                'Selanjutnya',
                                onTap: () {},
                              )
                            : VenviceBtnDisabled('Selanjutnya')),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
