import 'dart:io';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neo/Screens/Status/pendingdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:standard_dialogs/classes/dialog_action.dart';
import '../../Model/pendings.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../Home/home_activity.dart';
import '../Login/login_page.dart';
import '../Login/otp_page.dart';
import '../SplashScreen/splash_screen.dart';
import '../../helper/showDialogs.dart';
void main() => runApp(Test2());


class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _MainScreenState();
}

class _MainScreenState extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorUtility().colorAppbar,

            title: const Text(""),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => DrawerActivity(
                      //  liste: album,
                    ),
                  ),
                );
                // Navigator.pop(context,true);
              },
              icon: Icon(Icons.arrow_back),
            ),
            bottom: const TabBar(tabs: [
              Tab(icon: Image(image: AssetImage('assets/images/pendnglst.png')),text:"Pending"),
              Tab(icon: Image(image: AssetImage('assets/images/return.png')),text: "Return",),

            ]),
          ),
          body: TabBarView(
            children: [
              Chkbxjson(),
              Chkbxreturn(),
            ],
          ),
        ),
      ),
    );
  }
}
class GetUsers {
  int id;
  String status;
  String payment;
  double tot;

  GetUsers({
    required this.id,
    required this.status,
    required this.payment,
    required this.tot
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
      id: json['id'],
      status: json['status'],
      payment: json['payment_method'],
      tot: json['total_amount'],
      //name: json['name'],
      //email: json['email'],
      //phoneNumber: json['phone']
    );
  }
}





class Chkbxjson extends StatefulWidget{

  @override
  _ChkbxjsonListViewState createState() => _ChkbxjsonListViewState();
}

class Chkbxreturn extends StatefulWidget{

  @override
  _ChkbxjsonreturnListViewState createState() => _ChkbxjsonreturnListViewState();
}

class _ChkbxjsonListViewState  extends State<Chkbxjson>{
  List pendings1 = [];
  bool selected = false;
  late List<bool> userStatus;
  List<int> _ids2 = [];

  initState(){
    checkInterNet(this.context);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    List<int> _ids = [];
    // TODO: implement build
    return Scaffold(

        body: getPending(_ids)
        //body: getBody(),


    );
  }

  Widget getBody(){
    return Stack(

      children: <Widget>[
        new Container(
          
          height: MediaQuery.of(context).size.height * 0.9,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.06),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: pendings1.length,
            itemBuilder: (context,index){
              return new GestureDetector(
                onTap: () {
                   
                   print(index);

                } ,
                child: getCard(pendings1[index], index),
              );

            }
            
          ),
        )

          

      ]
    );
  }

