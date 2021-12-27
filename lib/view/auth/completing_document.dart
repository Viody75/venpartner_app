import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/controller/completing_docs_controller.dart';
import 'package:venpartner/view/auth/upload_docs_true_widget.dart';
import 'package:venpartner/view/auth/upload_docs_widget.dart';
import 'package:venpartner/view/auth/upload_ktp/upload_ktp_page.dart';
import 'package:venpartner/view/auth/upload_photo/upload_photo_page.dart';
import 'package:venpartner/view/auth/upload_rek/upload_rek_page.dart';
import 'package:venpartner/view/auth/upload_sim/upload_sim_page.dart';
import 'package:venpartner/view/beranda_page.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class CompletingDocsPage extends StatelessWidget {
  CompletingDocsPage({Key? key}) : super(key: key);

  bool formIsDone = false;

  final CompletingDocsController _completingDocsController =
      Get.put(CompletingDocsController());

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

                    GetBuilder<CompletingDocsController>(builder: (context) {
                      return Column(
                        children: [
                          File(_completingDocsController.profileImage.path)
                                      .toString() ==
                                  File('').toString()
                              ? UploadDocsWidget(
                                  name: 'Foto Profil',
                                  status: 'Unggah Dokumen',
                                  onTap: () {
                                    print('foto profil');
                                    Get.to(() => UploadPhotoPage());
                                  },
                                )
                              : UploadDocsTrueWidget(
                                  name: 'Foto Profil',
                                  status: 'Unggah Dokumen',
                                  optionalImagePath: File(
                                      _completingDocsController
                                          .profileImage.path),
                                  onTap: () {
                                    print('foto profil');
                                    Get.to(() => UploadPhotoPage());
                                  },
                                ),
                          File(_completingDocsController.ktpImage.path)
                                      .toString() ==
                                  File('').toString()
                              ? UploadDocsWidget(
                                  name: 'KTP',
                                  status: 'Unggah Dokumen',
                                  onTap: () {
                                    print('ktp');
                                    Get.to(() => UploadKtpPage());
                                  },
                                )
                              : UploadDocsTrueWidget(
                                  name: 'KTP',
                                  status: 'Unggah Dokumen',
                                  optionalImagePath: File(
                                      _completingDocsController.ktpImage.path),
                                  onTap: () {
                                    print('foto KTP');
                                    Get.to(() => UploadKtpPage());
                                  },
                                ),
                          File(_completingDocsController.simImage.path)
                                      .toString() ==
                                  File('').toString()
                              ? UploadDocsWidget(
                                  name: 'SIM',
                                  status: 'Unggah Dokumen',
                                  onTap: () {
                                    print('foto sim');
                                    Get.to(() => UploadSimPage());
                                  },
                                )
                              : UploadDocsTrueWidget(
                                  name: 'SIM',
                                  status: 'Unggah Dokumen',
                                  optionalImagePath: File(
                                      _completingDocsController.simImage.path),
                                  onTap: () {
                                    print('foto sim');
                                    Get.to(() => UploadSimPage());
                                  },
                                ),
                        ],
                      );
                    }),

                    UploadDocsWidget(
                      name: 'Rekening Bank',
                      status: 'Unggah Dokumen',
                      onTap: () {
                        print('rekening');
                        Get.to(() => BerandaPartnerPage());
                        // Get.to(() => UploadRekPage());
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
