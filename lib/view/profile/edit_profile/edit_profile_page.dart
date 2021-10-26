import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/utils/my_style.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final numberFocus = FocusNode();
  bool formIsDone = false;
  bool isEmailActive = false;
  bool isNameActive = false;
  bool isNumberActive = false;

  bool isChecked = false;

  @override
  void initState() {
    nameFocus.addListener(() {
      setState(() {
        isNameActive = nameFocus.hasFocus;
      });
      debugPrint('name : ' + isNameActive.toString());
    });
    emailFocus.addListener(() {
      setState(() {
        isEmailActive = emailFocus.hasFocus;
      });
      debugPrint('Email : ' + isEmailActive.toString());
    });
    numberFocus.addListener(() {
      setState(() {
        isNumberActive = numberFocus.hasFocus;
      });
      debugPrint('number : ' + isNumberActive.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: deviceWidth,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                Text(
                  'Edit Profil',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),

          // foto profil
          Container(
            width: deviceWidth,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                Text(
                  'Foto Profil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                          fit: BoxFit.fill,
                          width: 66,
                          height: 66,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                        width: deviceWidth - 130,
                        child: Text(
                            'Pasang foto yang bagus! \nSemua orang bisa lihat.'))
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: deviceWidth,
            height: deviceHeight - 160,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Lengkap',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: deviceWidth,
                    height: 42,
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.only(left: 8),
                    decoration: isNameActive
                        ? MyStyle.textBoxActive()
                        : MyStyle.textBoxInActive(),
                    child: TextFormField(
                      focusNode: nameFocus,
                      decoration:
                          MyStyle.myInputDecor('Masukan Nama Lengkap Anda'),
                      textInputAction: TextInputAction.next,
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: deviceWidth,
                    height: 42,
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.only(left: 8),
                    decoration: isEmailActive
                        ? MyStyle.textBoxActive()
                        : MyStyle.textBoxInActive(),
                    child: TextFormField(
                      focusNode: emailFocus,
                      decoration: MyStyle.myInputDecor('Masukan Email'),
                      textInputAction: TextInputAction.next,
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Nomor Ponsel',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: deviceWidth,
                    height: 42,
                    margin: EdgeInsets.only(top: 8),
                    decoration: isNumberActive
                        ? MyStyle.textBoxActive()
                        : MyStyle.textBoxInActive(),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 60,
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
                          height: 60,
                          child: TextFormField(
                            focusNode: numberFocus,
                            decoration:
                                MyStyle.myInputDecor('Masukan nomor ponsel'),
                            textInputAction: TextInputAction.done,
                            validator: (String? value) {
                              return (value != null && value.contains('+62'))
                                  ? 'Tidak Menggunakan +62'
                                  : null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
