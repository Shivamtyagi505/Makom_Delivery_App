import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: primaryColor,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  Routes();
}
