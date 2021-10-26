import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class UploadDocsTrueWidget extends StatelessWidget {
  UploadDocsTrueWidget(
      {required this.name,
      required this.status,
      required this.optionalImagePath,
      required this.onTap});

  String name;
  String status;
  File optionalImagePath;
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              optionalImagePath,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
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
