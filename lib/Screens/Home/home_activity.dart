import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Home/home_page.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Login/mpin_page.dart';
import 'package:neo/Screens/Login/otp_page.dart';
import 'package:neo/Screens/Sidemenu/about_us.dart';
import 'package:neo/helper/config.dart';

import '../../helper/colorutility.dart';
import '../../helper/sharedprefhelper.dart';
import '../Sidemenu/contact_us.dart';
import '../Sidemenu/user_profile.dart';

class DrawerController extends GetxController {
  String _email = "";
  String _name = "";
  String _imagePath = "";
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerActivity extends StatefulWidget {
  final _draweItems = [
    new DrawerItem("Home ", Icons.home_outlined),
    new DrawerItem("Profile", Icons.person_outline),
    new DrawerItem("About Us", Icons.language_sharp),
    new DrawerItem("Contact Us", Icons.quick_contacts_dialer_outlined),
    new DrawerItem("Privacy Policy", Icons.privacy_tip_outlined),
    new DrawerItem("Terms & Conditions", Icons.fact_check_outlined),
    new DrawerItem("Faq", Icons.question_answer_outlined),
    new DrawerItem("Rate Us", Icons.image_aspect_ratio),
    new DrawerItem("Change Mpin", Icons.pin_outlined),
    new DrawerItem("Change Password", Icons.lock_outline),
    new DrawerItem("Quit", Icons.dangerous_outlined),
    new DrawerItem("Log Out", Icons.logout),
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerActivityState();
  }
}

class DrawerActivityState extends State<DrawerActivity> {
  final controller = Get.put(DrawerController());
  int _selectedIndex = 0;
  String picsUrl =
      "https://previews.123rf.com/images/pandavector/pandavector1901/pandavector190105561/126045782-vector-illustration-of-avatar-and-dummy-sign-collection-of-avatar-and-image-stock-symbol-for-web-.jpg";


  @override
  initState(){

    super.initState();
   // loadData();
  }
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new UserProfile();
      case 2:
       // return new MPINVerification();
        return new AboutUs();
      case 3:
      // return new MPINVerification();
        return new ContactUs();

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
    final controller = Get.put(DrawerController());
    List<Widget> drawerOpts = [];
    for (var i = 0; i < widget._draweItems.length; i++) {
      var d = widget._draweItems[i];
      drawerOpts.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title,style: TextStyle(fontWeight: FontWeight.bold)),selectedTileColor:  ColorUtility().colorSideSelected,selectedColor:  ColorUtility().colorAppbar,
            selected: i == _selectedIndex,
            onTap: () => _onSelectItem(i),
         )
      );
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorUtility().colorAppbar,
        title: new Text(widget._draweItems[_selectedIndex].title),
      ),

      drawer: new Drawer(
     child : FutureBuilder<void>(
       future:  fetchData(context),
      builder: (context, snapshot) {
        return Container(
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountEmail: new Text(""+controller._email, style: TextStyle(fontSize: 18),),
                    accountName: new Text(""+controller._name, style: TextStyle(fontSize: 16)),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(0xFF, 0x89, 0x34, 0x8E)),

                    currentAccountPicture: new GestureDetector(
                      // child :Container(
                      //     decoration: BoxDecoration(
                      //     image: DecorationImage(image:NetworkImage(Config().BASE_URL+controller._imagePath),fit: BoxFit.),
                      //     color: Colors.white,
                      //     shape: BoxShape.circle,
                      //     ),
                      //     ),

                      // child: new CircleAvatar(
                      //   backgroundImage: new NetworkImage(Config().BASE_URL+controller._imagePath)
                      //  // backgroundImage: new NetworkImage(picsUrl),
                      // ),

                      child: Container(
                        child: CircleAvatar(
                          child: CircleAvatar(
                             child: Image.network(Config().BASE_URL+controller._imagePath),backgroundColor: Colors.white
                            //  child: Image.network(picsUrl),backgroundColor: Colors.white
                            // child: Image.network(picsUrl),
                          ),backgroundColor: Colors.white,
                        ),padding: EdgeInsets.zero,
                      ),

                      onTap: () => print("This is your current account."),
                    ),

                  ),
                  Column(children: drawerOpts)
                ],
              )
            ],
          )
        );
      }
     )

      ),
      body: _getDrawerItemWidget(_selectedIndex),
    );

  }

  fetchData(BuildContext context) async {

    final controller = Get.put(DrawerController());
    controller._email= await SharedPreferencesHelper.getAgent_email();
    controller._name= await SharedPreferencesHelper.getAgent_name();
    controller._imagePath= await SharedPreferencesHelper.getAgent_image();

    print(controller._imagePath);
  }

  // Future loadData() async {
  //   final controller = Get.put(DrawerController());
  //
  //   setState(() async {
  //     controller._email= await SharedPreferencesHelper.getemail();
  //   });
  // }


}