import 'package:flutter/material.dart';

class OrderAssign extends StatefulWidget {
  @override
  _OrderAssignState createState() => _OrderAssignState();
}

class _OrderAssignState extends State<OrderAssign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'MAKOM',
          style: TextStyle(
            color: Colors.tealAccent[700],
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Order ID: '),
                              TextSpan(
                                text: '129304',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Time: '),
                              TextSpan(
                                text: '10:30 PM',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Address: '),
                          TextSpan(
                            text: 'Address: Address: Silicon Oasis, Dubai, UAE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              child: Text("Accept".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                              color: Colors.green)))),
                              onPressed: () => null),
                          SizedBox(width: 10),
                          ElevatedButton(
                              child: Text("Reject".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side:
                                              BorderSide(color: Colors.red)))),
                              onPressed: () => null)
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textInput({
    hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ), //Border.all

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: hint,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
