import 'package:flutter/material.dart';

class VenviceCardItem extends StatelessWidget {
  VenviceCardItem(
      {required this.iconData, required this.valueStr, required this.descStr});
  IconData iconData;
  String valueStr;
  String descStr;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(iconData),
              SizedBox(width: 6),
              Text(
                valueStr,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Text(
            descStr,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
