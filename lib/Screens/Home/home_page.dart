import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/HomeList.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Register/signup_page.dart';
import 'package:neo/Screens/Report/order_report.dart';
import 'package:neo/Screens/Report/test_report.dart';
import 'package:neo/Screens/Sidemenu/about_us.dart';
import 'package:neo/Screens/Status/confirmlist.dart';
import 'package:neo/Screens/Status/deliverylist.dart';
import 'package:neo/Screens/Status/dispatchedlist.dart';
import 'package:neo/Screens/Status/packedlist.dart';
import 'package:neo/Screens/Stocks/report_stock.dart';
import 'package:neo/Screens/Stocks/stock_list.dart';
import 'package:neo/helper/colorutility.dart';
import 'package:page_transition/page_transition.dart';
import '../../chart/dashboard.dart';
import '../../chart/itemgrid.dart';
import '../../chart/subsciberchart.dart';
import '../../constants.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Login/loginpage.dart';
import '../Notification/notifictn_list.dart';
import '../Sidemenu/user_profile.dart';
import '../Status/pendinglist2.dart';
import '../Tabs/tab1.dart';
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
  final Color color;
  final String bgimage;

  Grid2({
    required this.title,
    required this.image,
    required this.color,
    required this.bgimage,
  });
}
class _HomePageState extends State<HomePage> {

  //var _initialActiveIndex = 1;
 /* void tapped(int index){
    if(index == 1){
      print("huray 1");
    } else {
      print("not the one :(");
    }
  }*/
  final _pageController = PageController(initialPage: 2);
  int maxCount = 5;

  final List <Grid2>myImageAndCaption = [
    // Grid2(title: "Stock",image: "assets/images/stock.png"),
    // Grid2(title: "Dashboard",image: "assets/images/dashboard.png"),
    // Grid2(title: "Report",image: "assets/images/report.png"),
    // Grid2(title: "Notification",image: "assets/images/notifctn.png"),

    Grid2(title: "STOCK",image: "assets/images/homestock.png",color:ColorUtility().colorAppbar,bgimage: "assets/images/homestockbg.png"),
    Grid2(title: "DASHBOARD",image: "assets/images/homedash.png",color:ColorUtility().colorAppbar,bgimage: "assets/images/homedashbg.png"),
    Grid2(title: "REPORT",image: "assets/images/homereport.png",color:ColorUtility().colorAppbar,bgimage: "assets/images/homereportbg.png"),
    Grid2(title: "NOTIFICATION",image: "assets/images/homenotification.png",color:ColorUtility().colorAppbar,bgimage: "assets/images/homenotificationbg.png"),


  ];

