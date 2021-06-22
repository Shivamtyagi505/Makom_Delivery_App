import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/screens/auth/registeredSuccessfully_dialog.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:makom_delivery_app/widgets/index.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    var width = mq.width;
    return Scaffold(
      appBar: AppBar(
        leading: backArrowBtn(context: context),
        elevation: 0,
        backgroundColor: Colors.white,
        title: heading(text: "Signup", color: primaryColor, size: 40),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.175,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading(text: "Verify your OTP", size: 30),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: TextStyle(color: Colors.black),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Enter the OTP sent to',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, fontSize: 15)),
                              TextSpan(
                                  text: ' +91-XXX-XXXXX-XXX',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: primaryColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: width * 0.2,
                          style: TextStyle(fontSize: 47, fontWeight: FontWeight.bold),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            heading(text: "Didn't receive it? ", size: 20),
                            heading(
                                text: "Click here",
                                size: 20,
                                textDecoration: TextDecoration.underline,
                                color: primaryColor),
                          ],
                        ),
                        SizedBox(height: height * 0.05),
                        GestureDetector(
                            onTap: () {
                              registeredSuccessfullyDialog(context);
                            },
                            child: button1(btnTxt: "Verify & Proceed")),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              color: Colors.white,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  height: 6,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
