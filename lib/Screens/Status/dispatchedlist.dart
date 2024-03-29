import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:neo/Screens/Home/home_activity.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import '../Home/home_page.dart';
import '../SplashScreen/splash_screen.dart';
import 'package:http/http.dart' as http;

import 'dispatchdetails.dart';

class DispatchedScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DispatchedScreen();
  }

}

class _DispatchedScreen extends State<DispatchedScreen>{
  @override
  List dispatchedList = [];
  late List<bool> _isChecked;
  late List _dispatchedSaveList = [];

  initState(){
    checkInterNet(this.context);
    super.initState();
  }

  Future<bool> _onBackPressed() async  {
    return (await  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => new DrawerActivity()
        ),
            (route) => false
    )) ??
        false;
  }

  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.07,
              automaticallyImplyLeading: true,
              backgroundColor: ColorUtility().colorAppbar,
              title: Text("Dispatched List"),
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context,true);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new DrawerActivity()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


            body: getBody()


        )
    );

  }

  Widget getBody(){
    return Stack(
        children: <Widget>[

          new Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height * 0.06),
              child :ListView.builder(
                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                shrinkWrap: true,
                itemCount: dispatchedList.length,
                itemBuilder: (context,index){
                  return new GestureDetector(
                      onTap: () {
                        print(index);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DispatchDetails(
                                  id: dispatchedList[index]['id'].toString(),delivery_status: dispatchedList[index]['delivery_status'].toString(),heading :'Dispatched Details',from: "dispatched",
                              )),
                        );

                      },
                      child :getCard(dispatchedList,index)
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
                          print('List :  $_isChecked');
                          _dispatchedSaveList.clear();
                          for (var i = 0; i < dispatchedList.length; i++){
                            if(_isChecked[i]){
                              print("Packed List 96");
                              print(dispatchedList[i]['id'].toString());
                              _dispatchedSaveList.add(dispatchedList[i]['id'].toString());
                            }
                          }
                          validateList(_dispatchedSaveList);
                        },
                        child: Text('PROCEED TO DELIVERY'),
                      )
                  ),

                ]
            ),
          )




        ]
    );


  }

  Widget getCard(item,index){

    print("147893");
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
                                          child:Text(""+item[index]['customer_name'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),
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
                                                            color: ColorUtility().colorDispatched,
                                                          ),
                                                          child: Row(
                                                              children: <Widget>[
                                                                // Image.asset("assets/images/icon_packed.png",width: 12,height: 12,color: Colors.white),
                                                                SvgPicture.asset("assets/images/ic_dispatched.svg",width: 12,height: 12,color: Colors.white),
                                                                Container(width: 2,color :  Colors.transparent),
                                                                Text(""+item[index]['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),)
                                                              ]
                                                          )
                                                        //
                                                      )
                                                  )

                                                ]
                                            )
                                        )
                                    )








                                  ]
                              )
                          )

                      )
                  ),


                  Center(
                      child: Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,0,5),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                                //                         child:Text(""+item[index]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),
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
                                                                       // child:Text("Address ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['shipping_address']['address'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                        //child:Text("Order ID ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['order_id'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                //                         child:Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                //                         alignment: Alignment.centerLeft,
                                                //                         decoration: BoxDecoration(
                                                //                           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                //                           color: ColorUtility().colorDispatched,
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
                                                                        child:Text(""+item[index]['quantity'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                        //child:Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.52,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+Config.priceFormate(item[index]['grand_total'].toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

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
                                                                        child:Text(""+Config.splitDateFormate(item[index]['created_at'].toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

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
                                          alignment: Alignment.centerRight,
                                          child: Transform.scale(
                                              scale: 1,
                                              child: Checkbox(
                                                activeColor: ColorUtility().colorAppbar,
                                                value: _isChecked[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    _isChecked[index] = value!;

                                                  });
                                                },
                                              )
                                          ),
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

                  // Center(
                  //     child: Container(
                  //         child: Padding(
                  //             padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  //             child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Center(
                  //                     child: Container(
                  //                         padding: const EdgeInsets.all(0.0),
                  //                         width: MediaQuery.of(context).size.width,
                  //                         child: Column(
                  //                             crossAxisAlignment: CrossAxisAlignment.end,
                  //                             children: <Widget>[
                  //                               Text("Ordered On : "+item['created_at'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                  //                               SizedBox(height: 5,),
                  //
                  //
                  //                             ]
                  //                         )
                  //                     ),
                  //                   )
                  //
                  //
                  //                 ]
                  //             )
                  //         )
                  //     )
                  // )
                ]
            )
        )





    );

  }

  Future<void> checkInterNet(context) async {
    isOnline =  await NetworkUtility().checkInternet();
    print("122   :  $isOnline");

    if(isOnline){
      getDispatchedList(context);
    }
    else{
      checkOnlineAlert(context);
    }
  }

  void getDispatchedList(context) async {
    try {

      ShowDialogs().showProgressDialog(context,"Loading....",true);

      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_dispatched/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getConfirmList  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;

      if(statuscode==true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);
        if (items.length == 0) {
          print('List is empty11.');
          print("4542  :$errors");
          showFaliureAlertDialog(context, errors.toString());
          setState(() {
            dispatchedList = [];
          });
        } else {
          print("4541");
          setState(() {
            // showProgress(context,"message",false);
            //progressDialog.hide();
            _isChecked = List<bool>.filled(items.length, false);
            dispatchedList = items;

          });
        }



      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        setState(() {
          dispatchedList = [];
        });
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }

  Future<void> validateList(List dispatchedSaveList) async {

    if(dispatchedSaveList.length == 0){
      validateMessage(context,"Select Atleast one order");
    }else{
      isOnline =  await NetworkUtility().checkInternet();
      if(isOnline){
        dispatchedOrder(dispatchedSaveList);
      }
      else{
        checkOnlineAlert(context);
      }
    }

  }

  Future<void> dispatchedOrder(List dispatchedSaveList) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headerss = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var url =  Uri.parse(Config().BASE_URL+'/seller_api/order/update/'+'?order_ids=$dispatchedSaveList');
      var request = http.Request('PUT', url);
      request.headers.addAll(headerss);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("795  packedOrder");
      print(res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      final message = status['mesaage'] as String;
      if(statuscode==true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);


        showSuccessAlert(context, message.toString());
        // setState(() {
        //  checkInterNet(context);
        // });

      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
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

  void showSuccessAlert(BuildContext context, String errorMsg) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pop();//additionaly add for remove alert dialog
        setState(() {
          checkInterNet(context);
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Dispatched",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center),
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

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      //Navigator.pop(context,true);
      //Navigator.pop(context);
       if (Platform.isAndroid) {
       // Android-specific code
       Navigator.of(context,rootNavigator: true).pop();
       //Navigator.push(context, MaterialPageRoute(builder: (context) => new DrawerActivity(),));
      } else if (Platform.isIOS) {
       // iOS-specific code
       Navigator.of(context,rootNavigator: true).pop();
      }
         // Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
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
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => new DrawerActivity(),)));
}