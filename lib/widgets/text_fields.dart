import 'package:flutter/material.dart';

import '../constants.dart';

Widget txtfieldContainer({@required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0.0, 2.5))
          ]),
      child: Padding(padding: const EdgeInsets.all(10.0), child: child),
    ),
  );
}

Widget txtField(
    {@required hintTxt,
    Function validator,
    int maxLine,
    bool obscure = false,
    TextEditingController controller}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    style: TextStyle(fontSize: 20),
    minLines: 1,
    maxLines: maxLine,
    obscureText: obscure,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintTxt,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700, color: Colors.grey, fontSize: 20)),
  );
}
