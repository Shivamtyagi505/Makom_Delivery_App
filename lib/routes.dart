import 'package:flutter/material.dart';
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/screens/auth/otp_screen.dart';
import 'package:makom_delivery_app/screens/homepage/homepage.dart';
import 'package:makom_delivery_app/screens/splashScreen/splash_screen.dart';
import 'package:makom_delivery_app/screens/pick_and_drop.dart/pick_drop.dart';
import 'package:makom_delivery_app/services/googlemaps/googlemaps.dart';
import 'package:makom_delivery_app/services/provider/authprovider.dart';
import 'package:makom_delivery_app/services/provider/locationprovider.dart';
import 'package:provider/provider.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => SplashScreen(),
    '/pick_drop': (BuildContext context) => PickUpAndDropOff(),
    '/googlemaps': (BuildContext context) => Googlemaps(),
    '/homepage': (BuildContext context) => HomePage(),
    '/signup_otp' : (BuildContext context) => OtpScreen(),
  };

  Routes() {
    runApp(MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
         ChangeNotifierProvider(
        create: (_) => LocationProvider(),
      ),],
        child:new MaterialApp(
      theme: themeData,
      title: 'Makom',
      routes: routes,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    )));
  }
}