  final List<PhotoItem> liste = [
    // PhotoItem(title: "Pendings", image: "assets/images/pending.png"),
    // PhotoItem(title: "Confirmed", image: "assets/images/confirm.png"),
    // PhotoItem(title: "Packed", image: "assets/images/confirm.png"),
    // PhotoItem(title: "Dispatch", image: "assets/images/confirm.png"),
    // PhotoItem(title: "Delivered", image: "assets/images/confirm.png"),

    PhotoItem(title: "Pendings", image: "assets/images/pending.png"),
    PhotoItem(title: "Confirmed", image: "assets/images/confirm.png"),
    PhotoItem(title: "Packed", image: "assets/images/packed.png"),
    PhotoItem(title: "Dispatch", image: "assets/images/dispatched.png"),
    PhotoItem(title: "Delivered", image: "assets/images/delivered.png"),
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 54) / 2;
    final double itemWidth = size.width / 2;

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
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 5,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.8),
                  ),
                  itemCount: liste.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        //shadowColor: Colors.grey,
                        shadowColor: Colors.white,
                        color: Colors.white,
                        child: new InkWell(
                        onTap: () {
                      goToDetailsPage(context, liste[index]);
                      print(liste[index].title);
                    },
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: MediaQuery.of(context).size.height/20,
                            height: MediaQuery.of(context).size.height/20,
                            margin:  EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(liste[index].image),
                                 // opacity: 0.6
                                ),
                                border: Border.all(
                                  color: ColorUtility().colorWhite,
                                  width: 0,
                                ), //Border.all
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorUtility().colorWhite,
                                    offset: const Offset(
                                      0.0,
                                      0.0,
                                    ), //Offset
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],

                              )

                          ),

                          Container(
                            // padding: const EdgeInsets.only(top: 10.0),
                            alignment: Alignment.bottomCenter,
                            child: new Text(liste[index].title,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                )
                            ),
                          )



                        ],
                      ),






                      // child: Container(
                      //   width: MediaQuery.of(context).size.height/10,
                      //   height: MediaQuery.of(context).size.height/10,
                      //   margin:  EdgeInsets.all(3.0),
                      //   decoration: BoxDecoration(
                      //    // shape: BoxShape.circle,
                      //     image: DecorationImage(
                      //       fit: BoxFit.fill,
                      //       image: AssetImage(liste[index].image)
                      //     ),
                      //     border: Border.all(
                      //       color: ColorUtility().colorWhite,
                      //       width: 0,
                      //     ), //Border.all
                      //     borderRadius: BorderRadius.circular(5),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: ColorUtility().colorWhite,
                      //         offset: const Offset(
                      //           0.0,
                      //           0.0,
                      //         ), //Offset
                      //         blurRadius: 0.0,
                      //         spreadRadius: 0.0,
                      //       ), //BoxShadow
                      //       BoxShadow(
                      //         color: Colors.white,
                      //         offset: const Offset(0.0, 0.0),
                      //         blurRadius: 0.0,
                      //         spreadRadius: 0.0,
                      //       ), //BoxShadow
                      //     ],
                      //
                      //   ),
                      //   child:Container(
                      //    // padding: const EdgeInsets.only(top: 10.0),
                      //     alignment: Alignment.bottomCenter,
                      //     child: new Text(liste[index].title,
                      //         style: new TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 10.0,
                      //         )
                      //     ),
                      //   )
                      // )


                    )
                    );
                  },
                ),


              ],
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   // decoration: BoxDecoration(
            //   //   color: Colors.white,
            //   //   borderRadius: BorderRadius.only(
            //   //       topLeft: Radius.circular(10),
            //   //       topRight: Radius.circular(10),
            //   //       bottomLeft: Radius.circular(10),
            //   //       bottomRight: Radius.circular(10)
            //   //   ),
            //   //   boxShadow: [
            //   //     BoxShadow(
            //   //       color: Colors.grey.withOpacity(0.5),
            //   //       spreadRadius: 5,
            //   //       blurRadius: 7,
            //   //       offset: Offset(0, 3), // changes position of shadow
            //   //     )
            //   //   ]),
            //   child:CarouselSlider(
            //       options: CarouselOptions(height:200,autoPlay: true),
            //       items: [
            //         MyImageView("assets/images/banner.jpg"),
            //         MyImageView("assets/images/banner.jpg"),
            //         MyImageView("assets/images/banner.jpg"),
            //         MyImageView("assets/images/banner.jpg"),
            //       ],
            //   ),
            // ),

            Container(
              child: CarouselSlider(
                items: [
                  MyImageView("assets/images/banner1.png"),
                  MyImageView("assets/images/banner2.png"),
                  MyImageView("assets/images/banner3.png"),
                  // MyImageView("assets/images/banner4.png"),
                  // MyImageView("assets/images/banner5.png"),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/4,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.98,
                ),
              )
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child :GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: myImageAndCaption.length,
                itemBuilder: (ctx, i) {
                  return  Card(
                    elevation: 0,
                     //shadowColor: Colors.grey,
                     shadowColor: Colors.white,
                     color: Colors.white,
                   // shadowColor: myImageAndCaption[i].color,
                   // color: myImageAndCaption[i].color,
                    child: new InkWell(
                      onTap: () {
//
                        goToDetailsPage2(i.toString());

                        print("Title"+i.toString());
                      },

                      child: Container(
                        alignment: Alignment.center,
                        height: 10,
                        width: MediaQuery.of(context).size.height/13,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //     color: Colors.white,
                            //     //color: myImageAndCaption[i].color,
                            //     width: 0.9
                            // ),
                            // borderRadius: BorderRadius.all(Radius.circular(5))
                          image: DecorationImage(
                            image: AssetImage(myImageAndCaption[i].bgimage),
                            fit: BoxFit.fill,
                          ),
                        ),

                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20)),

                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //     SizedBox.expand(
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.height/14,
                                  height: MediaQuery.of(context).size.height/14,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image: DecorationImage(
                                      scale: 1,
                                      fit: BoxFit.cover,
                                      image: AssetImage(myImageAndCaption[i].image),
                                      //opacity: 0
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(10.0),
                                  alignment: Alignment.bottomCenter,
                                  child: new Text(myImageAndCaption[i].title,
                                      style: new TextStyle(
                                        color: myImageAndCaption[i].color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      )
                                  ),
                                ),

                                //  ),
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                  );

                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 2,
                  mainAxisExtent: MediaQuery.of(context).size.height/5.5,
                ),
              ),
            )


          ],
        ),
      ),

      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: ColorUtility().colorAppbar,
        color: ColorUtility().colorBottomIcon,
        activeColor: Colors.white,

        items: [

          // TabItem(icon: Icons.person_outline, title: 'Profile'),
          // TabItem(icon: Icons.language_sharp, title: 'About Us'),
          TabItem(icon: Icons.dangerous_outlined, title: 'Quit'),
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.logout, title: 'Log Out'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) =>{


          if (i == 0) [
              quitAlert(context)
          ]
          else if (i == 1) [
            // Navigator.push(
            //   context,
            //   PageTransition(
            //     type: PageTransitionType.fade,
            //     child: HomePage(),
            //     isIos: true,
            //     duration: Duration(milliseconds: 40),
            //   ),
            // )
          ]
          else if (i == 2) [
              logOutAlert(context)
            ]
            // else if (i == 3) [
            //
            //
            //   ]
            //   else if (i == 4) [
            //       logOutAlert(context)
            //     ]

        }


      ),


      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: ColorUtility().colorHomeGrid,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage("assets/images/home.png")),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage("assets/images/home.png")),
      //      // icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage("assets/images/chat.png")),
      //      // icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   //selectedItemColor: Colors.amber[800],
      //   selectedItemColor: ColorUtility().colorAppbar,
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //       // only scroll to top when current index is selected.
      //         if (_selectedIndex == index) {
      //           _homeController.animateTo(
      //             0.0,
      //             duration: const Duration(milliseconds: 500),
      //             curve: Curves.easeOut,
      //           );
      //         }
      //         break;
      //       case 1:
      //         showModal(context);
      //         break;
      //     }
      //     setState(
      //           () {
      //         _selectedIndex = index;
      //       },
      //     );
      //   },
      // ),

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
           builder: (BuildContext context) => Test2(
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
    print("Hiiiiii");
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

  void goToDetailsPage2(String index) {
    print("Index"+index);

    if(index=="0")
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
         // builder: (BuildContext context) => StockList(
          builder: (BuildContext context) => ReportStock(
            //  liste: album,
          ),
        ),
      );
    }
    else if(index=="1")
    {

      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => Dashboard(
            //  liste: album,
          ),
        ),
      );
    }
    else if(index=="2")
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => OrderReport(
            //  liste: album,
          ),
        ),
      );
    }
    else if(index=="3")
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => Notificationlist(
            //  liste: album,
          ),
        ),
      );
    }

  }


  void logOutAlert(BuildContext context) {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            content: Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0.0),
                      child:SizedBox(
                          height:75,width:75,
                          // child:Image.asset("assets/images/logo.png")
                          child:Image.asset("assets/images/logo.png")

                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10,20,10,20),
                        child:SizedBox(
                          child: Text("Are you sure you want to quit ?",textAlign: TextAlign.center,),
                        )

                    ),

                    Divider(color: Colors.grey,
                        thickness: 1),

                    Container(
                        height: 40,
                        width: double.infinity,
                        margin: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child:Row(
                            children:<Widget>[
                              Expanded(
                                flex: 5,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      //action
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: DrawerActivity(),
                                          isIos: true,
                                          duration: Duration(milliseconds: 40),
                                        ),
                                      );

                                    },
                                    child: Text(
                                      'Cancel', //title
                                      textAlign: TextAlign.end, //aligment
                                    ),
                                  ),
                                ),
                              ),

                              VerticalDivider(
                                  color: Colors.grey, thickness: 1),

                              Expanded(
                                flex: 5,
                                child: Center(
                                    child: Visibility(
                                        visible: true,
                                        child: TextButton(
                                          onPressed: () async {
                                            // action
                                            // SystemNavigator.pop();
                                            // exit(0);
                                            //  window.close();
                                            bool logOut =  await SharedPreferencesHelper.logout();
                                            print(logOut);
                                            if(logOut){
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => LoginPage()
                                                  ),
                                                      (route) => false
                                              );

                                            }

                                          },
                                          child: Text(
                                            'Log Out', //title
                                            textAlign: TextAlign.end, //aligment
                                          ),
                                        ))

                                ),
                              )
                            ]
                        )

                    )






                  ],
                ),
              ),
            ),


          );
        }
    );
  }

  goToProfile(BuildContext context) {

    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: UserProfile(),
        isIos: true,
        duration: Duration(milliseconds: 40),
      ),
    );
  }




}


