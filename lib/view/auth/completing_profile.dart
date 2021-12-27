import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/utils/my_style.dart';
import 'package:venpartner/view/auth/completing_document.dart';
import 'package:venpartner/view/auth/verify-acc-page.dart';
import 'package:venpartner/widgets/venvice-button-disabled.dart';
import 'package:venpartner/widgets/venvice-button.dart';

class CompletingProfilePage extends StatefulWidget {
  const CompletingProfilePage({Key? key}) : super(key: key);

  @override
  _CompletingProfilePageState createState() => _CompletingProfilePageState();
}

class _CompletingProfilePageState extends State<CompletingProfilePage> {
  final nameFocus = FocusNode();
  final numberFocus = FocusNode();
  final numberEmergencyFocus = FocusNode();
  final emailFocus = FocusNode();
  final domisiliFocus = FocusNode();
  final addressFocus = FocusNode();

  bool formIsDone = false;

  bool isNameActive = false;
  bool isNumberActive = false;
  bool isNumberEmerActive = false;
  bool isEmailActive = false;
  bool isDomisiliActive = false;
  bool isAddressActive = false;

  @override
  void initState() {
    nameFocus.addListener(() {
      setState(() {
        isNameActive = nameFocus.hasFocus;
      });
      debugPrint('Name : ' + isNameActive.toString());
    });
    numberFocus.addListener(() {
      setState(() {
        isNumberActive = numberFocus.hasFocus;
      });
      debugPrint('Number : ' + isNumberActive.toString());
    });
    numberEmergencyFocus.addListener(() {
      setState(() {
        isNumberEmerActive = numberEmergencyFocus.hasFocus;
      });
      debugPrint('Number Emergency : ' + isNumberEmerActive.toString());
    });
    emailFocus.addListener(() {
      setState(() {
        isEmailActive = emailFocus.hasFocus;
      });
      debugPrint('email : ' + isEmailActive.toString());
    });
    domisiliFocus.addListener(() {
      setState(() {
        isDomisiliActive = domisiliFocus.hasFocus;
      });
      debugPrint('Number : ' + isDomisiliActive.toString());
    });
    addressFocus.addListener(() {
      setState(() {
        isAddressActive = addressFocus.hasFocus;
      });
      debugPrint('Number : ' + isAddressActive.toString());
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
                      'Daftar',
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
                    //info
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      color: Colors.green.shade100,
                      child: Row(
                        children: [
                          Icon(Icons.info),
                          SizedBox(width: 8),
                          Container(
                            width: 250,
                            child: Text(
                              'Harap isi dengan data diri calon Mitra Venvice, bukan orang lain.',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                formIsDone = true;
                              });
                            },
                            child: Icon(Icons.close),
                          )
                        ],
                      ),
                    ),

                    // fields
                    Container(
                      width: deviceWidth,
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),

