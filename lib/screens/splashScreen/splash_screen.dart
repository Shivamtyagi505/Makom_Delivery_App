import 'package:flutter/material.dart';
import 'package:makom_delivery_app/screens/homepage/assign_page.dart';
import 'package:makom_delivery_app/screens/homepage/homepage.dart';
import 'package:makom_delivery_app/services/auth/sign_up/shared_pref.dart';
import 'package:makom_delivery_app/widgets/widgets.dart';
import 'package:makom_delivery_app/widgets/headings.dart';
import 'package:makom_delivery_app/screens/auth/login_screen.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void screenTransition() async {
    bool status = await isloggedin();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => status ? HomePage() : LoginScreen())));
  }

  @override
  void initState() {
    super.initState();
    screenTransition();
  }

  Future<bool> isloggedin() async {
    print(await Shared_pref().get_bool("auth"));
    return Shared_pref().get_bool("auth");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            heading(text: "MAKOM", size: 55, color: Colors.white),
            Image.asset("assets/images/splashscreen_logo.png"),
            Column(
              children: [
                heading(
                    text: "happiness delivered", size: 25, color: Colors.white),
                heading(text: "door-to-door", size: 25, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
