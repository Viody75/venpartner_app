import 'package:flutter/material.dart';

class OutlinedBtn extends StatelessWidget {
  const OutlinedBtn(this.name,
      {required this.onTap,
      required this.radius,
      required this.dWidth,
      required this.dHeight});
  final String name;
  final double radius;
  final double dWidth;
  final double dHeight;
  final GestureTapCallback onTap;

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
            border: Border.all(width: 1, color: Colors.deepPurple),
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomStart,
              end: AlignmentDirectional.topEnd,
              colors: [Colors.white, Colors.white],
            ),
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
                        fontSize: 16,
                        color: Colors.deepPurple,
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
