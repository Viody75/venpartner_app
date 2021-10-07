import 'package:flutter/material.dart';

class IndicatorOff extends StatelessWidget {
  const IndicatorOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFD6D6FA),
      ),
    );
  }
}
