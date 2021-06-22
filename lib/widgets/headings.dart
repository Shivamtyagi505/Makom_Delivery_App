import 'package:flutter/material.dart';
import 'package:makom_delivery_app/widgets/widgets.dart';

Text appColorHeading({@required String text}) {
  return Text(text,
      textScaleFactor: 3,
      style: TextStyle(color: appColor, fontWeight: FontWeight.w700));
}

Text heading({
  @required String text,
  double size = 25,
  FontWeight weight = FontWeight.w400,
  Color color = Colors.black,
  TextAlign textAlign = TextAlign.left,
  TextDecoration textDecoration = TextDecoration.none,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: textDecoration),
  );
}
