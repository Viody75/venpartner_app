import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/utils/my_style.dart';
import 'package:venpartner/view/auth/upload_ktp/guide_ktp_page.dart';
import 'package:venpartner/widgets/outlined_button.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class UploadRekPage extends StatefulWidget {
  const UploadRekPage({Key? key}) : super(key: key);

  @override
  _UploadRekPageState createState() => _UploadRekPageState();
}

class _UploadRekPageState extends State<UploadRekPage> {
  bool formIsDone = false;

  final bankNameFocus = FocusNode();
  final bankRekNumbFocus = FocusNode();
  final bankRekNameFocus = FocusNode();

  bool isBankNameActive = false;
  bool isBankRekNumbActive = false;
  bool isBankRekNameActive = false;

  @override
  void initState() {
    bankNameFocus.addListener(() {
      setState(() {
        isBankNameActive = bankNameFocus.hasFocus;
      });
      debugPrint('KTP : ' + isBankNameActive.toString());
    });
    bankRekNumbFocus.addListener(() {
      setState(() {
        isBankRekNumbActive = bankRekNumbFocus.hasFocus;
      });
      debugPrint('Name : ' + isBankRekNumbActive.toString());
    });
    bankRekNameFocus.addListener(() {
      setState(() {
        isBankRekNameActive = bankRekNameFocus.hasFocus;
      });
      debugPrint('Name : ' + isBankRekNameActive.toString());
    });
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
                      'Rekening Bank',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Container(
                width: deviceWidth,
                height: deviceHeight - 184,
                child: ListView(
                  children: [
                    // Nama Lengkap
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Bank',
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
                            decoration: isBankNameActive
                                ? MyStyle.textBoxActive()
                                : MyStyle.textBoxInActive(),
                            child: TextFormField(
                              focusNode: bankNameFocus,
                              decoration: MyStyle.myInputDecor('cth : BCA'),
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                return (value != null && value.contains('+62'))
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
                            'Nama Rekening Bank',
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
                            decoration: isBankRekNumbActive
                                ? MyStyle.textBoxActive()
                                : MyStyle.textBoxInActive(),
                            child: TextFormField(
                              focusNode: bankRekNumbFocus,
                              decoration:
                                  MyStyle.myInputDecor('cth : Agung Heri'),
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                return (value != null && value.contains('+62'))
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
                            'Gunakan Rekening milik pribadi',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
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
                            'Nomor Rekening Bank',
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
                            decoration: isBankRekNameActive
                                ? MyStyle.textBoxActive()
                                : MyStyle.textBoxInActive(),
                            child: TextFormField(
                              focusNode: bankRekNameFocus,
                              decoration:
                                  MyStyle.myInputDecor('cth : 1234567890'),
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                return (value != null && value.contains('+62'))
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
                  ],
                ),
              ),

              // button
              Container(
                height: 100,
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
