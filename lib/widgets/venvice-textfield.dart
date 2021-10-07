import 'package:flutter/material.dart';

class VenviceTextField extends StatefulWidget {
  const VenviceTextField(this.deviceWidth, this.hint, this.focusNode);
  final double deviceWidth;
  final String hint;
  final FocusNode focusNode;
  @override
  _VenviceTextFieldState createState() => _VenviceTextFieldState();
}

class _VenviceTextFieldState extends State<VenviceTextField> {
  bool isActive = false;
  late FocusNode myFocusNode;

  void activedField(bool active) {
    if (active) {
      isActive = false;
    } else {
      isActive = true;
    }
  }

  BoxDecoration boxInActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff696F79)),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  BoxDecoration boxActive() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1, color: Color(0xff6A65D8)),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.deviceWidth,
      height: 60,
      margin: EdgeInsets.only(top: 8),
      decoration: isActive ? boxActive() : boxInActive(),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 20, top: 20, right: 15),
            hintText: '${widget.hint}'),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        onTap: () {
          setState(() {
            activedField(isActive);
          });
          print('tapped email');
        },
        onEditingComplete: () {
          setState(() {
            activedField(isActive);
          });
        },
        focusNode: widget.focusNode,
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}
