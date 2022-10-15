import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/HomeList.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Register/signup_page.dart';
import 'package:neo/Screens/Status/confirmlist.dart';
import 'package:neo/Screens/Status/deliverylist.dart';
import 'package:neo/Screens/Status/dispatchedlist.dart';
import 'package:neo/Screens/Status/packedlist.dart';
import 'package:neo/Screens/Tabs/tab.dart';
import '../../constants.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Status/pendinglist2.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}
class PhotoItem {
  final String title;
  final String image;

  PhotoItem({
    required this.title,
    required this.image,
  });
}
class Grid2 {
  final String title;
  final String image;

  Grid2({
    required this.title,
    required this.image,
  });
}
class _HomePageState extends State<HomePage> {
 /* void tapped(int index){
    if(index == 1){
      print("huray 1");
    } else {
      print("not the one :(");
    }
  }*/
  final List <Grid2>myImageAndCaption = [
    Grid2(title: "Stock",image: "assets/images/stock.png"),
    Grid2(title: "Dashboard",image: "assets/images/dashboard.png"),
    Grid2(title: "Report",image: "assets/images/report.png"),
    Grid2(title: "Notification",image: "assets/images/notifctn.png"),


  ];

  final List<PhotoItem> liste = [
    PhotoItem(title: "Pendings", image: "assets/images/pending.png"),
    PhotoItem(title: "Confirmed", image: "assets/images/confirm.png"),
    PhotoItem(title: "Packed", image: "assets/images/confirm.png"),
    PhotoItem(title: "Dispatch", image: "assets/images/confirm.png"),
    PhotoItem(title: "Delivered", image: "assets/images/confirm.png"),
  ];

