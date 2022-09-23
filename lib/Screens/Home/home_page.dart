import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:neo/Model/HomeList.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Register/signup_page.dart';
import '../../constants.dart';
import '../../helper/sharedprefhelper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {



  /*List<HomeList> toplist = [
    HomeList(name: 'Pendings', profileImg: 'assets/images/logo.png', bio: "Software Developer"),
    HomeList(name: 'Confirmed', profileImg: 'assets/images/logo.png', bio: "UI Designer"),
    HomeList(name: 'Packed', profileImg: 'assets/images/logo.png', bio: "Software Tester"),
    HomeList(name: 'Dispatched', profileImg: 'assets/images/logo.png', bio: "Software Tester"),
    HomeList(name: 'Delivered', profileImg: 'assets/images/logo.png', bio: "Software Tester")
  ];

  Widget personDetailCard(Person) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Person.profileImg)
                        )
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(Person.name,
                    style: TextStyle (
                        color: Colors.black54,
                        fontSize: 18
                    ),
                  )
                  *//*Text(Person.bio,
                    style: TextStyle (
                        color: Colors.white,
                        fontSize: 12
                    ),
                  )*//*
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,

              child: Carousel(

                boxFit: BoxFit.cover,
                images: [

                  AssetImage('assets/images/introslider1.png'),
                  AssetImage('assets/images/introslider2.png'),
                  AssetImage('assets/images/introslider3.png'),
                  AssetImage('assets/images/introslider1.png'),

                ],

                autoplay: true,
                dotColor: Colors.yellow,
                dotBgColor: Colors.black,
                dotSize: 5.0,
                dotSpacing: 20.0,
              ),
            ),

            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,

               mainAxisSpacing: 10,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't se
              children: <Widget>[

                Container(
                padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("Report", textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[200],
        child: const Text('Stock', textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[300],
        child: const Text('Dashboard', textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[400],
        child: const Text('Reports', textAlign: TextAlign.center),
      ),

              ],
            )
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, size: 35, color: Colors.white),
                Text('Notifications',
                  style: TextStyle (
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
                Icon(Icons.notifications_none, size: 35, color: Colors.white)
              ],
            ),*/
          /*  Column(
                children: toplist.map((p) {
                  return personDetailCard(p);
                }).toList()
            )*/
          ],
        ),
      ),
    );
  }

  @override
  void initState() {

    getData();
    super.initState();
  }

  Future<void> getData() async {
    String namess = await SharedPreferencesHelper.getfacebook();
    print("HOME  16811   :  $namess");

   // await SharedPreferencesHelper.logout();
  }
}