                            // Nama Lengkap
                            Text(
                              'Nama Lengkap',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Masukan nama lengkap'),
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

                            // Alamat
                            Text(
                              'Alamat tempat tinggal',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Masukan nama alamat tempat tinggal'),
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

                            // Email
                            Text(
                              'Email',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration:
                                    MyStyle.myInputDecor('Masukan email'),
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

                            // Kata Sandi
                            Text(
                              'Kata sandi',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration:
                                    MyStyle.myInputDecor('Masukan kata sandi'),
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
                              'Minimal 8 karakter',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(height: 20),

                            // Ulang katasandi
                            Text(
                              'Ulang kata sandi',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Masukan ulang kata sandi'),
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

                            // no. ponsel
                            Text(
                              'Nomor Ponsel',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              decoration:
                                  isNumberActive ? boxActive() : boxInActive(),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 50,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 6),
                                          Image.asset(
                                            'assets/images/indoflag.png',
                                            width: 24,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            '+62',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          VerticalDivider(
                                            thickness: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 50,
                                    child: TextFormField(
                                      focusNode: numberFocus,
                                      decoration: MyStyle.myInputDecor(
                                          'Masukan nomor ponsel'),
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            // // no. ponsel darurat
                            // Text(
                            //   'Nomor Ponsel Darurat',
                            //   style: TextStyle(
                            //       fontSize: 16,
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w500),
                            // ),
                            // Container(
                            //   width: deviceWidth,
                            //   height: 50,
                            //   margin: EdgeInsets.only(top: 8),
                            //   decoration: isNumberEmerActive
                            //       ? boxActive()
                            //       : boxInActive(),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         width: 80,
                            //         height: 50,
                            //         child: Center(
                            //           child: Row(
                            //             children: [
                            //               SizedBox(width: 6),
                            //               Image.asset(
                            //                 'assets/images/indoflag.png',
                            //                 width: 24,
                            //               ),
                            //               SizedBox(width: 6),
                            //               Text(
                            //                 '+62',
                            //                 style: TextStyle(
                            //                   fontWeight: FontWeight.bold,
                            //                   fontSize: 16,
                            //                 ),
                            //               ),
                            //               VerticalDivider(
                            //                 thickness: 2,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 200,
                            //         height: 50,
                            //         child: TextFormField(
                            //           focusNode: numberEmergencyFocus,
                            //           decoration: MyStyle.myInputDecor(
                            //               'Masukan nomor ponsel'),
                            //           textInputAction: TextInputAction.next,
                            //           validator: (String? value) {
                            //             return (value != null &&
                            //                     value.contains('+62'))
                            //                 ? 'Tidak Menggunakan +62'
                            //                 : null;
                            //           },
                            //           onEditingComplete: () {
                            //             FocusScope.of(context).nextFocus();
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 4),
                            // Text(
                            //   'Untuk menghubungi anda jika nomor ponsel utama tidak aktif',
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.grey),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),

                            // // domisili
                            // Text(
                            //   'Domisili',
                            //   style: TextStyle(
                            //       fontSize: 16,
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w500),
                            // ),
                            // Container(
                            //   width: deviceWidth,
                            //   height: 50,
                            //   margin: EdgeInsets.only(top: 8),
                            //   padding: EdgeInsets.only(left: 8, right: 8),
                            //   decoration: isDomisiliActive
                            //       ? boxActive()
                            //       : boxInActive(),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         width: 240,
                            //         height: 50,
                            //         child: TextFormField(
                            //           focusNode: domisiliFocus,
                            //           decoration: MyStyle.myInputDecor(
                            //               'Masukan nomor ponsel'),
                            //           textInputAction: TextInputAction.next,
                            //           validator: (String? value) {
                            //             return (value != null &&
                            //                     value.contains('+62'))
                            //                 ? 'Tidak Menggunakan +62'
                            //                 : null;
                            //           },
                            //           onEditingComplete: () {
                            //             FocusScope.of(context).nextFocus();
                            //           },
                            //         ),
                            //       ),
                            //       Spacer(),
                            //       IconButton(
                            //           onPressed: () {
                            //             Get.defaultDialog(
                            //               title: "Pilih Domisili",
                            //               backgroundColor: Colors.white,
                            //               barrierDismissible: false,
                            //               radius: 10,
                            //               content: Container(
                            //                   height: 300,
                            //                   child: Column(
                            //                     children: [
                            //                       Container(
                            //                         height: 50,
                            //                         margin:
                            //                             EdgeInsets.symmetric(
                            //                                 horizontal: 12),
                            //                         // decoration: isSearchActive
                            //                         //     ? MyStyle.textBoxActive()
                            //                         //     : MyStyle.textBoxInActive(),
                            //                         decoration: MyStyle
                            //                             .textBoxInActive(),
                            //                         child: Row(
                            //                           crossAxisAlignment:
                            //                               CrossAxisAlignment
                            //                                   .center,
                            //                           children: [
                            //                             Container(
                            //                               width: 50,
                            //                               height: 50,
                            //                               child: Center(
                            //                                 child: Icon(
                            //                                     Icons.search),
                            //                               ),
                            //                             ),
                            //                             Expanded(
                            //                               child: TextFormField(
                            //                                 // focusNode: searchFocus,
                            //                                 decoration: MyStyle
                            //                                     .myInputDecor(
                            //                                         'Cari Domisili'),
                            //                                 textInputAction:
                            //                                     TextInputAction
                            //                                         .next,
                            //                                 onEditingComplete:
                            //                                     () {
                            //                                   FocusScope.of(
                            //                                           context)
                            //                                       .nextFocus();
                            //                                 },
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ),
                            //                       Spacer(),
                            //                       Container(
                            //                         height: 240,
                            //                         width: 300,
                            //                         margin:
                            //                             EdgeInsets.symmetric(
                            //                                 horizontal: 6),
                            //                         child: ListView.separated(
                            //                           itemCount: 20,
                            //                           itemBuilder:
                            //                               (context, index) {
                            //                             return InkWell(
                            //                               onTap: () {
                            //                                 Get.back();
                            //                               },
                            //                               child: Container(
                            //                                 child: Text(
                            //                                   'Balikpapan',
                            //                                   style: TextStyle(
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .bold),
                            //                                 ),
                            //                               ),
                            //                             );
                            //                           },
                            //                           separatorBuilder:
                            //                               (context, index) {
                            //                             return Divider();
                            //                           },
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   )),
                            //             );
                            //             setState(() {
                            //               formIsDone = true;
                            //             });
                            //           },
                            //           icon: Icon(
                            //               Icons.keyboard_arrow_down_rounded))
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),

                            // alamat
                            Text(
                              'Alamat lengkap',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: deviceWidth,
                              height: 100,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 8),
                              decoration:
                                  isAddressActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: addressFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Masukan alamat lengkap'),
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  return (value != null &&
                                          value.contains('+62'))
                                      ? 'Tidak Menggunakan +62'
                                      : null;
                                },
                                keyboardType: TextInputType.multiline,
                                minLines: 2,
                                maxLines: 5,
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                            ),
                            SizedBox(height: 20),

                            // Kode Referal
                            Text(
                              'Kode referral',
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
                              decoration:
                                  isNameActive ? boxActive() : boxInActive(),
                              child: TextFormField(
                                focusNode: nameFocus,
                                decoration: MyStyle.myInputDecor(
                                    'Masukan kode referral'),
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
                    ),

                    // button
                    Container(
                        margin: EdgeInsets.all(18),
                        child: formIsDone
                            ? VenvicePrimaryBtn(
                                'Selanjutnya',
                                onTap: () {
                                  Get.to(() => VerifyAccount());
                                },
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

  BoxDecoration boxInActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff696F79)),
      borderRadius: BorderRadius.circular(12),
    );
  }

  BoxDecoration boxActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff6A65D8)),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  InputDecoration myInputDecor(String hint) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 20, top: 20, right: 15),
        hintText: '$hint');
  }
}
