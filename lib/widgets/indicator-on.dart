import 'package:flutter/material.dart';

class IndicatorOn extends StatelessWidget {
  const IndicatorOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF6A65D8),
      ),
    );
  }
}
