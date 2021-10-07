import 'package:flutter/material.dart';

class UploadDocsWidget extends StatelessWidget {
  UploadDocsWidget(
      {required this.name, required this.status, required this.onTap});

  String name;
  String status;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                status,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: onTap, icon: Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
