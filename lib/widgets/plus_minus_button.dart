import 'package:flutter/material.dart';

class PlusMinusButton extends StatelessWidget {
  PlusMinusButton(
      {required this.value, required this.onTapMin, required this.onTapPlus});
  int value;
  GestureTapCallback onTapMin;
  GestureTapCallback onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: Row(
        children: [
          IconButton(
              onPressed: onTapMin,
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                color: Colors.deepPurple.shade600,
              )),
          Text('$value'),
          IconButton(
              onPressed: onTapPlus,
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.deepPurple.shade600,
              )),
        ],
      ),
    );
  }
}
