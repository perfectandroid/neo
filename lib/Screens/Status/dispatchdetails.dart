import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo/Screens/Status/dispatchedlist.dart';
import 'package:neo/Screens/Status/packedlist.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Model/DeliveryDetailModel.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

import '../../helper/showDialogs.dart';
import '../SplashScreen/splash_screen.dart';
import 'confirmlist.dart';

class DispatchDetails extends StatefulWidget {
  String id;
  String delivery_status;
  String heading;

  DispatchDetails({required this.id, required this.delivery_status, required this.heading});

  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _DispatchDetails();
  }


}


class _DispatchDetails extends State<DispatchDetails>{

  @override
  Future<DeliveryDetailModel>? futureAlbum;
  DeliveryDetailModel deliveryModel = DeliveryDetailModel();
  late List _saveList = [];

  late List<bool> _isChecked;
  initState(){
    // checkInterNet(this.context);
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtility().colorAppbar,
          title: Text(widget.heading),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: Icon(Icons.arrow_back),
          ),

        ),

        body: Center(child : getBody(widget.delivery_status))


    );

  }

  Widget getBody(String deliverystatus){

    return Stack(
        children: <Widget>[

          new ListView(
              physics: const AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    new Container(
                        height: MediaQuery.of(context).size.height* 0.82,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child : FutureBuilder<DeliveryDetailModel>(
                            future:  fetchPost(context),
                            builder: (context, snapshot) {
                              if (deliveryModel.success == true) {
                                return Container(
                                    child: ListView(
                                        children: [
                                          Column(
                                              children: [

                                                Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    margin: EdgeInsets.fromLTRB(2, 10, 2, 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black12,
                                                            width: 0.9
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                                    ),
                                                    // Order Summary
                                                    child:   Container(
                                                        //margin: EdgeInsets.fromLTRB(1,5,1,5),
                                                         color: ColorUtility().colorDroptab,
                                                        //color: Colors.transparent,
                                                        // shadowColor: Colors.grey,
                                                        // shape: RoundedRectangleBorder(
                                                        //   borderRadius: BorderRadius.circular(3),),
                                                        // elevation: 0,
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Center(
                                                                      child: Container(
                                                                          child: Padding(
                                                                              padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                                                              child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: <Widget>[

                                                                                    Center(
                                                                                      child: Container(
                                                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                          width: MediaQuery.of(context).size.width * 0.87,
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: <Widget>[

                                                                                                Center(
                                                                                                    child: Container(
                                                                                                        child: Padding(
                                                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                            child: Row(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: <Widget>[

                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child:Text(""+(deliveryModel?.data?.address?.name).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),
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

                                                                                                                          if (deliverystatus == 'verified') ...[

                                                                                                                            Center(
                                                                                                                                child : Container(
                                                                                                                                    padding: const EdgeInsets.all(5),
                                                                                                                                    alignment: Alignment.centerLeft,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                                      color: ColorUtility().colorVerified,
                                                                                                                                    ),
                                                                                                                                    child: Row(
                                                                                                                                        children: <Widget>[
                                                                                                                                          Image.asset("assets/images/icon_confirmed.png",width: 12,height: 12,color: Colors.white),
                                                                                                                                          Container(width: 2,color :  Colors.transparent),
                                                                                                                                          Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),)
                                                                                                                                        ]
                                                                                                                                    )
                                                                                                                                  //
                                                                                                                                )
                                                                                                                            )
                                                                                                                          ]
                                                                                                                          else if(deliverystatus == 'dispatched')...[
                                                                                                                            Center(
                                                                                                                                child : Container(
                                                                                                                                    padding: const EdgeInsets.all(5),
                                                                                                                                    alignment: Alignment.centerRight,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                                      color: ColorUtility().colorDispatched,
                                                                                                                                    ),
                                                                                                                                    child: Row(
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                        children: <Widget>[
                                                                                                                                          Image.asset("assets/images/icon_dispatched.png",width: 12,height: 12,color: Colors.white),
                                                                                                                                          Container(width: 2,color :  Colors.transparent),
                                                                                                                                          Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),)
                                                                                                                                        ]
                                                                                                                                    )
                                                                                                                                  //
                                                                                                                                )
                                                                                                                            )
                                                                                                                          ]
                                                                                                                          else if(deliverystatus == 'packed')...[
                                                                                                                              Center(
                                                                                                                                  child : Container(
                                                                                                                                      padding: const EdgeInsets.all(5),
                                                                                                                                      alignment: Alignment.centerLeft,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                                        color: ColorUtility().colorPacked,
                                                                                                                                      ),
                                                                                                                                      child: Row(
                                                                                                                                          children: <Widget>[
                                                                                                                                            Image.asset("assets/images/icon_packed.png",width: 12,height: 12,color: Colors.white),
                                                                                                                                            Container(width: 2,color :  Colors.transparent),
                                                                                                                                            Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),)
                                                                                                                                          ]
                                                                                                                                      )
                                                                                                                                    //
                                                                                                                                  )
                                                                                                                              )
                                                                                                                            ]
                                                                                                                          else...[]

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
                                                                                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                                                                        child: Padding(
                                                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                            child: Row(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: <Widget>[

                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Row(
                                                                                                                            children: <Widget>[
                                                                                                                              // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                                                              //Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                                                              SvgPicture.asset("assets/images/ic_discount.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                                                              Container(width : 5,color : Colors.transparent),
                                                                                                                              Text("Order ID ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorBlack)),
                                                                                                                            ]
                                                                                                                        )


                                                                                                                      )
                                                                                                                  ),
                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Text(""+(deliveryModel?.data?.orderId).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack ),),

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
                                                                                                //                         width: MediaQuery.of(context).size.width * 0.25,
                                                                                                //                         alignment: Alignment.centerLeft,
                                                                                                //                         child: Row(
                                                                                                //                             children: <Widget>[
                                                                                                //                               Image.asset("assets/images/icon_orderid.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                                //                               Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                                                                //                             ]
                                                                                                //                         )
                                                                                                //
                                                                                                //
                                                                                                //                       )
                                                                                                //                   ),
                                                                                                //                   if (deliverystatus == 'verified') ...[
                                                                                                //                     Center(
                                                                                                //                         child : Container(
                                                                                                //                           padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                //                           alignment: Alignment.centerLeft,
                                                                                                //                           decoration: BoxDecoration(
                                                                                                //                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                //                             color: ColorUtility().colorVerified,
                                                                                                //                           ),
                                                                                                //                           child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: Colors.white),),
                                                                                                //                         )
                                                                                                //
                                                                                                //                     ),
                                                                                                //                   ]
                                                                                                //                   else if(deliverystatus == 'dispatched')...[
                                                                                                //                     Center(
                                                                                                //                         child : Container(
                                                                                                //                           padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                //                           alignment: Alignment.centerLeft,
                                                                                                //                           decoration: BoxDecoration(
                                                                                                //                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                //                             color: ColorUtility().colorDispatched,
                                                                                                //                           ),
                                                                                                //                           child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: Colors.white),),
                                                                                                //                         )
                                                                                                //
                                                                                                //                     ),
                                                                                                //                   ]
                                                                                                //                   else if(deliverystatus == 'packed')...[
                                                                                                //                       Center(
                                                                                                //                           child : Container(
                                                                                                //                             padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                //                             alignment: Alignment.centerLeft,
                                                                                                //                             decoration: BoxDecoration(
                                                                                                //                               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                //                               color: ColorUtility().colorPacked,
                                                                                                //                             ),
                                                                                                //                             child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: Colors.white),),
                                                                                                //                           )
                                                                                                //
                                                                                                //                       ),
                                                                                                //                     ]
                                                                                                //                     else ...[
                                                                                                //
                                                                                                //                       ],
                                                                                                //
                                                                                                //
                                                                                                //                 ]
                                                                                                //             )
                                                                                                //         )
                                                                                                //
                                                                                                //     )
                                                                                                // ),

                                                                                                Center(
                                                                                                    child: Container(
                                                                                                        child: Padding(
                                                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                            child: Row(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: <Widget>[

                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Row(
                                                                                                                            children: <Widget>[
                                                                                                                             // Image.asset("assets/images/icon_ordercount.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                                                              SvgPicture.asset("assets/images/ic_total.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                                                              Container(width : 5,color : Colors.transparent),
                                                                                                                              Text("Item Count ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                                                                                            ],
                                                                                                                        )


                                                                                                                      )
                                                                                                                  ),
                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child:Text(""+(deliveryModel?.data?.quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                                                        child: Padding(
                                                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                            child: Row(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: <Widget>[

                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Row(
                                                                                                                            children: <Widget>[
                                                                                                                              //Image.asset("assets/images/icon_total.png",width: 20,height: 20,color: ColorUtility().colorAppbar,),
                                                                                                                              SvgPicture.asset("assets/images/ic_ordercount.svg",width: 14,height: 14,color : ColorUtility().colorAppbar,fit: BoxFit.scaleDown),
                                                                                                                              Container(width : 5,color : Colors.transparent),
                                                                                                                              Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                                                                                            ]
                                                                                                                        )


                                                                                                                      )
                                                                                                                  ),
                                                                                                                  Center(
                                                                                                                      child: Container(
                                                                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child:Text(""+(deliveryModel?.data?.grandTotal).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                                                                      )
                                                                                                                  ),

                                                                                                                ]
                                                                                                            )
                                                                                                        )

                                                                                                    )
                                                                                                ),


                                                                                              ]
                                                                                          )
                                                                                      ),
                                                                                    ),

                                                                                    // Center(
                                                                                    //     child: Container(
                                                                                    //       padding: const EdgeInsets.fromLTRB(0,10,10,10),
                                                                                    //       width: MediaQuery.of(context).size.width * 0.08,
                                                                                    //       height: MediaQuery.of(context).size.width * 0.15,
                                                                                    //       alignment: Alignment.centerRight,
                                                                                    //       child: Transform.scale(
                                                                                    //           scale: 1,
                                                                                    //           child: Checkbox(
                                                                                    //             activeColor: ColorUtility().colorAppbar,
                                                                                    //             value: _isChecked[index],
                                                                                    //             onChanged: (value) {
                                                                                    //               setState(() {
                                                                                    //                 _isChecked[index] = value!;
                                                                                    //                 print(value);
                                                                                    //               });
                                                                                    //             },
                                                                                    //           )
                                                                                    //       )
                                                                                    //       ,
                                                                                    //     )
                                                                                    // ),

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
                                                    )
                                                ),

                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.fromLTRB(2, 10, 2, 2),
                                                  padding:EdgeInsets.all(0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black12,
                                                          width: 0.9
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                  ),
                                                  // Order Summary
                                                  child:   ExpansionTile(
                                                    initiallyExpanded: false,
                                                   title :  Container(
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          SvgPicture.asset("assets/images/ic_custdetail.svg",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color : ColorUtility().colorHeaderText),
                                                             // Image.asset("assets/images/icon_cusdetail.png",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color: ColorUtility().colorAppbar,fit: BoxFit.fill),
                                                              Container(width: 10,color: Colors.transparent),
                                                              Text("Customer Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                           ]
                                                        )
                                                    ),
                                                   // title: Text("Customer Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                    collapsedBackgroundColor: ColorUtility().colorDroptab,
                                                    collapsedIconColor: ColorUtility().colorHeaderText,
                                                    // collapsedBackgroundColor: Colors.white,
                                                    //   collapsedIconColor:  Colors.black45,
                                                    iconColor: ColorUtility().colorHeaderText,
                                                    // iconColor: Colors.black45,
                                                    backgroundColor: ColorUtility().colorDroptab,
                                                    // backgroundColor: Colors.white,
                                                    children: [

                                                      Container(
                                                        color: ColorUtility().colorDetailBottom,
                                                        padding:EdgeInsets.all(10),
                                                        width: double.infinity,
                                                        child:   Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[
                                                              //   Divider(height: 0.1,color: Colors.black26),

                                                              Container(
                                                                  width: MediaQuery.of(context).size.width,
                                                                  padding: EdgeInsets.fromLTRB(3, 10, 3, 3),
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.25,
                                                                            alignment: Alignment.topLeft,
                                                                              child: Row(
                                                                                  children: <Widget>[
                                                                                    SvgPicture.asset("assets/images/ic_person.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                    Container(width : 5,color : Colors.transparent),
                                                                                    Text("Name  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                                  ]
                                                                              )
                                                                            //child:Text("Name  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.01,
                                                                            alignment: Alignment.topCenter,
                                                                            child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.55,
                                                                            alignment: Alignment.topLeft,
                                                                            // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                            child:Text(""+(deliveryModel.data?.address?.name).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                            //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),

                                                                      // Icon(Icons.add_shopping_cart),
                                                                    ],
                                                                  )
                                                              ),

                                                              Container(
                                                                  width: MediaQuery.of(context).size.width,
                                                                  padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.25,
                                                                            alignment: Alignment.topLeft,
                                                                              child: Row(
                                                                                  children: <Widget>[
                                                                                    // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                    SvgPicture.asset("assets/images/ic_contact.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                    Container(width : 5,color : Colors.transparent),
                                                                                    Text("Address  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                  ]
                                                                              )
                                                                            //child:Text("Address  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.01,
                                                                            alignment: Alignment.topCenter,
                                                                            child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),
                                                                      Center(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                            width: MediaQuery.of(context).size.width * 0.55,
                                                                            alignment: Alignment.topLeft,
                                                                            // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                            child:Text(""+(deliveryModel.data?.address?.address).toString()+","+(deliveryModel.data?.address?.cityName).toString()+","+(deliveryModel.data?.address?.stateName).toString()+","+(deliveryModel.data?.address?.countryName).toString()+","+(deliveryModel.data?.address?.pin).toString()+","+(deliveryModel.data?.address?.phone).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                            //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                          )
                                                                      ),

                                                                      // Icon(Icons.add_shopping_cart),
                                                                    ],
                                                                  )
                                                              ),

                                                            ]
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // Customer Details
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black12,
                                                          width: 0.9
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                  ),
                                                  // Order Summary
                                                  child: ExpansionTile(
                                                    initiallyExpanded: false,
                                                    title :  Container(
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              SvgPicture.asset("assets/images/ic_ordersummary.svg",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color : ColorUtility().colorHeaderText),
                                                              //Image.asset("assets/images/icon_ordersummary.png",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color: ColorUtility().colorAppbar,fit: BoxFit.fill),
                                                              Container(width: 10,color: Colors.transparent),
                                                              Text("Order Summary",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                            ]
                                                        )
                                                    ),
                                                   // title: Text("Order Summary",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                    collapsedBackgroundColor: ColorUtility().colorDroptab,
                                                    collapsedIconColor: ColorUtility().colorAppbar,
                                                    iconColor: ColorUtility().colorAppbar,
                                                    backgroundColor: ColorUtility().colorDroptab,
                                                    children: [
                                                      Container(
                                                          color: ColorUtility().colorDetailBottom,
                                                          padding:EdgeInsets.all(10),
                                                          width: double.infinity,
                                                          child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[


                                                                Container(
                                                                    width: MediaQuery.of(context).size.width * 9,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_item_count.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("Item count  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                              //child:Text("Item count  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              child:Text(""+(deliveryModel.data?.quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                ),

                                                                Container(
                                                                    width: MediaQuery.of(context).size.width * 9,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_sub_total.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("Sub Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                              //child:Text("Sub Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                ),

                                                                Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_discount.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                              //child:Text("Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                ),

                                                                Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_member_discount.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("Member Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                             // child:Text("Member Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                ),

                                                                Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_gst.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("GST ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                              //child:Text("GST ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                ),

                                                                Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              alignment: Alignment.centerLeft,
                                                                                child: Row(
                                                                                    children: <Widget>[
                                                                                      // Icon(Icons.play_arrow, color: Colors.black,size: 20),
                                                                                      SvgPicture.asset("assets/images/ic_pay_amount.svg",width: 14,height: 14,color : ColorUtility().colorLightBlack,fit: BoxFit.scaleDown),
                                                                                      Container(width : 5,color : Colors.transparent),
                                                                                      Text("Payble Amount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),)
                                                                                    ]
                                                                                )
                                                                             // child:Text("Payble Amount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.01,
                                                                              alignment: Alignment.center,
                                                                              child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),
                                                                        Center(
                                                                            child: Container(
                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              alignment: Alignment.centerLeft,
                                                                              child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                              //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                            )
                                                                        ),

                                                                        // Icon(Icons.add_shopping_cart),
                                                                      ],
                                                                    )
                                                                )


                                                              ]
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black12,
                                                          width: 0.9
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                  ),
                                                  // Order Summary
                                                  child:  ExpansionTile(
                                                    initiallyExpanded: false,
                                                    title :  Container(
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              SvgPicture.asset("assets/images/ic_itemdetail.svg",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color : ColorUtility().colorHeaderText),
                                                             // Image.asset("assets/images/icon_itemdetails.png",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color: ColorUtility().colorAppbar,fit: BoxFit.fill),
                                                              Container(width: 10,color: Colors.transparent),
                                                              Text("Item Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                            ]
                                                        )
                                                     ),
                                                    //title: Text("Item Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText),),
                                                    collapsedBackgroundColor: ColorUtility().colorDroptab,
                                                    collapsedIconColor: ColorUtility().colorAppbar,
                                                    iconColor: ColorUtility().colorAppbar,
                                                    backgroundColor: ColorUtility().colorDroptab,
                                                    children: [
                                                      Container(
                                                        color: ColorUtility().colorDetailBottom,
                                                        padding:EdgeInsets.all(10),
                                                        width: double.infinity,
                                                        child:   Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[

                                                              Container(
                                                                  width: MediaQuery.of(context).size.width * 9,
                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                  child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: <Widget>[

                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Container(
                                                                            alignment: Alignment.centerLeft,
                                                                            padding: const EdgeInsets.all(2),
                                                                            child:Text("SN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorSubHeaderText),),
                                                                          ),
                                                                        ),

                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Container(
                                                                            alignment: Alignment.centerLeft,
                                                                            padding: const EdgeInsets.all(2),
                                                                            child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorSubHeaderText),),
                                                                          ),
                                                                        ),

                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            padding: const EdgeInsets.all(2),
                                                                            child:Text("QUANTITY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorSubHeaderText),),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            padding: const EdgeInsets.all(2),
                                                                            child:Text("AMOUNT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorSubHeaderText),),
                                                                          ),
                                                                        ),
                                                                      ]
                                                                  )
                                                              ),

                                                              Divider(color: Colors.grey),

                                                              ListView.builder(
                                                                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                                                                shrinkWrap: true,
                                                                itemCount: deliveryModel?.data?.items?.length,
                                                                itemBuilder: (context,index){
                                                                  return new GestureDetector(
                                                                      onTap: () {
                                                                        print(index);
                                                                        // Navigator.push(
                                                                        //   context,
                                                                        //   MaterialPageRoute(
                                                                        //       builder: (context) => DeliveryDetails(
                                                                        //         id: (deliveryModel?.data?.items?.length).toString(),
                                                                        //       )),
                                                                        // );

                                                                      },
                                                                      child :getCard1(deliveryModel,index)
                                                                  );
                                                                  // return

                                                                },
                                                              )
                                                              // Text((deliveryModel?.data?.items?.length).toString())

                                                            ]
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black12,
                                                          width: 0.9
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                  ),
                                                  // Order Summary
                                                  child:    ExpansionTile(
                                                    initiallyExpanded: false,
                                                    title :  Container(
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              SvgPicture.asset("assets/images/ic_orderstatus.svg",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color : ColorUtility().colorHeaderText),
                                                              //Image.asset("assets/images/icon_orderstatus.png",width: MediaQuery.of(context).size.width * 0.04,height: MediaQuery.of(context).size.width * 0.04,color: ColorUtility().colorAppbar,fit: BoxFit.fill),
                                                              Container(width: 10,color: Colors.transparent),
                                                              Text("Order Status",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText)),
                                                            ]
                                                        )
                                                    ),
                                                   // title: Text("Order Status",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorHeaderText),),
                                                    collapsedBackgroundColor: ColorUtility().colorDroptab,
                                                    collapsedIconColor: ColorUtility().colorAppbar,
                                                    iconColor: ColorUtility().colorAppbar,
                                                    backgroundColor: ColorUtility().colorDroptab,
                                                    children: [
                                                      Container(
                                                        color: ColorUtility().colorDetailBottom,
                                                        padding:EdgeInsets.all(10),
                                                        width: double.infinity,
                                                        child:   Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[

                                                              ListView.builder(
                                                                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                                                                shrinkWrap: true,
                                                                itemCount: deliveryModel?.data?.status?.length,
                                                                itemBuilder: (context,index){
                                                                  return new GestureDetector(
                                                                      onTap: () {
                                                                        print(index);
                                                                        // Navigator.push(
                                                                        //   context,
                                                                        //   MaterialPageRoute(
                                                                        //       builder: (context) => DeliveryDetails(
                                                                        //         id: (deliveryModel?.data?.items?.length).toString(),
                                                                        //       )),
                                                                        // );

                                                                      },
                                                                      // child :getCardStatus(deliveryModel,index)
                                                                      child :_buildTimelineTile(deliveryModel,index)
                                                                  );
                                                                  // return

                                                                },
                                                              )

                                                            ]
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ]
                                          )]
                                    )
                                );
                              }
                              else{
                                return Container();;
                              }
                            }
                        )
                    ),
                  ]

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

                          _saveList.add(deliveryModel.data?.id);
                          validateList(_saveList);

                        },
                        child: Text('UPDATE'),
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
        margin: EdgeInsets.fromLTRB(0,1,0,1),
        color: ColorUtility().colorLightGrey,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),),
        elevation: 2,

        child: Padding(
            padding: const EdgeInsets.fromLTRB(0,2,0,2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Center(
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[


                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.all(2),
                                                    child:Text(""+(index+1).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.all(2),
                                                    child:Text((deliveryModel?.data?.items?[index].productName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.all(2),
                                                    child:Text((deliveryModel?.data?.items?[index].quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.all(2),
                                                    child:Text((deliveryModel?.data?.items?[index].netAmount).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                  ),
                                                ),

                                                // Container(
                                                //     width: MediaQuery.of(context).size.width * 9,
                                                //     padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                                //     child: Row(
                                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                                //         children: <Widget>[
                                                //
                                                //         ]
                                                //     )
                                                // ),
                                                // Divider(height: 0.05,color: ColorUtility().colorLightGrey1)

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
                                                //                         child:Text("Item ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.01,
                                                //                         alignment: Alignment.center,
                                                //                         child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.68,
                                                //                         alignment: Alignment.centerLeft,
                                                //                         child:Text((deliveryModel?.data?.items?[index].productName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //
                                                //
                                                //                 ]
                                                //             )
                                                //         )
                                                //
                                                //     )
                                                // ),
                                                //
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
                                                //                         child:Text("Quantity ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.01,
                                                //                         alignment: Alignment.center,
                                                //                         child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.68,
                                                //                         alignment: Alignment.centerLeft,
                                                //                         child:Text((deliveryModel?.data?.items?[index].quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //
                                                //
                                                //                 ]
                                                //             )
                                                //         )
                                                //
                                                //     )
                                                // ),
                                                //
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
                                                //                         child:Text("Amount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.01,
                                                //                         alignment: Alignment.center,
                                                //                         child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //                   Center(
                                                //                       child: Container(
                                                //                         padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                //                         width: MediaQuery.of(context).size.width * 0.68,
                                                //                         alignment: Alignment.centerLeft,
                                                //                         child:Text((deliveryModel?.data?.items?[index].netAmount).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //                         //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                //
                                                //                       )
                                                //                   ),
                                                //
                                                //
                                                //                 ]
                                                //             )
                                                //         )
                                                //
                                                //     )
                                                // ),





                                              ]
                                          )
                                      ),
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

  Widget getCard1(item,index){

    print("147893");
    print(item);
    // return Card(
    //    margin: EdgeInsets.zero,
    //     child :  ,
    // );
    return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width * 9,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0,5,0,5),
                  child:Text(""+(index+1).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0,5,0,5),
                  child:Text((deliveryModel?.data?.items?[index].productName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0,5,0,5),
                  child:Text((deliveryModel?.data?.items?[index].quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0,5,0,5),
                  child:Text((deliveryModel?.data?.items?[index].netAmount).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                ),
              ),
            ]
        )
    );

  }


  Widget _buildTimelineTile(item,index){
    return TimelineTile(
      alignment: TimelineAlign.start,
      lineXY: 0.3,
      isFirst: index == 0 ? true : false,
      isLast: index == 5 - 1 ? true : false,
      indicatorStyle: IndicatorStyle(width: 20, height: 20, indicator: _buildIndicator(),),
      afterLineStyle: LineStyle(thickness: 1, color: Colors.green,),
      beforeLineStyle: LineStyle(thickness: 1, color: Colors.green,),
      // startChild: Container(
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Text(
      //         "date",
      //         style: TextStyle(
      //           fontSize: 16,
      //           fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
      //           color: Colors.lightBlue,
      //         ),
      //       ),
      //       SizedBox(height: 5),
      //       Text(
      //         "time",
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontWeight: FontWeight.normal,
      //           color: Colors.lightBlue,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      endChild: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text((deliveryModel?.data?.status?[index].deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
            Text((deliveryModel?.data?.status?[index].statusMessage).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
            Text((deliveryModel?.data?.status?[index].updatedAt).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Container(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  Future<DeliveryDetailModel> fetchPost(context) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      print(widget.id);

      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      //var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/order/29/'));
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/order/'+widget.id+'/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getConfirmList  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        return deliveryModel = DeliveryDetailModel.fromJson(status);
      }else{
        return showFaliureAlertDialog(context,errors);

      }
    }catch (e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      return showFaliureAlertDialog(context,"Some technical issues");
    }


  }

  Future<void> validateList(List saveList) async {

    if(saveList.length == 0){
      validateMessage(context,"No order found");
    }else{
      isOnline =  await NetworkUtility().checkInternet();
      if(isOnline){
        verifyOrder(saveList);
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


  Future<void> verifyOrder(List saveList) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headerss = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var url =  Uri.parse(Config().BASE_URL+'/seller_api/order/update/'+'?order_ids=$saveList');
      var request = http.Request('PUT', url);
      request.headers.addAll(headerss);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("795  verifyOrder");
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

  void showSuccessAlert(BuildContext context, String errorMsg) {

    var dStatus = deliveryModel?.data?.deliveryStatus.toString();
    var statusLabel = "";
    if(dStatus == 'verified'){
      statusLabel = "VERIFY";
    }
    if(dStatus == 'packed'){
      statusLabel = "PACKED";
    }

    if(dStatus == 'dispatched'){
      statusLabel = "DISPATCHED";
    }
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        if(deliveryModel?.data?.deliveryStatus.toString() == 'verified'){
          // Navigator.removeRoute(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ConfirmScreen()
          //   ),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ConfirmScreen()),
          ).then((value) => setState(() {}));
          print("refresh done ");


        }
        if(deliveryModel?.data?.deliveryStatus.toString() == 'packed'){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PackedScreen()),
          ).then((value) => setState(() {}));
        }
        if(deliveryModel?.data?.deliveryStatus.toString() == 'dispatched'){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DispatchedScreen()),
          ).then((value) => setState(() {}));
        }

      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(""+statusLabel,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center),
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
}

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      //Navigator.pop(context,true);
      //Navigator.pop(context);
      Navigator.pop(context,true);
      Navigator.pop(context,true);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryScreen(),));
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
  );
}