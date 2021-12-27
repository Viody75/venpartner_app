import 'package:flutter/material.dart';
import 'package:venpartner/utils/my_style.dart';

class VenviceSecondaryBtn extends StatelessWidget {
  const VenviceSecondaryBtn(this.name, {required this.onTap});
  final GestureTapCallback onTap;
  final String name;
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
            border: Border.all(width: 1, color: MyStyle.primaryColor()),
            color: Colors.white,
          ),
          child: Material(
            // <------------------------- Inner Material
            type: MaterialType.transparency,
            elevation: 6.0,
            color: Colors.transparent,
            shadowColor: Colors.grey[50],
            child: InkWell(
              //<------------------------- InkWell
              splashColor: Colors.deepPurple[100],
              onTap: onTap,
              child: Container(
                height: 40,
                child: Center(
                  child: Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyStyle.primaryColor(),
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
