import 'package:flutter/material.dart';

class VenvicePrimaryBtn extends StatelessWidget {
  const VenvicePrimaryBtn(this.name, {required this.onTap});
  final String name;
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
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomStart,
              end: AlignmentDirectional.topEnd,
              colors: [
                Color(0xff1D2786),
                Color(0xff6A65D8),
              ],
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
              splashColor: Colors.white30,
              onTap: onTap,
              child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 16,
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
