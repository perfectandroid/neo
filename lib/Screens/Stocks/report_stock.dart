import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/Screens/Stocks/SockReportListModel.dart';
import 'package:neo/Screens/Stocks/edit_stock.dart';
import 'package:neo/Screens/Stocks/stock_edit.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

import '../Home/home_page.dart';

class ReportStock extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReportStock();
  }
}

class _ReportStock extends State<ReportStock>{
  bool _isLoading=false; //bool variable created
  Future<SockReportListModel>? futureAlbum;
  SockReportListModel stockModel = SockReportListModel();

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.07,
              automaticallyImplyLeading: true,
              backgroundColor: ColorUtility().colorAppbar,
              title: Text("Stock"),
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context,true);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


            body: Center(child : getBody())


        )
    );



    // return Scaffold(
    //     body: Center(child : getBody())
    // );


  }

  Widget getBody(){
    return Stack(
        children: <Widget>[
          new Card(
            elevation: 2,
            shadowColor: Colors.black,
            color: Colors.white,

              child :Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child : FutureBuilder<SockReportListModel>(
                      future:  fetchData(context),
                      builder: (context, snapshot) {
                        if (stockModel.success == true) {
                          return Container(
                              child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[

                                        Container(
                                            color: ColorUtility().colorReportHead,
                                            child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[

                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("SN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("MRP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("STOCK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                      child:Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                    ),
                                                  )





                                                ]
                                            )
                                        ),

                                        Container(
                                            child:Expanded(
                                                child :ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: stockModel.data?.length,
                                                    itemBuilder: (context,index){
                                                      // return Text((stockModel.data?[index].seller).toString());
                                                      return  Container(
                                                          child: Padding(
                                                              padding: const EdgeInsets.all(0.0),
                                                              child : Card(
                                                                  elevation: 1,
                                                                  shadowColor: Colors.black,
                                                                  color: Colors.white,
                                                                  child:Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        Container(
                                                                            child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[

                                                                                  Flexible(
                                                                                    flex: 1,
                                                                                    fit: FlexFit.tight,
                                                                                    child: Container(
                                                                                      color: Colors.white,
                                                                                      alignment: Alignment.centerLeft,
                                                                                      padding: EdgeInsets.all(4),
                                                                                      child:Text(""+(index+1).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      flex: 3,
                                                                                      child: Center(
                                                                                          child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Container(
                                                                                                  color: Colors.white,
                                                                                                  alignment: Alignment.centerLeft,
                                                                                                  padding: EdgeInsets.all(4),
                                                                                                  child:Text(""+(stockModel.data?[index].product).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                                                )
                                                                                              ]
                                                                                          )
                                                                                      )
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Container(
                                                                                      color: Colors.white,
                                                                                      alignment: Alignment.centerLeft,
                                                                                      padding: EdgeInsets.all(4),
                                                                                      child:Text(""+(stockModel.data?[index].stkMrp).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Container(
                                                                                      color: Colors.white,
                                                                                      alignment: Alignment.centerLeft,
                                                                                      padding: EdgeInsets.all(4),
                                                                                      child:Text(""+(stockModel.data?[index].curQty).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                      flex: 3,
                                                                                      child: (stockModel.data?[index].curQty).toString() == '0' ?
                                                                                      new
                                                                                      Container(
                                                                                        color: Colors.white,
                                                                                        alignment: Alignment.centerLeft,
                                                                                        padding: EdgeInsets.all(4),
                                                                                        child:Text("Out of stock", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.red),),
                                                                                      )
                                                                                          : new
                                                                                      Container(
                                                                                        color: Colors.white,
                                                                                        alignment: Alignment.centerLeft,
                                                                                        padding: EdgeInsets.all(4),
                                                                                        child:Text("In stock", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                                      )

                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Container(
                                                                                      alignment: Alignment.center,
                                                                                      padding: EdgeInsets.all(0),
                                                                                      child :IconButton(
                                                                                        icon: new Icon(Icons.border_color_outlined,color: ColorUtility().colorAppbar),
                                                                                        highlightColor: Colors.grey,
                                                                                        onPressed: (){

                                                                                          print(index);
                                                                                          Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                fullscreenDialog: true,
                                                                                                // builder: (BuildContext context) => StockList(
                                                                                                builder: (BuildContext context) => StockEdit(model: stockModel,pos : index)
                                                                                              //builder: (BuildContext context) => EditStock()
                                                                                            ),
                                                                                          );




                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),


                                                                                ]
                                                                            )
                                                                        ),
                                                                        //  Divider()
                                                                      ]
                                                                  )
                                                              )

                                                          )



                                                      );

                                                    }
                                                )
                                            )

                                        )
                                      ]
                                  )
                              )


                          );
                        }
                        else{
                          return Container();
                        }
                      }
                  )
              )
          )

        ]
    );
  }

  Widget getCard(){
    return Card(
      margin: EdgeInsets.all(2.0),
      color: ColorUtility().colorLightGrey,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(4),
                          child:Text("S.NO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.grey,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(4),
                          child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.grey,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(4),
                          child:Text("STOCK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.grey,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(4),
                          child:Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                        ),
                      ),


                    ]
                )
              ),
              // Container(
              //     child : FutureBuilder<SockReportListModel>(
              //         future:  fetchData(context),
              //         builder: (context, snapshot) {
              //           if (stockModel.success == true) {
              //             return Container(
              //                 child: ListView(
              //                     children: [
              //                       Container(
              //                           width: MediaQuery.of(context).size.width,
              //                           margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
              //                           // Order Summary
              //                           child:   Text(":yhfghfghdfg")
              //                       ),
              //                     ]
              //                 )
              //             );
              //           }
              //           else{
              //             return Container();
              //           }
              //         }
              //     )
              // )


            ]
        )
      )
    );
  }

  Future<bool> _onBackPressed() async  {
    return (await  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()
        ),
            (route) => false
    )) ??
        false;
  }

  Future<SockReportListModel> fetchData(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/stock-report-list/'));
     //  var request = http.Request('GET', Uri.parse('http://202.164.150.222:8000/seller_api/stock-report-list/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("SockReportListModel  69     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        return stockModel = SockReportListModel.fromJson(status);
      }else{
        return showFaliureAlertDialog(context,errors);
      }
    }catch (e){
      return showFaliureAlertDialog(context,"Some technical issues");
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

}