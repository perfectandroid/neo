import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/send_otp.dart';
import 'package:neo/Screens/Stocks/SockReportListModel.dart';
import 'package:neo/Screens/Stocks/edit_stock.dart';
import 'package:neo/Screens/Stocks/stock_edit.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';

import '../../Model/category_model.dart';
import '../../Model/subcategory_model.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

import '../../helper/showDialogs.dart';
import '../Home/home_page.dart';

class ReportStockController extends GetxController {

  TextEditingController InputStatus = TextEditingController();
  TextEditingController InputSearch = TextEditingController();
  TextEditingController InputMinQuantity = TextEditingController();
  TextEditingController InputMaxQuantity = TextEditingController();
  TextEditingController InputCategory = TextEditingController();
  TextEditingController InputSubCategory = TextEditingController();

  String categoryId  = "";
  String subCategoryId  = "";

}

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
  CategoryModel categoryModel = CategoryModel();
  SubcategoryModel subcategoryModel = SubcategoryModel();
  final List<Map> data = [
    {'value': 1, 'display': 'One'},
    {'value': 2, 'display': 'Two'},
    {'value': 3, 'display': 'Three'}
  ];
  late int myNumber;
  String myValue = 'No value saved yet.';
  String radioButtonItem = 'ONE';
  int id = 1;

  var availableStock = "";
  var searchName = "";
  var minQuantity ="";
  var maxQuantity = "";


  @override
  initState(){
    final controller = Get.put(ReportStockController());
    super.initState();
    print("125866");
    print('availableStock  $availableStock');
    print('minQuantity  $searchName');
    print('minQuantity  $minQuantity');
    print('maxQuantity  $maxQuantity');
    print(controller.categoryId);
    print(controller.categoryId);


  }


  @override
  void onResumed() {
    final controller = Get.put(ReportStockController());
  }


  @override
  void dispose() {
    resetData(context);
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
                  resetData(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  new DrawerActivity()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


           // body: Center(child : getBody())
              body: SingleChildScrollView(
                  child : getBody()
              )


        )
    );



    // return Scaffold(
    //     body: Center(child : getBody())
    // );


  }

  Widget getBody(){
    return Stack(
        children: <Widget>[
          Card(
            elevation: 2,
            shadowColor: Colors.black,
            color: Colors.white,

            child : Container(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Container(
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(3.0),
                              width: MediaQuery.of(context).size.width,
                              //   height: MediaQuery.of(context).size.height/3,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey,width: 0.5)
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[

                                    inStockSearch(context),
                                    inStockQuantity(context),
                                    inCatSub(context),

                                    buttonfield(context)




                                  ]
                              )
                          ),

                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey,width: 0.5)
                              ),
                            margin: EdgeInsets.fromLTRB(0,10,0,2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Container(
                                        color: ColorUtility().colorReportHead,
                                        margin: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[

                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                  child:Text("SN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                 
                                                  
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(left: 5,right: 5),
                                                  padding: const EdgeInsets.fromLTRB(5,15,5,15),
                                                  child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                  child:Text("MRP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                  child:Text("STOCK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                  child:Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: const EdgeInsets.fromLTRB(4,15,4,15),
                                                  child:Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                ),
                                              )





                                            ]
                                        )
                                    ),

                                    if (stockModel.success == true) ...[

                                      Container(
                                          margin: EdgeInsets.fromLTRB(0,2,0,2),
                                          padding: EdgeInsets.all(0),
                                          color: Colors.white,
                                          height: MediaQuery.of(context).size.height * 0.48,
                                          child :ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: stockModel.data?.length,
                                              itemBuilder: (context,index){
                                                // return Text((stockModel.data?[index].seller).toString());
                                                return Card(
                                                    // elevation: 1,
                                                    // shadowColor: Colors.black,
                                                    // color: Colors.white,
                                                    margin: EdgeInsets.fromLTRB(0,0,0,0),
                                                    color: Colors.white,
                                                    //color: ColorUtility().colorLightGrey,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(2.0),),
                                                    elevation: 0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(1),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                                                        ],
                                                      ),
                                                      // color: Colors.white,
                                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[

                                                              Flexible(
                                                                flex: 1,
                                                                fit: FlexFit.tight,
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  alignment: Alignment.center,
                                                                  padding: EdgeInsets.all(2),
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
                                                                              alignment: Alignment.center,
                                                                              padding: EdgeInsets.only(left: 5,right: 5),
                                                                              margin: EdgeInsets.only(left: 5,right: 5),
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
                                                                  alignment: Alignment.center,
                                                                  padding: EdgeInsets.all(4),
                                                                  child:Text(""+Config.priceFormate((stockModel.data?[index].stkMrp).toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  alignment: Alignment.center,
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
                                                                    alignment: Alignment.center,
                                                                    padding: EdgeInsets.all(4),
                                                                    child:Text("Out of stock", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.red),),
                                                                  )
                                                                      : new
                                                                  Container(
                                                                    color: Colors.white,
                                                                    alignment: Alignment.center,
                                                                    padding: EdgeInsets.all(4),
                                                                    child:Text("In stock", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),),
                                                                  )

                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                 
                                                                  alignment: Alignment.center,
                                                                  padding: EdgeInsets.fromLTRB(0,0,2,0),
                                                                  child :IconButton(
                                                                    padding: EdgeInsets.only(right: 2),
                                                                    alignment: Alignment.centerLeft,
                                                                    icon: new Icon(Icons.border_color_outlined,color: ColorUtility().colorAppbar),
                                                                    highlightColor: Colors.grey,
                                                                    onPressed: (){

                                                                      final controller = Get.put(ReportStockController());
                                                                      controller.InputStatus.text = "";
                                                                      controller.InputSearch.text = "";
                                                                      controller.InputMinQuantity.text = "";
                                                                      controller.InputMaxQuantity.text = "";
                                                                      controller.InputCategory.text = "";
                                                                      controller.InputSubCategory.text = "";
                                                                      controller.categoryId = "";
                                                                      controller.subCategoryId = "";

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
                                                    )

                                                );



                                              }
                                          )
                                      )

                                    ] else ...[

                                    ],
                                  ]
                              )
                          )


                       /*   Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.55,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                          )*/
                        ]
                    )
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
    resetData(context);
    return (await  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>  new DrawerActivity()
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
      //  Navigator.pop(context,true);
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

  Widget inStockSearch(BuildContext context) {
    final controller = Get.put(ReportStockController());
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(5,5,5,0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                    // child :Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Radio(
                    //       value: 1,
                    //       groupValue: id,
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioButtonItem = 'In stock';
                    //           id = 1;
                    //         });
                    //       },
                    //     ),
                    //     Text(
                    //       'In stock',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //
                    //     Radio(
                    //       value: 2,
                    //       groupValue: id,
                    //       onChanged: (val) {
                    //         setState(() {
                    //           radioButtonItem = 'Out of stock';
                    //           id = 2;
                    //         });
                    //       },
                    //     ),
                    //     Text(
                    //       'Out of stock',
                    //       style: new TextStyle(
                    //         fontSize: 17.0,
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),

                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: true,
                            controller: controller.InputStatus,
                            decoration: InputDecoration(
                              labelText: "Available(In stock)",
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                              showStatusPopup(context);

                            },
                          )
                      )

                  )

              ),

              Expanded(

                  child :Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: false,
                            controller: controller.InputSearch,
                            
                            decoration: InputDecoration(
                              labelText: "Search",
                              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              isDense: true,
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                            },
                          )
                      )

                  )

              )


            ]
        )

    );
  }

  Widget inStockQuantity(BuildContext context) {
    final controller = Get.put(ReportStockController());
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(5,2,5,0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 2, 0),

                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: false,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                             // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                            ],
                            controller: controller.InputMinQuantity,
                            decoration: InputDecoration(
                              labelText: "Minimum Quantity",
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                            },
                          )
                      )

                  )

              ),

              Expanded(

                  child :Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: false,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                             // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                            ],
                           controller: controller.InputMaxQuantity,
                            decoration: InputDecoration(
                              labelText: "Maximum Quantity",
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                            },
                          )
                      )

                  )

              )


            ]
        )

    );
  }

  Widget inCatSub(BuildContext context) {
    final controller = Get.put(ReportStockController());
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(5,2,5,0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 2, 0),

                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: true,
                            controller: controller.InputCategory,
                            decoration: InputDecoration(
                              labelText: "Category",
                              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              isDense: true,
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                                 fetchCategory(context);

                            },
                          )
                      )

                  )

              ),

              Expanded(

                  child :Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                      child : SizedBox(
                          height: 40,
                          child:  TextField(
                            readOnly: true,
                            
                            controller: controller.InputSubCategory,
                            decoration: InputDecoration(
                              //isDense: true,
                              labelText: "Sub category",
                              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              isDense: true,
                              labelStyle: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500,width: 0.25),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,

                            ),
                            onTap: () async {

                              if(controller.categoryId.isEmpty){
                                validateMessage(context, "Select Category First");
                              }else{
                                fetchSubCategory(context);
                              }



                            },
                          )
                      )

                  )

              )


            ]
        )

    );
  }

  Widget buttonfield(BuildContext context) {
    final controller = Get.put(ReportStockController());
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                      child : SizedBox(
                        height: 40,
                        child: MaterialButton(
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            setState(() {

                              resetData(context);
                            });
                          },
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //   begin: Alignment.centerLeft,
                              //   end: Alignment.centerRight,
                              //   colors: [
                              //     Color(0xffff5f6d),
                              //     Color(0xffff5f6d),
                              //     Color(0xffffc371),
                              //   ],
                              // ),
                              color: ColorUtility().colorButtonReset,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                              child: Text("Reset",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      )

                  )

              ),

              Expanded(

                  child :Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                      child : SizedBox(
                        height: 40,
                        child: MaterialButton(
                          onPressed: (){

                             availableStock = "";
                             searchName = "";
                             minQuantity ="";
                             maxQuantity = "";

                            if(!controller.InputStatus.text.isEmpty){
                              availableStock = controller.InputStatus.text;
                            }

                            if(!controller.InputSearch.text.isEmpty){
                              searchName = controller.InputSearch.text;
                            }
                            if(!controller.InputMinQuantity.text.isEmpty){
                              minQuantity = controller.InputMinQuantity.text;
                            }
                            if(!controller.InputMaxQuantity.text.isEmpty){
                              maxQuantity = controller.InputMaxQuantity.text;
                            }

                            FocusManager.instance.primaryFocus?.unfocus();
                            SearchStockreportReport(context,availableStock.toString(),searchName.toString(),minQuantity.toString(),maxQuantity.toString(),controller.categoryId,controller.subCategoryId);

                          },
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //   begin: Alignment.centerLeft,
                              //   end: Alignment.centerRight,
                              //   colors: [
                              //     Color(0xffff5f6d),
                              //     Color(0xffff5f6d),
                              //     Color(0xffffc371),
                              //   ],
                              // ),
                              color: ColorUtility().colorButtonSearch,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                              child: Text("Search",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      )

                  )

              )


            ]
        )

    );
  }

  void resetData(BuildContext context) {

    final controller = Get.put(ReportStockController());
    controller.InputStatus.text = "";
    controller.InputSearch.text = "";
    controller.InputMinQuantity.text = "";
    controller.InputMaxQuantity.text = "";
    controller.InputCategory.text = "";
    controller.InputSubCategory.text = "";
    controller.categoryId = "";
    controller.subCategoryId = "";
    print(controller.InputSearch.text);
    stockModel.data?.clear();
    setState(() {

    });


  }

  void showStatusPopup(BuildContext context) {
    final controller = Get.put(ReportStockController());
    final List<String> available = <String>['In stock', 'Out of stock'];
      showDialog(
      context: context,
      //barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorUtility().colorAlertTop,
        title: Center(
            child: Text('AVAILABLE IN STOCK',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black))),
        content: Container(
          margin: EdgeInsets.all(5),
          width: double.maxFinite,  //  <------- Use SizedBox to limit width
          child: ListView.builder(
              shrinkWrap: true,  //            <------  USE SHRINK WRAP
              itemCount: available.length,
              itemBuilder: (context, index) =>
              // Text('Order'.),

               GestureDetector(
                  onTap: (){
                    controller.InputStatus.text = available[index];
                    Navigator.pop(context);
                  },
                  child: new Container(
                    width: double.infinity,
                    padding: new EdgeInsets.all(10),
                   // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                      ],
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(available[index],textAlign: TextAlign.start),
                        ]
                    ),
                  )
              )
              // Container(
              //     margin: EdgeInsets.all(1),
              //     child: Padding(
              //         padding: const EdgeInsets.fromLTRB(0,0,0,0),
              //         // child: Text(""+(orderStatusModel?.data?.status?[index]).toString()),
              //         child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: <Widget>[
              //
              //               ListTile(
              //                 tileColor: Colors.white,
              //                 title: Text(available[index]),
              //                 onTap: () {
              //                   controller.InputStatus.text = available[index];
              //                   Navigator.pop(context);
              //                 }, // Handle your onTap here.
              //               )
              //
              //
              //             ]
              //         )
              //
              //     )
              //
              //
              // )



          ),
        ),
      ),
    );

    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       return AlertDialog(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(0.0,),
    //           ),
    //         ),
    //         content: Container(
    //            child: SingleChildScrollView(
    //               padding: const EdgeInsets.all(5.0),
    //               child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: <Widget>[
    //
    //                   // Text((orderStatusModel.data?.status?[0]).toString())
    //                     ListView.builder(
    //                       shrinkWrap: true,
    //                       itemCount: 5,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return ListTile(
    //                           title: Text('Gujarat, India'),
    //                         );
    //                       },
    //                     ),
    //
    //                     // ListView.builder(
    //                     //   itemCount: orderStatusModel.data?.status?.length,
    //                     //   itemBuilder: (context, index) {
    //                     //     return Card(
    //                     //         // child: ListTile(
    //                     //         //   title: Text((orderStatusModel?.data?.status?[index]).toString()),
    //                     //         // )
    //                     //
    //                     //       child :Text("fghfg")
    //                     //     );
    //                     //
    //                     //   }
    //                     // )
    //                   ]
    //               )
    //            )
    //         )
    //
    //
    //       );
    //     }
    // );
  }


  Future<void> fetchCategory(BuildContext context) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/category_list/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("fetchCategory  1063     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        categoryModel = CategoryModel.fromJson(status);
         showCategoryPopup(context,categoryModel);
      }else{

        showFaliureAlertDialog(context,errors);
      }
    }catch (e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      return showFaliureAlertDialog(context,"Some technical issues");
    }

  }

  void showCategoryPopup(BuildContext context,CategoryModel categoryModel) {
    final controller = Get.put(ReportStockController());
    showDialog(
      context: context,
      //barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorUtility().colorAlertTop,
        title: Center(
            child: Text('CATEGORY',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black))),
        content: Container(
          margin: EdgeInsets.all(5),
          width: double.maxFinite, //  <------- Use SizedBox to limit width
          child: ListView.builder(
              shrinkWrap: true,  //            <------  USE SHRINK WRAP
              itemCount: categoryModel.data?.length,
              itemBuilder: (context, index) =>
              // Text('Order'.),
              Container(
                  margin: EdgeInsets.all(0),
                  child: Padding(
                      padding: const EdgeInsets.all(0),
                      // child: Text(""+(orderStatusModel?.data?.status?[index]).toString()),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            GestureDetector(
                              onTap: (){
                                controller.InputCategory.text = (categoryModel.data?[index].name).toString();
                                controller.categoryId  =(categoryModel.data?[index].catId).toString();
                                controller.InputSubCategory.text = "";
                                controller.subCategoryId  ="";
                                Navigator.pop(context);
                              },
                              child: new Container(
                                width: double.infinity,
                                padding: new EdgeInsets.all(10),
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                                  ],
                                ),
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      new Text((categoryModel.data?[index].name).toString(),textAlign: TextAlign.start),
                                    ]
                                )

                              )
                            )



                          // ListTile(
                          //     title: Text((categoryModel.data?[index].name).toString()),
                          //     onTap: () {
                          //       controller.InputCategory.text = (categoryModel.data?[index].name).toString();
                          //       controller.categoryId  =(categoryModel.data?[index].catId).toString();
                          //       controller.InputSubCategory.text = "";
                          //       controller.subCategoryId  ="";
                          //       Navigator.pop(context);
                          //     }, // Handle your onTap here.
                          //   )


                          ]
                      )

                  )


              )
          ),
        ),
      ),
    );

  }

  Future<void> fetchSubCategory(BuildContext context) async {
    final controller = Get.put(ReportStockController());
    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/sub_categories/'+controller.categoryId+'/'));
      print(request);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("fetchCategory  1063     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        subcategoryModel = SubcategoryModel.fromJson(status);
        showSubCategoryPopup(context,subcategoryModel);
      }else{

        showFaliureAlertDialog(context,errors);
      }
    }catch (e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      return showFaliureAlertDialog(context,"Some technical issues");
    }

  }

  void showSubCategoryPopup(BuildContext context,SubcategoryModel subcategoryModel) {
    final controller = Get.put(ReportStockController());
    showDialog(
      context: context,
      //barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: ColorUtility().colorAlertTop,
        title: Center(
            child: Text('SUB CATEGORY',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black))),
       // title: Text('SUB CATEGORY',textAlign: TextAlign.center),
        content: Container(
          margin: EdgeInsets.all(5),
          width: double.maxFinite,  //  <------- Use SizedBox to limit width
          child: ListView.builder(
              shrinkWrap: true,  //            <------  USE SHRINK WRAP
              itemCount: subcategoryModel.data?.length,
              itemBuilder: (context, index) =>
              // Text('Order'.),
              Container(
                  margin: EdgeInsets.all(0),
                  child: Padding(
                      padding: const EdgeInsets.all(0),
                      // child: Text(""+(orderStatusModel?.data?.status?[index]).toString()),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            GestureDetector(
                                onTap: (){
                                  controller.InputSubCategory.text = (subcategoryModel.data?[index].name).toString();
                                
                                  controller.subCategoryId  =(subcategoryModel.data?[index].subCatId).toString();
                                  Navigator.pop(context);
                                },
                                child: new Container(
                                    width: double.infinity,
                                    padding: new EdgeInsets.all(10),
                                    // color: Colors.white,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                                      ],
                                    ),
                                    child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          new Text((subcategoryModel.data?[index].name).toString(),textAlign: TextAlign.start),
                                        ]
                                    )

                                )
                            )

                            // ListTile(
                            //   title: Text((subcategoryModel.data?[index].name).toString()),
                            //   onTap: () {
                            //     controller.InputSubCategory.text = (subcategoryModel.data?[index].name).toString();
                            //     controller.subCategoryId  =(subcategoryModel.data?[index].subCatId).toString();
                            //     Navigator.pop(context);
                            //   }, // Handle your onTap here.
                            // )


                          ]
                      )

                  )


              )
          ),
        ),
      ),
    );

  }

  Future<SockReportListModel> SearchStockreportReport(BuildContext context,String availableStock,String searchName,String minQuantity,String maxQuantity,String categoryId,String subCategoryId) async {

    try{





      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};

      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/stock-report-list/?search_available=$availableStock&name=$searchName&min-quantity=$minQuantity&max-quantity=$maxQuantity&category=$categoryId&subcategory=$subCategoryId'));
      print('12345  $request');
      request.toString().replaceAll('%20', ' ');
      print('123456789  $request');


    //  var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/stock-report-list/?search_available=$availableStock&name=$searchName&min-quantity=$minQuantity&max-quantity=$maxQuantity&category=$categoryId&subcategory=$subCategoryId'));
      print(availableStock);
      print(request);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("SearchStockreportReport  1252     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        stockModel = SockReportListModel.fromJson(status);
        setState(() {

        });
        return  stockModel;

      }else{

        setState(() {
          stockModel.data?.clear();
        });
        return showFaliureAlertDialog(context,errors);
      }
    }catch (e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
     // return showFaliureAlertDialog(context,"Some technical issues");
      return showFaliureAlertDialog(context,e.toString());
    }

  }




}