import 'package:flutter/material.dart';
import 'package:makom_delivery_app/screens/newbooking/bookingsignin.dart';

import '../../constants.dart';
import '../../widgets/common_button.dart';

class NewBookingDetails extends StatefulWidget {
  @override
  _NewBookingDetailsState createState() => _NewBookingDetailsState();
}

class _NewBookingDetailsState extends State<NewBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              'MAKOM',
              style: TextStyle(color: primaryColor, fontSize: 40,fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'New Booking',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: Row(children: [
              Row(
                children: [
                  Text(
                    'Order : ',
                  ),
                  Text('22154785',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                width: 110,
              ),
              Row(
                children: [
                  Text(
                    'Time : ',
                  ),
                  Text('02:30 A.M',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Pickup Address :  ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                    child: Text('33 A St, Al Main Road, DownTown Dubai',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text('Drop Off Address :  ',
                      style: TextStyle(fontSize: 15)),
                ),
                Expanded(
                    child: Text('25/4, Misbulliono Street, Lisbon',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child:
                      Text('Contact Name :  ', style: TextStyle(fontSize: 15)),
                ),
                Expanded(
                    child: Text('Ruben Khan',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text('Contact Number :  ',
                      style: TextStyle(fontSize: 15)),
                ),
                Expanded(
                    child: Text('+91 XXX XXX XXXX',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(children: [
              Row(
                children: [
                  Text(
                    'Weight : ',
                  ),
                  Text('7 Kgs',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                width: 110,
              ),
              Row(
                children: [
                  Text(
                    'Item Cat : ',
                  ),
                  Text('Electronics',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child:
                      Text('Quote Amount :  ', style: TextStyle(fontSize: 15)),
                ),
                Expanded(
                    child: Text('Rs. 14000',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)))
              ]),
            ),
          ),
        ])),
         bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CommonButton(
          text: "Collect Money",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewBookingSignin()));
          },
        ),
      ),
        );
  }
}
