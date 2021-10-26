import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venpartner/view/profile/profile_item_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded)),
                Text(
                  'Mitra Venvice',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),

          // User data
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: NetworkImage(
                          'https://www.tutorialkart.com/img/hummingbird.png'),
                      fit: BoxFit.fill,
                      width: 44,
                      height: 44,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text('Ujang Kasep',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 4),
                      Text('+628123456789',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text('ujangkasep75@gmail.com',
                          style: TextStyle(color: Colors.grey)),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Get.to(() => EditProfilePage());
                    },
                  ),
                ),
              ],
            ),
          ),

          // Akun
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Text('Akun',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),

          // List Options
          Container(
            width: deviceWidth,
            height: deviceHeight - 60,
            child: ListView(
              children: [
                ItemProfile(
                    iconData: Icons.confirmation_num,
                    itemName: 'Kupon Saya',
                    onTap: () {
                      print('item kupon tapped');
                    }),
                ItemProfile(
                    iconData: Icons.bookmark,
                    itemName: 'Alamat Disimpan',
                    onTap: () {
                      print('item alamat tapped');
                    }),
                ItemProfile(
                    iconData: Icons.help,
                    itemName: 'Bantuan',
                    onTap: () {
                      print('item bantuan tapped');
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
