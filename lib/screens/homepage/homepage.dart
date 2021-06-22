import 'package:flutter/material.dart';
import 'package:makom_delivery_app/constants.dart';
import 'package:makom_delivery_app/screens/collect_pending/collect_pending.dart';
import 'package:makom_delivery_app/screens/homepage/assign_page.dart';
import 'package:makom_delivery_app/screens/newbooking/newbooking.dart';
import 'package:makom_delivery_app/screens/pick_and_drop.dart/pick_drop.dart';
import 'package:makom_delivery_app/screens/profile/profile_screen.dart';
import 'package:makom_delivery_app/services/provider/authprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  var _selectedTab = 0;
  void _handleIndexChanged(int i) {
    _pageController.animateToPage(i,
        duration: Duration(microseconds: 200), curve: Curves.elasticInOut);
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    var userdata = Provider.of<AuthProvider>(context);
    print('user is ${userdata.getUid}');
    List<Widget> _pages = [
      PickUpAndDropOff(),
      OrderAssign(),
      CollectandPending(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              elevation: 5,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.car_repair), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "notify"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet_giftcard), label: "wallet"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings"),
              ],
              currentIndex: _selectedTab,
              iconSize: 25,
              onTap: (i) => _handleIndexChanged(i),
            ),
          ),
        ),
      ),
    );
  }
}
