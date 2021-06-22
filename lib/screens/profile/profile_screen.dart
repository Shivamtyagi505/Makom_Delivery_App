import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/services/auth/sign_up/shared_pref.dart';
import 'package:makom_delivery_app/widgets/headings.dart';
import 'package:toast/toast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var driverData;
  String _authToken = "";

  Future<dynamic> getDriverDetails() async {
    _authToken = await Shared_pref().get_string("auth_token");
    setState(() {
      print(_authToken);
    });

    var headers = {'Authorization': 'Bearer ${_authToken}'};
    var request = http.Request(
        'GET', Uri.parse('http://3.22.81.177:8080/v1/api/driver/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      setState(() {
        driverData = data["user"];
      });
      print(data["name"]);
    } else {
      Toast.show("Error while fetching details", context);
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();
    getDriverDetails();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    return Scaffold(
      body: driverData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.3),
                        heading(
                            text: "Driver Details",
                            color: primaryColor,
                            size: 50,
                            weight: FontWeight.w700),
                        SizedBox(height: height * 0.1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                heading(text: "Name: ", color: primaryColor),
                                heading(
                                    text: driverData["name"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                heading(text: "Email: ", color: primaryColor),
                                heading(
                                    text: driverData["email"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                heading(text: "Phone: ", color: primaryColor),
                                heading(
                                    text: driverData["phone"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                heading(text: "Address: ", color: primaryColor),
                                heading(
                                    text: driverData["address"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                heading(text: "City: ", color: primaryColor),
                                heading(
                                    text: driverData["city"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                heading(text: "State: ", color: primaryColor),
                                heading(
                                    text: driverData["state"],
                                    weight: FontWeight.w800),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
