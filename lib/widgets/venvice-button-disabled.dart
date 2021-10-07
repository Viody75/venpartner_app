import 'package:flutter/material.dart';

class VenviceBtnDisabled extends StatelessWidget {
  const VenviceBtnDisabled(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[400],
      ),
      child: Center(
          child: Text(
        '$name',
        style: TextStyle(
            fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),
      )),
    );
  }
}