void quitAlert(BuildContext context) {

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          content: Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0.0),
                    child:SizedBox(
                        height:75,width:75,
                        // child:Image.asset("assets/images/logo.png")
                        child:Image.asset("assets/images/logo.png")

                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10,20,10,20),
                      child:SizedBox(
                        child: Text("Are you sure you want to quit ?",textAlign: TextAlign.center,),
                      )

                  ),

                  Divider(color: Colors.grey,
                      thickness: 1),

                  Container(
                      height: 40,
                      width: double.infinity,
                      margin: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:Row(
                          children:<Widget>[
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    //action
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: DrawerActivity(),
                                        isIos: true,
                                        duration: Duration(milliseconds: 40),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Cancel', //title
                                    textAlign: TextAlign.end, //aligment
                                  ),
                                ),
                              ),
                            ),

                            VerticalDivider(
                                color: Colors.grey, thickness: 1),

                            Expanded(
                              flex: 5,
                              child: Center(
                                  child: Visibility(
                                      visible: true,
                                      child: TextButton(
                                        onPressed: () {
                                          //action
                                          SystemNavigator.pop();
                                          // exit(0);
                                          //  window.close();
                                        },
                                        child: Text(
                                          'Quit', //title
                                          textAlign: TextAlign.end, //aligment
                                        ),
                                      ))

                              ),
                            )
                          ]
                      )

                  )






                ],
              ),
            ),
          ),


        );
      }
  );
}



class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(0,10,0,10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            )
          ],
        image: new DecorationImage(
          image: ExactAssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      )
    );
    // return Container(
    //     margin: EdgeInsets.symmetric(horizontal: 5),
    //     child: FittedBox(
    //       fit: BoxFit.cover,
    //       child: Image.asset(imgPath,),
    //     )
    // );
  }





}
