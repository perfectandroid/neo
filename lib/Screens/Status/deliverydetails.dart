import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/DeliveryDetailModel.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import '../Home/home_page.dart';
import '../SplashScreen/splash_screen.dart';
import 'package:http/http.dart' as http;

class DeliveryDetails extends StatefulWidget{

  String id;
  DeliveryDetails({required this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeliveryDetails();
  }

}

class _DeliveryDetails extends State<DeliveryDetails>{
  @override
  List deliveryDetailList = [];
  String deliveryDetailListStr = "";
  var deliveryDetailListNew;
 // Future<DeliveryDetailModel> post;
   Future<DeliveryDetailModel>? futureAlbum;

  DeliveryDetailModel deliveryModel = DeliveryDetailModel();

  late List<bool> _isChecked;
  initState(){
    checkInterNet(this.context);
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtility().colorAppbar,
          title: Text("Delivery Details"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: Icon(Icons.arrow_back),
          ),

        ),

        body: Center(child : getBody())


    );

  }

  Widget getBody(){


    return FutureBuilder<DeliveryDetailModel>(
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
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              // Order Summary
                              child:   ExpansionTile(
                                initiallyExpanded: true,
                                title: Text("Customer Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorAppbar),),
                                collapsedBackgroundColor: ColorUtility().colorDroptab,
                                collapsedIconColor: ColorUtility().colorAppbar,
                                iconColor: ColorUtility().colorAppbar,
                                backgroundColor: ColorUtility().colorDroptab,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding:EdgeInsets.all(0),
                                    width: double.infinity,
                                    child:   Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[


                                          Container(
                                              width: MediaQuery.of(context).size.width,
                                              padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                              child: Row(
                                                children: <Widget>[
                                                  Center(
                                                      child: Container(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                        alignment: Alignment.topLeft,
                                                        child:Text("Name  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                      )
                                                  ),
                                                  Center(
                                                      child: Container(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                        width: MediaQuery.of(context).size.width * 0.01,
                                                        alignment: Alignment.topCenter,
                                                        child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                      )
                                                  ),
                                                  Center(
                                                      child: Container(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        alignment: Alignment.topLeft,
                                                        // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                        child:Text(""+(deliveryModel.data?.address?.name).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                        alignment: Alignment.topLeft,
                                                        child:Text("Address  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                      )
                                                  ),
                                                  Center(
                                                      child: Container(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                        width: MediaQuery.of(context).size.width * 0.01,
                                                        alignment: Alignment.topCenter,
                                                        child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                      )
                                                  ),
                                                  Center(
                                                      child: Container(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        alignment: Alignment.topLeft,
                                                        // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                        child:Text(""+(deliveryModel.data?.address?.address).toString()+","+(deliveryModel.data?.address?.cityName).toString()+","+(deliveryModel.data?.address?.stateName).toString()+","+(deliveryModel.data?.address?.countryName).toString()+","+(deliveryModel.data?.address?.pin).toString()+","+(deliveryModel.data?.address?.phone).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              // Order Summary
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                title: Text("Order Summary",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorAppbar),),
                                collapsedBackgroundColor: ColorUtility().colorDroptab,
                                collapsedIconColor: ColorUtility().colorAppbar,
                                iconColor: ColorUtility().colorAppbar,
                                backgroundColor: ColorUtility().colorDroptab,
                                children: [
                                  Container(
                                      color: Colors.white,
                                      padding:EdgeInsets.all(0),
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
                                                          child:Text("Item count  ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          // child:Text(""+(deliveryModel.data?.address?.address).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                          child:Text(""+(deliveryModel.data?.quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                          child:Text("Sub Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                          child:Text("Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                          child:Text("Member Discount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                padding: EdgeInsets.fromLTRB(5, 3, 3, 3),
                                                child: Row(
                                                  children: <Widget>[
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.35,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("GST ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                          child:Text("Payble Amount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.01,
                                                          alignment: Alignment.center,
                                                          child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                        )
                                                    ),
                                                    Center(
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                          width: MediaQuery.of(context).size.width * 0.55,
                                                          alignment: Alignment.centerLeft,
                                                          child:Text("No Value".toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              // Order Summary
                              child:  ExpansionTile(
                                initiallyExpanded: false,
                                title: Text("Item Details",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorAppbar),),
                                collapsedBackgroundColor: ColorUtility().colorDroptab,
                                collapsedIconColor: ColorUtility().colorAppbar,
                                iconColor: ColorUtility().colorAppbar,
                                backgroundColor: ColorUtility().colorDroptab,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding:EdgeInsets.all(0),
                                    width: double.infinity,
                                    child:   Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
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
                                                  child :getCard(deliveryModel,index)
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
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              // Order Summary
                              child:    ExpansionTile(
                                initiallyExpanded: false,
                                title: Text("Order Status",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorAppbar),),
                                collapsedBackgroundColor: ColorUtility().colorDroptab,
                                collapsedIconColor: ColorUtility().colorAppbar,
                                iconColor: ColorUtility().colorAppbar,
                                backgroundColor: ColorUtility().colorDroptab,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding:EdgeInsets.all(0),
                                    width: double.infinity,
                                    child:   Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[

                                          Text("Status")

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
            return CircularProgressIndicator();;
          }
        }
    );

  }

  Widget getCard(item,index){

    print("147893");
    print(item);
    return Card(
      // margin: EdgeInsets.zero,
        margin: EdgeInsets.fromLTRB(1,2,1,0),
        color: ColorUtility().colorLightGrey,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),),
        elevation: 2,

        child: Padding(
            padding: const EdgeInsets.all(5),
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
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Item ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.01,
                                                                        alignment: Alignment.center,
                                                                        child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.68,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text((deliveryModel?.data?.items?[index].productName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Quantity ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.01,
                                                                        alignment: Alignment.center,
                                                                        child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.68,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text((deliveryModel?.data?.items?[index].quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Amount ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.01,
                                                                        alignment: Alignment.center,
                                                                        child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.68,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text((deliveryModel?.data?.items?[index].netAmount).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        // child:Text(""+deliveryDetailList[1]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

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
     // getDeleiveryDetails(context);
      try{
        // futureAlbum = fetchPost(context);
       // fetchPost(context);
      }catch(e){
        print(e.toString());
      }

    }
    else{
      checkOnlineAlert(context);
    }
  }

  void getDeleiveryDetails(context) async {
    try {

      ShowDialogs().showProgressDialog(context,"Loading....",true);

      print("DeliveryDetails  210fdssf1111     "+widget.id);
     // print(Uri.parse(Config().BASE_URL+'customer_api/order/'+widget.id+'/'));
      print("DeliveryDetails  210fdssf     ");

      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
 //     var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/order/'+widget.id+'/'));
       var request = http.Request('GET', Uri.parse("http://202.164.150.222:8000/customer_api/order/2/"));
      //var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_delivered/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("DeliveryDetails  210     "+res.toString());

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
          //  deliveryDetailList = [];
            deliveryDetailListStr = "";
            deliveryDetailListNew = "";
          });
        } else {
          print("45411");
        //  setState(() {

            deliveryDetailListNew = json.decode(res.toString())['data'];

            // showProgress(context,"message",false);
            //progressDialog.hide();
           // _isChecked = List<bool>.filled(items.length, false);
         //   deliveryDetailList = items;
          //  deliveryDetailListStr = items.toString();
          //   String ss = items.toString();
          //
              print("HHHHHHHHH");
              print(items['address']['address']);
            print("HHHHHHHHHGGGGGG");
              print(deliveryDetailListNew['address']['address']);
          //     print(status['data']['items'][0]["product_name"]);
          //   //  print(jsonDecode(deliveryDetailListStr)['items'][0]["product_name"]);
          // });
        }



      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        setState(() {
          deliveryDetailList = [];
          deliveryDetailListNew = "";
         // deliveryDetailListStr = "";
        });
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
      print(e.toString());
    }
  }


  Future<DeliveryDetailModel> fetchPost(context) async {
    ShowDialogs().showProgressDialog(context,"Loading....",true);
    String token = await SharedPreferencesHelper.getAgent_token();
    var headerss = {"Authorization": "Token "+token,"Content-Type": "application/json"};
    final response = await http.get(Uri.parse(Config().BASE_URL+'/customer_api/order/'+widget.id+'/'),headers: headerss);
    //final response = await http.get(Uri.parse(Config().BASE_URL+'/customer_api/order/29/'),headers: headerss);
    ShowDialogs().showProgressDialog(context,"Loading....",false);
    if (response.statusCode == 200) {

      print("HLLO");
      print(response.body);
      return deliveryModel = DeliveryDetailModel.fromJson(json.decode(response.body));

    } else {
     // ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, "Failed to load post");
      throw Exception('Failed to load post');

    }



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
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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

