import 'package:flutter/material.dart';
import 'package:makom_delivery_app/widgets/headings.dart';
import 'package:makom_delivery_app/widgets/widgets.dart';

void registeredSuccessfullyDialog(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    heading(text: "Hey! Shahrukh"),
                    heading(
                        text: "You are Successfully Registered",
                        textAlign: TextAlign.center),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: heading(text: "Continue", color: appColor)),
              ],
            ),
          ),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
