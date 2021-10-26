import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProfile extends StatelessWidget {
  ItemProfile(
      {required this.iconData, required this.itemName, required this.onTap});
  IconData iconData;
  String itemName;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.deepPurple.shade600,
            ),
            SizedBox(width: 8),
            Text(itemName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
