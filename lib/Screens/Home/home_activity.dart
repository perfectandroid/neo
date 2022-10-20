import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:neo/Screens/Home/home_page.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Login/mpin_page.dart';
import 'package:neo/Screens/Login/otp_page.dart';

import '../../helper/colorutility.dart';


class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerActivity extends StatefulWidget {
  final _draweItems = [
    new DrawerItem("HOME ", Icons.home),
    new DrawerItem("OTP", Icons.messenger),
    new DrawerItem("MPIN", Icons.settings_outlined)
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerActivityState();
  }
}

class DrawerActivityState extends State<DrawerActivity> {
  int _selectedIndex = 0;

  String picsUrl =
      "https://previews.123rf.com/images/pandavector/pandavector1901/pandavector190105561/126045782-vector-illustration-of-avatar-and-dummy-sign-collection-of-avatar-and-image-stock-symbol-for-web-.jpg";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
      //  return new OTPVerification();
      case 2:
        return new MPINVerification();

      default:
        return new Text("Error While");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);

    Navigator.of(context).pop(); // close the drawer
  }





  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOpts = [];
    for (var i = 0; i < widget._draweItems.length; i++) {
      var d = widget._draweItems[i];
      drawerOpts.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorUtility().colorAppbar,
        title: new Text(widget._draweItems[_selectedIndex].title),
      ),
      drawer: new Drawer(

        child: new Column(

          children: <Widget>[
            UserAccountsDrawerHeader(

              accountEmail: new Text("email@gmail.com", style: TextStyle(fontSize: 18),),
              accountName: new Text("Your Name", style: TextStyle(fontSize: 16),),
              decoration: BoxDecoration(
                color: const Color.fromARGB(0xFF, 0x89, 0x34, 0x8E)),

              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(picsUrl),
                ),
                onTap: () => print("This is your current account."),
              ),

            ),
            Column(children: drawerOpts)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedIndex),
    );

  }
}