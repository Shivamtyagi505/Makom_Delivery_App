import 'package:flutter/material.dart';

import '../constants.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CommonButton({Key key, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onPressed: onPressed,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