  /*List<PhotoItem> _items = [
    PhotoItem(
        ("assets/images/confirm.jpg"),
        "Pending/Return"),
    PhotoItem(
        ("assets/images/confirm.jpg"),
        "Confirm"),
    PhotoItem(
        ("assets/images/confirm.jpg"),
        "Packed"),
    PhotoItem(
        ("assets/images/confirm.jpg"),
        "Dispatch"),
    PhotoItem(
        ("assets/images/confirm.jpg"),
        "Delivered"),
  ];*/


/*  List<PhotoItem> _items = [
    PhotoItem(
        "https://images.pexels.com/photos/1772973/pexels-photo-1772973.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Pending/Return"),
    PhotoItem(
        "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Confirm"),
    PhotoItem(
        "https://images.pexels.com/photos/1130847/pexels-photo-1130847.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Packed"),
    PhotoItem(
        "https://images.pexels.com/photos/45900/landscape-scotland-isle-of-skye-old-man-of-storr-45900.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Dispatch"),
    PhotoItem(
        "https://images.pexels.com/photos/165779/pexels-photo-165779.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Delivered"),
  ];*/
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
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
    return WillPopScope(
        onWillPop: () {
          print('Backbutton pressed (device or appbar button), do whatever you want.');

          //trigger leaving and use own data
          SystemNavigator.pop();
          //we need to return a future
          return Future.value(false);
        },
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: <Widget>[

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GridView.builder(

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 5,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: liste.length,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onTap: () {
                        goToDetailsPage(context, liste[index]);
                        print(liste[index].title);
                      },
                    /*  onTap: () {

                        print("tapped");*/

                       /*  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteTwo(
                      image: liste[index].image, name: liste[index].name),
                ),
              );*/
                  //    },
                      child: Container(
                        /* width: 90.0,
              height: 90.0,*/
                        margin: const EdgeInsets.only(top: 3.0),

                        decoration: BoxDecoration(

                         // shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(liste[index].image),

                          ),

                        ),
                        child:Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          alignment: Alignment.bottomCenter,
                          child: new Text(liste[index].title,
                              style: new TextStyle(
                                fontWeight: FontWeight.normal,

                                fontSize: 10.0,


                              )
                          ),
                        ),

                        /*  child: Stack(
                children: [
                  RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: _items[index].name,style: TextStyle(color: Colors.black)),
                       // TextSpan(text: "Kalpesh\n",style: TextStyle(color: Colors.white))
                      ]
                  ))
                ],
              ),*/
                      ),

                    );
                  },
                ),


              ],
            ),
            Container(
              height: 300,

              child: Carousel(

                boxFit: BoxFit.cover,
                images: [

                  AssetImage('assets/images/banner.jpg'),
                  AssetImage('assets/images/banner.jpg'),
                  AssetImage('assets/images/banner.jpg'),
                  AssetImage('assets/images/banner.jpg'),

                ],

                autoplay: true,
                dotColor: Colors.yellow,
                dotBgColor: Colors.black,
                dotSize: 5.0,
                dotSpacing: 20.0,
              ),
            ),
           /* GridView.builder(
              itemCount: myImageAndCaption.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(liste[index]);
              },
            ),*/

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: 4,
              itemBuilder: (ctx, i) {
                return Card(

                  child: Container(
                    height: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                       //     SizedBox.expand(

                                Container(
                                  /* width: 90.0,
              height: 90.0,*/
                                //  margin: const EdgeInsets.only(top: 55.0),
                                  padding: const EdgeInsets.only(top: 85.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),

                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(myImageAndCaption[i].image),

                                    ),

                                  ),
                                  child:Container(
                                    padding: const EdgeInsets.only(top: 35.0),
                                    alignment: Alignment.bottomCenter,
                                    child: new Text(myImageAndCaption[i].title,
                                        style: new TextStyle(
                                          fontWeight: FontWeight.normal,


                                          fontSize: 10.0,


                                        )
                                    ),
                                  ),

                                  /*  Expanded(
                              child: Image.network(
                                'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                                fit: BoxFit.fill,
                              ),
                              fit: BoxFit.cover,
                              image: AssetImage(liste[index].image),
                            ),
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Subtitle',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )*/
                             //   ),
                              ),

                          //  ),
                          ],
                        ),
                      ],
                    ),
                  ),

                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 160,
              ),
            ),
           /* GridView.count(

              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              childAspectRatio: (1 / .9),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't se
              children: <Widget>[


                Container(
                *//*  padding: const EdgeInsets.all(8),
                  color: Colors.teal[200],*//*
                 // child: const Text('Stock', textAlign: TextAlign.end),
                  child: Center(child: Text('Stock'),),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                     // borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/stock.png"
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                Container(
                 *//* padding: const EdgeInsets.all(8),
                  color: Colors.teal[300],
                  child: const Text('Dashboard', textAlign: TextAlign.center),*//*
                  child: Center(child: Text('Dashboard'),),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/dashboard.png"
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                Container(
                *//*  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: const Text("Report", textAlign: TextAlign.center),*//*

                  child: Center(child: Text('Report'),),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                     // borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/report.png"
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                Container(
                *//*  padding: const EdgeInsets.all(8),
                  color: Colors.teal[400],
                  child: const Text('Notification', textAlign: TextAlign.center),*//*
                  child: Center(child: Text('Notification'),),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                    //  borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/notifctn.png"
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                ),

              ],
            )*/

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
            // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              showModal(context);
              break;
          }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),

    ));

  }
  goToDetailsPage(BuildContext context, PhotoItem album) {
   print(album.title);
   if(album.title=="Pendings")
     {
       Navigator.push(
         context,
         MaterialPageRoute(
           fullscreenDialog: true,
           builder: (BuildContext context) => PendingTab(
             //  liste: album,
           ),
         ),
       );
     }
   else if(album.title=="Confirmed")
     {
       Navigator.push(
         context,
         MaterialPageRoute(
           fullscreenDialog: true,
           builder: (BuildContext context) => ConfirmScreen(
             //  liste: album,
           ),
         ),
       );
       /*Fluttertoast.showToast(
         msg: "Confirmed",
         textColor: Colors.white,
         toastLength: Toast.LENGTH_SHORT,
         timeInSecForIosWeb: 1,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.indigo,
       );*/
     }
   else if(album.title=="Packed")
   {
     Navigator.push(
       context,
       MaterialPageRoute(
         fullscreenDialog: true,
         builder: (BuildContext context) => PackedScreen(
           //  liste: album,
         ),
       ),
     );
   }
   else if(album.title=="Dispatch")
   {
     Navigator.push(
       context,
       MaterialPageRoute(
         fullscreenDialog: true,
         builder: (BuildContext context) => DispatchedScreen(
           //  liste: album,
         ),
       ),
     );
   }
   else if(album.title=="Delivered")
   {
     Navigator.push(
       context,
       MaterialPageRoute(
         fullscreenDialog: true,
         builder: (BuildContext context) => DeliveryScreen(
           //  liste: album,
         ),
       ),
     );
   }
  }


  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Test'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }


}
