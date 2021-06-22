import 'package:flutter/material.dart';
import 'package:makom_delivery_app/widgets/index.dart';

import '../../constants.dart';

class ProhibitedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backArrowBtn(context: context),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Prohibited Items",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(_prohibitedItems,
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(letterSpacing: 1, color: labelColor)),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                textScaleFactor: 1.5,
                text: TextSpan(
                    text: "Find more on ",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.bold, color: labelColor),
                    children: [
                      TextSpan(
                          text: "Packaging Guidelines",
                          style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline))
                    ])),
          ),
          SizedBox(
            height: 40,
          ),
          CommonButton(
            text: "Confirm",
            onPressed: () => Navigator.popAndPushNamed(context, "/send_page"),
          ),
        ],
      ),
    );
  }

  final String _prohibitedItems =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.";
}
