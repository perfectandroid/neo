import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/DeliveryDetailModel.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class DispatchDetails extends StatefulWidget {
  String id;
  String delivery_status;
  String heading;

  DispatchDetails({required this.id, required this.delivery_status, required this.heading});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DispatchDetails();
  }

}


class _DispatchDetails extends State<DispatchDetails>{
  @override

  Future<DeliveryDetailModel>? futureAlbum;
  DeliveryDetailModel deliveryModel = DeliveryDetailModel();

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
          new Container(
              height: MediaQuery.of(context).size.height* 0.86,
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
                                          margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                          // Order Summary
                                          child:   Card(
                                              margin: EdgeInsets.fromLTRB(1,5,1,0),
                                              color: ColorUtility().colorDetailTop,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(3),),
                                              elevation: 5,
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
                                                                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                                                                              alignment: Alignment.centerLeft,
                                                                                                              child:Text(""+(deliveryModel?.data?.address?.name).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),

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
                                                                                                              child:Text("Order ID ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                                                            )
                                                                                                        ),
                                                                                                        Center(
                                                                                                            child: Container(
                                                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                                              alignment: Alignment.centerLeft,
                                                                                                              child:Text(""+(deliveryModel?.data?.orderId).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack ),),
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
                                                                                                              child:Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                                                            )
                                                                                                        ),
                                                                                                        if (deliverystatus == 'verified') ...[
                                                                                                          Center(
                                                                                                             child : Container(
                                                                                                                padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                                alignment: Alignment.centerLeft,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                  color: ColorUtility().colorVerified,
                                                                                                                ),
                                                                                                                child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),),
                                                                                                              )

                                                                                                          ),
                                                                                                        ]
                                                                                                        else if(deliverystatus == 'dispatched')...[
                                                                                                          Center(
                                                                                                              child : Container(
                                                                                                                padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                                alignment: Alignment.centerLeft,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                  color: ColorUtility().colorDispatched,
                                                                                                                ),
                                                                                                                child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),),
                                                                                                              )

                                                                                                          ),
                                                                                                        ]
                                                                                                        else if(deliverystatus == 'packed')...[
                                                                                                            Center(
                                                                                                                child : Container(
                                                                                                                  padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                                                                  alignment: Alignment.centerLeft,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                                                                    color: ColorUtility().colorPacked,
                                                                                                                  ),
                                                                                                                  child:Text(""+(deliveryModel?.data?.deliveryStatus).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),),
                                                                                                                )

                                                                                                            ),
                                                                                                          ]
                                                                                                        else ...[

                                                                                                          ],


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
                                                                                                              child:Text("Item Count ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                                                            )
                                                                                                        ),
                                                                                                        Center(
                                                                                                            child: Container(
                                                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                                              alignment: Alignment.centerLeft,
                                                                                                              child:Text(""+(deliveryModel?.data?.quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
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
                                                                                                              width: MediaQuery.of(context).size.width * 0.20,
                                                                                                              alignment: Alignment.centerLeft,
                                                                                                              child:Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                                                            )
                                                                                                        ),
                                                                                                        Center(
                                                                                                            child: Container(
                                                                                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                                                              alignment: Alignment.centerLeft,
                                                                                                              child:Text(""+(deliveryModel?.data?.grandTotal).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

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
                                        margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        // Order Summary
                                        child:   ExpansionTile(
                                          initiallyExpanded: false,
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
                      return Container();;
                    }
                  }
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


                        },
                        child: Text('DELETE'),
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






  Future<DeliveryDetailModel> fetchPost(context) async {

    try{
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
      if(statuscode==true){
        return deliveryModel = DeliveryDetailModel.fromJson(status);
      }else{
        return showFaliureAlertDialog(context,errors);

      }
    }catch (e){
      return showFaliureAlertDialog(context,"Some technical issues");
    }


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