Widget getCard(item,index){

  print(item);
  return Card(
     // margin: EdgeInsets.zero,
          margin: EdgeInsets.all(2.0),
          color: ColorUtility().colorLightGrey,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),),
          elevation: 5,

          child: Padding(
            padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Center(
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                            width: MediaQuery.of(context).size.width * 0.62,
                                            alignment: Alignment.centerLeft,
                                            child:Text(""+item['customer_name'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                            //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                          )
                                      ),


                                      Center(
                                          child : Container(
                                              width: MediaQuery.of(context).size.width * 0.25,
                                              alignment: Alignment.centerRight,

                                              child : Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[

                                                    Center(
                                                        child : Container(
                                                            padding: const EdgeInsets.all(5),
                                                            alignment: Alignment.centerLeft,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                              color: ColorUtility().colorAppbar,
                                                            ),
                                                            child: Row(
                                                                children: <Widget>[
                                                                  SvgPicture.asset("assets/images/ic_pending.svg",width: 12,height: 12,color: Colors.white),
                                                                  Container(width: 2,color :  Colors.transparent),
                                                                  Text(""+item['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),)
                                                                ]
                                                            )
                                                          //
                                                        )
                                                    )

                                                  ]
                                              )
                                          )
                                      )
//end







                                    ]
                                )
                            )

                        )
                    ),





                    Center(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,0,5),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[


                                    Center(
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          width: MediaQuery.of(context).size.width * 0.81,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[

                                                // Center(
                                                //     child: Container(
                                                //         child: Padding(
                                                //             padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //             child: Row(
                                                //                 crossAxisAlignment: CrossAxisAlignment.start,
                                                //                 children: <Widget>[
                                                //
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.8,
                                                //                         alignment: Alignment.centerLeft,
                                                //                         child:Text(""+item[index]['customer_name'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                //
                                                //                       )
                                                //                   ),
                                                //
                                                //                 ]
                                                //             )
                                                //         )
                                                //
                                                //     )
                                                // ),

                                                Center(
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[


                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                        alignment: Alignment.centerLeft,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                SvgPicture.asset("assets/images/ic_contact.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                Container(width : 5,color : Colors.transparent),
                                                                                Text("Address ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                              ]
                                                                          )
                                                                      //  child:Text("Address ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item['shipping_address']['address'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                       //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                        alignment: Alignment.centerLeft,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                SvgPicture.asset("assets/images/ic_order_id.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                Container(width : 5,color : Colors.transparent),
                                                                                Text("Order ID ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                              ]
                                                                          )
                                                                       // child:Text("Order ID ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item['order_id'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                // Center(
                                                //     child: Container(
                                                //         child: Padding(
                                                //             padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //             child: Row(
                                                //                 crossAxisAlignment: CrossAxisAlignment.start,
                                                //                 children: <Widget>[
                                                //
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.2,
                                                //                         alignment: Alignment.centerLeft,
                                                //                           child: Row(
                                                //                               children: <Widget>[
                                                //                                 // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                //                                 //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                //                                 SvgPicture.asset("assets/images/ic_order_id.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                //                                 Container(width : 5,color : Colors.transparent),
                                                //                                 Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                //                               ]
                                                //                           )
                                                //                         //child:Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                //                         alignment: Alignment.centerLeft,
                                                //                         decoration: BoxDecoration(
                                                //                           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                //                           color: ColorUtility().colorVerified,
                                                //                         ),
                                                //                         child:Text(""+item[index]['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),),
                                                //                         //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //
                                                //                 ]
                                                //             )
                                                //         )
                                                //
                                                //     )
                                                // ),

                                                Center(
                                                    child: Container(
                                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                        alignment: Alignment.centerLeft,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                SvgPicture.asset("assets/images/ic_sub_total.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                Container(width : 5,color : Colors.transparent),
                                                                                Text("Order Count ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                              ]
                                                                          )
                                                                        //child:Text("Order Count ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item['quantity'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                        alignment: Alignment.centerLeft,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                SvgPicture.asset("assets/images/ic_total.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                Container(width : 5,color : Colors.transparent),
                                                                                Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                              ]
                                                                          )
                                                                       // child:Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+Config.priceFormate(item['grand_total'].toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                        alignment: Alignment.centerLeft,
                                                                          child: Row(
                                                                              children: <Widget>[
                                                                                // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                SvgPicture.asset("assets/images/ic_sub_total.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                Container(width : 5,color : Colors.transparent),
                                                                                Text("Ordered On ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                              ]
                                                                          )
                                                                        //child:Text("Ordered On ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+Config.splitDateFormate(item['created_at'].toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                )

                                                ,
                                                // Text(""+item[index]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Address       : "+item[index]['fk_shipping_address'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Total            : "+item[index]['grand_total'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Ordered On : "+item[index]['created_at'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                              ]
                                          )
                                      ),
                                    ),

                                    Center(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(0,10,10,10),
                                          width: MediaQuery.of(context).size.width * 0.08,
                                          height: MediaQuery.of(context).size.width * 0.15,
                                          alignment: Alignment.bottomCenter,
                                          child: Transform.scale(
                                              scale: 1,
                                               child: Checkbox(
                                               activeColor: ColorUtility().colorAppbar,
                                               value: userStatus[index],
                                               onChanged: (value) {
                                               setState(() {
                                               userStatus[index] = value!;

                                                        });
                                               },
                                               )
                                          )
                                          ,
                                        )
                                    ),

                                    // Center(
                                    //   child: Container(
                                    //       padding: const EdgeInsets.all(0.0),
                                    //       width: MediaQuery.of(context).size.width * 0.2,
                                    //       child: Column(
                                    //           crossAxisAlignment: CrossAxisAlignment.end,
                                    //           children: <Widget>[
                                    //             Text(item[index]['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorGreen),),
                                    //             SizedBox(height: 5,),
                                    //
                                    //           ]
                                    //       )
                                    //   ),
                                    // ),
                                  ]
                              )
                          )
                      )
                    ),

                  ]
              )
          )
    



  );

}

  getPending(List<int> ids) {

    return Stack(
        children: <Widget>[

          new Container(
               height: MediaQuery.of(context).size.height * 0.9,
               margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
               width: double.infinity,
              padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height * 0.06),
              child :ListView.builder(
                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: pendings1.length,
                itemBuilder: (context, index){
                  ids.add(pendings1[index]['id']); // id adding to ids array
                return new GestureDetector(
                onTap: () {
                   
                   print('selected index '  +index.toString());
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendingDetails(
                                id: pendings1[index]['id'].toString(),delivery_status: pendings1[index]['delivery_status'].toString(),status: pendings1[index]['status'].toString(),
                              )
                              ),
                        );
                  } ,
                   child: getCard(pendings1[index], index),
                  );
                },
              )
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width, // <-- match_parent
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                            backgroundColor: ColorUtility().colorAppbar,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))
                        ),
                        onPressed: () {
                          print('List :  $userStatus');
                          print('List2 :'+ids.toString());

                          _ids2.clear();
                          for (var i = 0; i < userStatus.length; i++){
                            if(userStatus[i] == true ){
                              print("Packed List 96");
                              _ids2.add(ids[i]);
                              

                            }
                          }

                          print('Listing : $_ids2');
                          validateList(_ids2);

                            // AlertDialog(
                            //   title: Text("Success"),
                            //   titleTextStyle: TextStyle(
                            //       fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                            //   actions: [
                            //     ElevatedButton(onPressed: (){
                            //       Navigator.of(context).pop();
                            //     }, child: Text("Close")),
                            //   ],
                            //   content: Text("Saved successfully"),
                            // );

                            // ShowDialogs().showAlertDialog1(context, "TEST");
                            //savePending(context,_ids2);

                            print('Listin :  $_ids2');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     fullscreenDialog: true,
                            //     builder: (BuildContext context) => DrawerActivity(
                            //       //  liste: album,
                            //     ),
                            //   ),
                            // );
                          

                        },
                        child: Text('PROCEED TO CONFIRM'),
                      )
                  ),

                ]
            ),
          )




        ]
    );
  }

  getPendinglist( pendings1,  index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              //  child: Image(image: AssetImage('assets/images/time.png')),
              /* child: Image(
                              Asse("assets/images/time.png",
                              width: 300,
                              height: 300,)
                          ),
*/
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Order Id :"+
                          pendings1[index]['id'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Status :"+pendings1[index]['status'].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Payment :"+pendings1[index]['payment_method'].toString()),
                    ), Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Total Amount :"+pendings1[index]['total_amount'].toString()),
                    ),


                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0,10,10,10),
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.15,
                alignment: Alignment.centerRight,
                child: Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      activeColor: ColorUtility().colorAppbar,
                      value: userStatus[index],
                      onChanged: (value) {
                        setState(() {
                          userStatus[index] = value!;

                        });
                      },
                    )
                ),
              ),
            ),
          ],
        ),


      ),
    );
  }

  Future<void> checkInterNet(context) async {
    isOnline =  await NetworkUtility().checkInternet();
    print("122   :  $isOnline");

    if(isOnline){
      getpendingList(context);
    }
    else{
      checkOnlineAlert(context);
    }
  }

  
  void getpendingList(context) async {
    try {

      ShowDialogs().showProgressDialog(context,"Loading....",true);

      var _token = await SharedPreferencesHelper.getAgent_token();
      print("TOKEN  546   :  $_token");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token="Token "+_token;
      var headers = {'Content-Type': 'application/json', 'Authorization': token,};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_pending/'));
      // request.body = json.encode({});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();
      print("getPendinglist 200     "+request.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      print("statuscode"+statuscode.toString());
      final errors = status['errors'] as String;
      if(statuscode==true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);
        if (items.length == 0) {
          print('List is empty11.');
          print("4542  :$errors");
          Fluttertoast.showToast(
              msg: errors.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow
          );
          // showAlertDialog(context, errors.toString());
          setState(() {
            pendings1 = [];
          });
        } else {
          print("4541");
          setState(() {
            // showProgress(context,"message",false);
            //progressDialog.hide();
            userStatus = List<bool>.filled(items.length, false);
            pendings1 = items;

          });
        }



      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        setState(() {
          pendings1 = [];
        });
        Fluttertoast.showToast(
            msg: errors.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow
        );
        //   showAlertDialog(context, errors.toString());
      }
    }catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      //  ShowDialogs().showAlertDialog(context, e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );;
    }
  }

  Future<void> validateList(List pendinglist) async {

    if(pendinglist.length == 0){
      validateMessage(context,"Select Atleast one order");
    }else{
      isOnline =  await NetworkUtility().checkInternet();
      if(isOnline){
       savePendingList(_ids2);
      }
      else{
        checkOnlineAlert(context);
      }
    }

  }

    void validateMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content:  Text(''+message,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      backgroundColor: ColorUtility().colorWarning,
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.

        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> savePendingList(List<int> pendinglist) async{

  try{
    ShowDialogs().showProgressDialog(context,"Loading....",true);
    String token = await SharedPreferencesHelper.getAgent_token();
    var headerss = {"Authorization": "Token "+token,"Content-Type": "application/json"};
    var url =  Uri.parse(Config().BASE_URL+'/seller_api/order/update/'+'?order_ids=$pendinglist');
    var request = http.Request('PUT', url);
    request.headers.addAll(headerss);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();

    print("  savingOrder");
      print(res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      final message = status['mesaage'] as String;

      if (statuscode == true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);
        showSuccessAlert(context, message.toString());

      }else{

        ShowDialogs().showProgressDialog(context,"Loading....",false);
        showFaliureAlertDialog(context, errors.toString());

      }

  }catch(e){
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        ShowDialogs().showAlertDialog(context, e.toString());
  }

 }

 void showSuccessAlert(BuildContext context, String errorMsg) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {

       // Navigator.of(context).pop();
      
       Navigator.of(context,rootNavigator: true).pop();

        setState(() {
          checkInterNet(context);
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center),
      content: Text(errorMsg,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.center),
      actions: [
        okButton,
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
     // Navigator.pop(context,true);
      //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    
      if (Platform.isAndroid) {
       // Android-specific code
       Navigator.push(context, MaterialPageRoute(builder: (context) => new DrawerActivity(),));
      } else if (Platform.isIOS) {
       // iOS-specific code
       Navigator.of(context,rootNavigator: true).pop();
      }
      
     
      
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("" ),
    content: Text(errorMsg),
    actions: [
      okButton,
    ],
  );
  showDialog(
    //barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => new DrawerActivity(),)));
}





void savePending(BuildContext context,List<int> pendinglist) async{


  
  print('Test Ids :  $pendinglist');
  var _token = await SharedPreferencesHelper.getAgent_token();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = "Token " + _token;
  var headers = {'Content-Type': 'application/json', 'Authorization': token,};
  //var params={"order_ids": "$pendinglist"};
  //var request = http.Request('PUT', Uri.parse(Config().BASE_URL + '/seller_api/order/update/'+'?order_ids="+$pendinglist'));
  var url =  Uri.parse(Config().BASE_URL+'/seller_api/order/update/'+'?order_ids=$pendinglist');
  var request = http.Request('PUT', url);

  request.headers.addAll(headers);
  

  http.StreamedResponse response = await request.send();

 final res = await response.stream.bytesToString();

      print("save data");
      print(res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      final message = status['mesaage'] as String;
  if (statuscode == true) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white
    );

     //ShowDialogs().showAlertDialog1(context, message);

  }
  // else{
  //   Fluttertoast.showToast(
  //       msg: errors.toString(),
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white
  //   );
  // }

  
}

void checkOnlineAlert(context) {
  print('openCustomDialog  174   :');
  bool visibilityTag = false;
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
                        height:100,width:100,
                        // child:Image.asset("assets/images/logo.png")
                        child:Image.asset("assets/images/wifi_router.png")

                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10,20,10,0),
                      child:SizedBox(
                        child: Text(Config().msg_check_internet,textAlign: TextAlign.center,),
                      )

                  ),


                  Container(
                      height: 50,
                      width: double.infinity,
                      margin: new EdgeInsets.fromLTRB(0, 30, 0, 25),
                      child:Row(
                          children:<Widget>[
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                    SystemNavigator.pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:ColorUtility().colorNo,
                                    fixedSize: Size(100, 40),
                                  ),
                                  child: Text(
                                    "Close",
                                  ),
                                ),
                              ),
                            ),



                            Expanded(
                              flex: 5,
                              child: Center(
                                  child: Visibility(
                                      visible: true,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          // checkInterNet(context);
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new SplashScreen()),);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorUtility().colorYes,
                                          fixedSize: Size(100, 40),
                                        ),
                                        child: Text(
                                          "Retry",
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
      });





}




