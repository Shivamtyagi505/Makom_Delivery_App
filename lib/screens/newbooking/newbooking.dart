import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:makom_delivery_app/screens/newbooking/bookingdescription.dart';
import '../../constants.dart';
import '../../widgets/common_button.dart';
import '../../widgets/text_fields.dart';

class NewBooking extends StatefulWidget {
  @override
  _NewBookingState createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: width*0.2),
          child: Text(
            'MAKOM',
            style: TextStyle(color: primaryColor, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
              child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.08, top: height*0.01,bottom: height*0.01),
                child: Text(
                  'New Booking',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height*0.01, left: width*0.03),
                    height: height*0.08,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0.0, 2.5))
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(top: height*0.01, left: width*0.04),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                  fontSize: 20)),
                        )),
                  ),
                  SizedBox(
                    width: width*0.02,
                  ),
                  Container(
                     margin: EdgeInsets.only(top: height*0.01, left: width*0.03),
                    height:  height*0.08,
                    width:  width*0.43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultPadding),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0.0, 2.5))
                        ]),
                    child: Padding(
                       padding: EdgeInsets.only(top: height*0.01, left: width*0.04),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                  fontSize: 20)),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.04, right: width*0.03, top: height*0.015),
                child:
                    txtfieldContainer(child: txtField(hintTxt: "Mobile Number")),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width*0.04,
                ),
                child: Row(
                  children: [
                    Container(
                      height: height*0.102,
                      width: width*0.55,
                      child: txtfieldContainer(
                        child: ExpandablePanel(
                          expanded: null,
                          header: Padding(
                            padding: EdgeInsets.only(top:height*0.01),
                            child: Text(
                              "Item Category",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                  fontSize: 20),
                            ),
                          ),
                          collapsed: Column(
                            children: [],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width*0.067,
                    ),
                    Container(
                        height: height*0.102,
                        width: width*0.31,
                        child: txtfieldContainer(
                            child: Padding(
                              padding: EdgeInsets.only(top:height*0.01),
                              child: txtField(hintTxt: "Wt (kgs)"),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.04, right: width*0.03,),
                child:
                    txtfieldContainer(child: txtField(hintTxt: "Delivery Time")),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.04, right: width*0.03,),
                child: txtfieldContainer(
                    child: Row(
                  children: [
                    Expanded(child: txtField(hintTxt: "PickUp Location")),
                    IconButton(
                        icon: Icon(
                          Icons.location_on,
                          size: height*0.05,
                          color: primaryColor,
                        ),
                        onPressed: () {}
                        )
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.04, right: width*0.03,),
                child: txtfieldContainer(
                    child: Row(
                  children: [
                    Expanded(child: txtField(hintTxt: "Drop off Location")),
                    IconButton(
                        icon: Icon(
                          Icons.location_on,
                          size:height*0.05,
                          color: primaryColor,
                        ),
                        onPressed: () {}
                        )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CommonButton(
          text: "Quote",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewBookingDetails()));
          },
        ),
      ),
    );
  }
}
