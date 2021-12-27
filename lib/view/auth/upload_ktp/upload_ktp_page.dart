import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/controller/completing_docs_controller.dart';
import 'package:venpartner/utils/my_style.dart';
import 'package:venpartner/view/auth/upload_ktp/camera_ktp_page.dart';
import 'package:venpartner/view/auth/upload_ktp/guide_ktp_page.dart';
import 'package:venpartner/widgets/outlined_button.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

import '../upload_docs_true_widget.dart';
import '../upload_docs_widget.dart';

class UploadKtpPage extends StatefulWidget {
  const UploadKtpPage({Key? key}) : super(key: key);

  @override
  _UploadKtpPageState createState() => _UploadKtpPageState();
}

class _UploadKtpPageState extends State<UploadKtpPage> {
  final _completingDocsController = Get.find<CompletingDocsController>();

  // date
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  bool formIsDone = false;
  final noKtpFocus = FocusNode();
  final bDateFocus = FocusNode();
  final bPlaceFocus = FocusNode();
  final expDateFocus = FocusNode();

  bool isNoKtpActive = false;
  bool isbDateActive = false;
  bool isbPlaceActive = false;
  bool isExpDateActive = false;

  var firstCamera;

  Future<void> activateCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }

  @override
  void initState() {
    noKtpFocus.addListener(() {
      setState(() {
        isNoKtpActive = noKtpFocus.hasFocus;
      });
      debugPrint('KTP : ' + isNoKtpActive.toString());
    });
    bDateFocus.addListener(() {
      setState(() {
        isbDateActive = bDateFocus.hasFocus;
      });
      debugPrint('Name : ' + isbDateActive.toString());
    });
    bPlaceFocus.addListener(() {
      setState(() {
        isbPlaceActive = bPlaceFocus.hasFocus;
      });
      debugPrint('Name : ' + isbPlaceActive.toString());
    });
    expDateFocus.addListener(() {
      setState(() {
        isExpDateActive = expDateFocus.hasFocus;
      });
      debugPrint('Name : ' + isExpDateActive.toString());
    });
    super.initState();
    activateCamera();
  }

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
                      'Unggah KTP',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: deviceWidth,
                  child: ListView(
                    children: [
                      //info
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        color: Colors.orange.shade100,
                        child: Row(
                          children: [
                            Icon(Icons.help),
                            SizedBox(width: 8),
                            Container(
                              width: 250,
                              child: Text(
                                'Ikuti panduan foto untuk mempermudah verifikasi dokumen',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(() => GuideKtpPage());
                              },
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12),

                      //upload ktp
                      GetBuilder<CompletingDocsController>(builder: (context) {
                        return File(_completingDocsController.ktpImage.path)
                                    .toString() ==
                                File('').toString()
                            ? UploadDocsWidget(
                                name: 'KTP',
                                status: 'Unggah Dokumen',
                                onTap: () {
                                  print('ktp');
                                  Get.to(() => TakeKTPPage(
                                        camera: firstCamera,
                                      ));
                                },
                              )
                            : UploadDocsTrueWidget(
                                name: 'KTP',
                                status: 'Unggah Dokumen',
                                optionalImagePath: File(
                                    _completingDocsController.ktpImage.path),
                                onTap: () {
                                  print('foto KTP');
                                  Get.to(() => TakeKTPPage(
                                        camera: firstCamera,
                                      ));
                                },
                              );
                      }),
                      SizedBox(height: 12),

                      // Nama Lengkap
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor KTP',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 8),
                              decoration: isNoKtpActive
                                  ? MyStyle.textBoxActive()
                                  : MyStyle.textBoxInActive(),
                              child: TextFormField(
                                focusNode: noKtpFocus,
                                decoration: MyStyle.myInputDecor(
                                    'cth : 12345678900000'),
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  return (value != null &&
                                          value.contains('+62'))
                                      ? 'Tidak Menggunakan +62'
                                      : null;
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // tanggal lahir
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal lahir',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 8),
                              decoration: isbDateActive
                                  ? MyStyle.textBoxActive()
                                  : MyStyle.textBoxInActive(),
                              child: TextFormField(
                                focusNode: bDateFocus,
                                decoration: MyStyle.myInputDecor('25/10/2000'),
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  return (value != null &&
                                          value.contains('+62'))
                                      ? 'Tidak Menggunakan +62'
                                      : null;
                                },
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                  );
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),

                      // tempat lahir
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tempat lahir',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 8),
                              decoration: isbPlaceActive
                                  ? MyStyle.textBoxActive()
                                  : MyStyle.textBoxInActive(),
                              child: TextFormField(
                                focusNode: bPlaceFocus,
                                decoration:
                                    MyStyle.myInputDecor('cth : Balikpapan'),
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  return (value != null &&
                                          value.contains('+62'))
                                      ? 'Tidak Menggunakan +62'
                                      : null;
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Isi dengan yang tertera di KTP',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal masa berlaku',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 8),
                              decoration: isExpDateActive
                                  ? MyStyle.textBoxActive()
                                  : MyStyle.textBoxInActive(),
                              child: TextFormField(
                                focusNode: expDateFocus,
                                decoration: MyStyle.myInputDecor('25/10/2000'),
                                onTap: () => _selectDate(context),
                                readOnly: true,
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Isi dengan yang tertera di KTP',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // button
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(18),
                        child: formIsDone
                            ? VenvicePrimaryBtn(
                                'Simpan',
                                onTap: () {
                                  // Get.to(() => CompletingDocsPage());
                                },
                              )
                            : VenviceBtnDisabled('Simpan')),
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
