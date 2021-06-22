import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/screens/auth/signup_screen.dart';
import 'package:makom_delivery_app/screens/homepage/homepage.dart';
import 'package:makom_delivery_app/services/auth/sign_up/shared_pref.dart';
import 'package:makom_delivery_app/services/provider/authprovider.dart';
import 'package:makom_delivery_app/utils/index.dart';
import 'package:makom_delivery_app/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<dynamic> login() async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request(
        'POST', Uri.parse('http://3.22.81.177:8080/v1/api/driver/signin'));
    request.body = json.encode({"email": email.text, "password": pass.text});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());

      Shared_pref().set_bool("auth", true);
      Shared_pref().set_string("auth_token", data["details"]);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      print(request.body.length);
    } else {
      Toast.show("Invalid Details", context, gravity: 1);
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            appColorHeading(text: "MAKOM"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  txtfieldContainer(
                      child: txtField(
                          controller: email,
                          hintTxt: "Email",
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)
                                ? null
                                : "Invalid email";
                          })),
                  txtfieldContainer(
                      child: txtField(
                          controller: pass,
                          hintTxt: "Password",
                          validator: (value) => validatePassword(value))),
                  CommonButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        login();
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heading(
                          text: "Forgot Password?",
                          color: primaryColor,
                          size: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: heading(
                            text: "Signup",
                            color: primaryColor,
                            size: 20,
                            textDecoration: TextDecoration.underline),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(),
            Column(
              children: [
                heading(text: "By signing up you agree to our", size: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Policies()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: 'Private Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03)
              ],
            )
          ],
        ),
      ),
    );
  }
}
