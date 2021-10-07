import 'package:flutter/material.dart';

class ColouredBtn extends StatelessWidget {
  const ColouredBtn(this.name, this.color,
      {required this.onTap,
      required this.radius,
      required this.dWidth,
      required this.dHeight});
  final String name;
  final double radius;
  final double dWidth;
  final double dHeight;
  final GestureTapCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        // <----------------------------- Outer Material
        shadowColor: Colors.blueGrey[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
          ),
          child: Material(
            // <------------------------- Inner Material
            type: MaterialType.transparency,
            elevation: 6.0,
            color: Colors.transparent,
            shadowColor: Colors.grey[50],
            child: InkWell(
              //<------------------------- InkWell
              splashColor: Colors.deepPurple[300],
              onTap: onTap,
              child: Container(
                height: dHeight,
                width: dWidth,
                child: Center(
                  child: Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