class _ChkbxjsonreturnListViewState  extends State<Chkbxreturn> {

  List<GetUsers> usersList2 = [];


  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<GetUsers>> fetchJSONData() async {
    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "Token " + _token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request(
        'GET', Uri.parse(Config().BASE_URL + '/seller_api/order/return/list/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    // print("getPendinglist 200     "+res.toString());
    final status = jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;
    if (statuscode == true) {
      final jsonItems1 = json.decode(res)['data'].cast<Map<String, dynamic>>();
      usersList2 = jsonItems1.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();
      //  print("json2"+jsonItems1);
    }
    else {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      Fluttertoast.showToast(
          msg: errors.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );     // duration

      //  showAlertDialog(context, errors.toString());
    }
    return usersList2;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /* appBar: AppBar(
        title: Text('Pending List'),
      ),*/


      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: usersList2 == null ? 0 : usersList2.length,
                itemBuilder: (BuildContext context, int index) {

                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            //  child: Image(image: AssetImage('assets/images/time.png')),
                            /* child: Image(
                              Asse("assets/images/time.png",
                              width: 300,
                              height: 300,)
                          ),
*/
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,


                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Order Id :"+
                                        usersList2[index].id.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Status :"+usersList2[index].status.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Payment :"+usersList2[index].payment.toString()),
                                  ), Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Total Amount :"+usersList2[index].tot.toString()),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


                    ),
                  );

                }
            ),
          );

        },
      ),

    );
  }


}







