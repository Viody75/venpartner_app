import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/auth/upload_photo/camera_photo_page.dart';
import 'package:venpartner/view/auth/upload_photo/guide_photo_page.dart';
import 'package:venpartner/widgets/outlined_button.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  bool formIsDone = false;
  var firstCamera;

  Future<void> activateCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras[1];
  }

  @override
  void initState() {
    // TODO: implement initState
    activateCamera();
    super.initState();
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
                      'Unggah Foto Profil',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Container(
                width: deviceWidth,
                height: 300,
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
                              Get.to(() => GuidePhotoPage());
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),

                    //upload foto
                    Container(
                      width: deviceWidth,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/docs-placeholder.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(width: 24),
                          Text(
                            'Foto Profil',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          OutlinedBtn('Ambil Foto', onTap: () {
                            Get.to(() => TakePhotoPage(
                                  // Pass the appropriate camera to the TakePictureScreen widget.
                                  camera: firstCamera,
                                ));
                          }, radius: 18, dWidth: 100, dHeight: 26)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              // button
              // Container(
              //   height: 80,
              //   padding: EdgeInsets.symmetric(horizontal: 18),
              //   child: Column(
              //     children: [
              //       Container(
              //           margin: EdgeInsets.all(18),
              //           child: formIsDone
              //               ? VenvicePrimaryBtn(
              //                   'Simpan',
              //                   onTap: () {
              //                     // Get.to(() => CompletingDocsPage());
              //                   },
              //                 )
              //               : VenviceBtnDisabled('Simpan')),
              //       Spacer(),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
