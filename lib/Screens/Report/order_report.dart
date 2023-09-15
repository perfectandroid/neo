import 'dart:convert';
import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:neo/Model/user_model.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Report/order_report_model.dart';
import 'package:neo/Screens/Report/order_status_model.dart';
import 'package:neo/Screens/Stocks/SockReportListModel.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

import '../../helper/showDialogs.dart';


class OrderReportController extends GetxController {
  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();
  TextEditingController searchInput = TextEditingController();
  TextEditingController orderStatusInput = TextEditingController();
  ListView listViewController = ListView();
}

class OrderReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderReport();
  }

}


class _OrderReport extends State<OrderReport>{
  // bool _isLoading=false; //bool variable created
  // Future<UserModel>? futureAlbum;
  // UserModel userModel = UserModel();
  Future<SockReportListModel>? futureAlbum;
  SockReportListModel stockModel = SockReportListModel();
  OrderReportModel orderReportModel = OrderReportModel();
  OrderStatusModel orderStatusModel = OrderStatusModel();
  late List<String> orderStatusList = <String>[];

  late String _mySelection;
  List<Map> _myJson = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];

  List<dynamic> countys = [];
  late String countryId;

  @override
  initState(){
    countys.add({"id": 1,"name": "Hellooo"});
    countys.add({"id": 2,"name": "grgde"});
    countys.add({"id": 3,"name": "ewrhfb"});
    final controller = Get.put(OrderReportController());
    controller.orderStatusInput.text = "";
    controller.searchInput.text = "";
    getCuurentDate(context);
    
  //  fetchData(context);
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
              title: Text("Order Report"),
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context,true);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrawerActivity()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


          //  body: Center(child : getBody())

            body: SingleChildScrollView(
                child : getBody()
            )




        )
    );


  }

  Widget getBody(){
    final controller = Get.put(OrderReportController());
    return Stack(

        children: <Widget>[
          Container(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                     // filterScreen(context)

                      Container(
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(3.0),
                        width: MediaQuery.of(context).size.width,
                     //   height: MediaQuery.of(context).size.height/3,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey,width: 0.5)
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[

                              datePicker(context),
                              searchNames(context),
                              buttonfield(context)

                            ]
                        )
                      ),

                      Container(
                          margin: const EdgeInsets.fromLTRB(0,10,0,0,),
                          padding: const EdgeInsets.all(0.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey,width: 0.5)
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Container(
                                  color: ColorUtility().colorAlertTop,
                                    padding: EdgeInsets.fromLTRB(2,0,2,0),
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[

                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(4),
                                              child:Text("SI", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(4),
                                              child:Text("DATE", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(4),
                                              child:Text("NAME", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(4),
                                              child:Text("MOBILE", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          // Flexible(
                                          //   flex: 2,
                                          //   fit: FlexFit.tight,
                                          //   child: Container(
                                          //     alignment: Alignment.centerLeft,
                                          //     padding: EdgeInsets.all(4),
                                          //     child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                          //   ),
                                          // ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.all(4),
                                              child:Text("TOTAL", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(

                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.all(4),
                                              child:Text("STATUS", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                          ),

                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Container(

                                            ),
                                          ),


                                        ]
                                    )
                                ),

                                Container(
                                    color: ColorUtility().colorAlertTop,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[

                                        if (orderReportModel.success == true) ...[

                                          Container(
                                              margin: EdgeInsets.fromLTRB(0,2,0,2),
                                              padding: EdgeInsets.all(0),
                                              //color: ColorUtility().colorAlertTop,
                                              color: Colors.white,
                                              height: MediaQuery.of(context).size.height * 0.54,
                                              child :ListView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  shrinkWrap: false,
                                                  itemCount: orderReportModel.data?.length,
                                                  itemBuilder: (context,index){

                                                    return GestureDetector(
                                                      onTap: (){
                                                      //  controller.InputStatus.text = available[index];
                                                      //  Navigator.pop(context);

                                                       // print((orderReportModel.data?[index].items?[0].productName));

                                                        showItemListing(context,orderReportModel.data?[index].items,orderReportModel,index);

                                                      },
                                                      child : Card(
                                                          margin: EdgeInsets.fromLTRB(2,0,2,0),
                                                          // color: ColorUtility().colorAlertTop,
                                                          //color: ColorUtility().colorLightGrey,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(2.0),),
                                                          elevation: 0,
                                                          child:  Container(
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
                                                                        height: 30,
                                                                        alignment: Alignment.centerLeft,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+(index+1).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 2,
                                                                      fit: FlexFit.loose,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.centerLeft,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+Config.dateFormate((orderReportModel.data?[index].createdAt).toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.left,),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 2,
                                                                      fit: FlexFit.tight,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.centerLeft,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+(orderReportModel.data?[index].customerName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.left,),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 2,
                                                                      fit: FlexFit.tight,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.center,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+(orderReportModel.data?[index].fkUser).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                                                      ),
                                                                    ),
                                                                    // Flexible(
                                                                    //   flex: 2,
                                                                    //   fit: FlexFit.tight,
                                                                    //   child: Container(
                                                                    //     alignment: Alignment.centerLeft,
                                                                    //     padding: EdgeInsets.all(4),
                                                                    //     child:Text("", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.025,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,),
                                                                    //   ),
                                                                    // ),
                                                                    Flexible(
                                                                      flex: 2,
                                                                      fit: FlexFit.tight,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.centerRight,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+Config.priceFormate((orderReportModel.data?[index].grandTotal).toString().replaceAll("\r\n", "")), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.right,),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 2,
                                                                      fit: FlexFit.tight,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.centerRight,
                                                                        padding: EdgeInsets.all(4),
                                                                        child:Text(""+deliveryStatus((orderReportModel.data?[index].deliveryStatus).toString().replaceAll("\r\n", "")), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.0225,letterSpacing: .1,color: statusColor((orderReportModel.data?[index].deliveryStatus).toString().replaceAll("\r\n", ""))),textAlign: TextAlign.center,),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 1,
                                                                      fit: FlexFit.tight,
                                                                      child: Container(
                                                                        height: 30,
                                                                        alignment: Alignment.centerLeft,
                                                                        padding: EdgeInsets.all(4),
                                                                        child : Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: 16)
                                                                      ),
                                                                    ),


                                                                  ]
                                                              )
                                                          )
                                                      )
                                                    );

                                                  //  return

                                                  }
                                              )
                                          )

                                        ] else ...[

                                        ],
                                      ]
                                  )
                                )

                              ]
                          )
                      ),




                    ]
                )




                //   child :Container(
                //       height: MediaQuery.of(context).size.height,
                //       width: double.infinity,
                //       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                //       padding: EdgeInsets.fromLTRB(0,0,0,0),
                //       child : FutureBuilder<UserModel>(
                //           future:  fetchData(context),
                //           builder: (context, snapshot) {
                //             return Container();
                //           }
                //       )
                //   )

              )
          )
        ]
    );
  }

  Future<bool> _onBackPressed() async  {
    return (await  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => DrawerActivity()
        ),
            (route) => false
    )) ??
        false;
  }

  String deliveryStatus(String status){
  
     String currentStatus = "";
   
     currentStatus = status == "pending" ? "pending" : status == "verified" ? "verified" : 
                     status == "packed" ? "packed" : status == "dispatched" ? "dispatched" : 
                     status == "delivered" ? "delivered" : status == "order_cancelled" ? "cancelled" : status;

                    //currentStatus = status == "order_cancelled" ? "cancelled" : status;

     
    return currentStatus.replaceFirst(currentStatus[0], currentStatus[0].toUpperCase());
  }

  Color? statusColor(String status){
     print(status);
     Color currrntColor = Colors.black;
     currrntColor = status == "pending" ? ColorUtility().colorAppbar : 
                    status == "verified" ? ColorUtility().colorVerified :
                    status == "packed" ? ColorUtility().colorPacked : 
                    status == "dispatched" ? ColorUtility().colorDispatched :
                    status == "delivered" ? ColorUtility().colorDelivered : 
                    status == "order_cancelled" ? ColorUtility().colorWarning : Colors.black;

      return currrntColor;              

  }

  


  Widget datePicker(BuildContext context) {
    final controller = Get.put(OrderReportController());
    return Container(
      width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child :Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 2, 0),
                  alignment: Alignment.center,
                  child : SizedBox(
                    height: 38,
                      child:  TextField(
                        readOnly: true,
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller.dateInputFrom,
                        decoration: InputDecoration(
                          hintText: "From Date",
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
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              controller.dateInputFrom.text = formattedDate; //set output date to TextField value.
                            });
                          } else {}


                        },
                      )
                  )

                )

              ),

              Expanded(

                child :Container(
                    margin: EdgeInsets.fromLTRB(2, 4, 0, 0),
                    child : SizedBox(
                      height: 38,
                      child:  TextField(
                          readOnly: true,
                          controller: controller.dateInputTo,
                          decoration: InputDecoration(
                            hintText: "To Date",
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
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                controller.dateInputTo.text = formattedDate; //set output date to TextField value.
                              });
                            } else {}


                          },
                        )
                    )

                )

              )


            ]
        )

    );
  }

  Widget searchNames(BuildContext context) {
    final controller = Get.put(OrderReportController());
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // Expanded(
              //    child: Container(
              //      padding: EdgeInsets.all(0),
              //      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              //      decoration: BoxDecoration(
              //          borderRadius: BorderRadius.circular(5),
              //          border: Border.all(color: Colors.grey,width: 0.5)
              //      ),
              //        child: DateTimePicker(
              //          type: DateTimePickerType.date,
              //          dateMask: 'dd-MM-yyyy',
              //          initialValue: DateTime.now().toString(),
              //          firstDate: DateTime(2000),
              //          lastDate: DateTime(2100),
              //          icon: Icon(Icons.event),
              //          dateLabelText: 'To Date',
              //          timeLabelText: "Hour",
              //          cursorColor: Colors.black,
              //          style: ,
              //          selectableDayPredicate: (date) {
              //            // Disable weekend days to select from the calendar
              //            // if (date.weekday == 6 || date.weekday == 7) {
              //            //   return false;
              //            // }
              //            return true;
              //          },
              //          onChanged: (val) => print(val),
              //          validator: (val) {
              //            print(val);
              //            return null;
              //          },
              //          onSaved: (val) => print(val),
              //        )
              //    ),
              // ),
              //
              // Expanded(
              //   child: Container(
              //       padding: EdgeInsets.all(0),
              //       margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5),
              //           border: Border.all(color: Colors.grey,width: 0.5)
              //       ),
              //       child: DateTimePicker(
              //         type: DateTimePickerType.date,
              //         dateMask: 'dd-MM-yyyy',
              //         initialValue: DateTime.now().toString(),
              //         firstDate: DateTime(2000),
              //         lastDate: DateTime(2100),
              //         icon: Icon(Icons.event),
              //         dateLabelText: 'To Date',
              //         timeLabelText: "Hour",
              //         cursorColor: Colors.black,
              //         selectableDayPredicate: (date) {
              //           // Disable weekend days to select from the calendar
              //           // if (date.weekday == 6 || date.weekday == 7) {
              //           //   return false;
              //           // }
              //           return true;
              //         },
              //         onChanged: (val) => print(val),
              //         validator: (val) {
              //           print(val);
              //           return null;
              //         },
              //         onSaved: (val) => print(val),
              //       )
              //   ),
              // ),


              // Expanded(
              //     child: TextField(
              //       //controller: dateInput,
              //       //editing controller of this TextField
              //       decoration: InputDecoration(
              //           border: UnderlineInputBorder(),
              //           icon: Icon(Icons.calendar_today), //icon of text field
              //           labelText: "Enter Date" //label text of field
              //       ),
              //       readOnly: true,
              //       // onTap: () async {
              //       //   DateTime? pickedDate = await showDatePicker(
              //       //       context: context,
              //       //       initialDate: DateTime.now(),
              //       //       firstDate: DateTime(1950),
              //       //       //DateTime.now() - not to allow to choose before today.
              //       //       lastDate: DateTime(2100));
              //       //
              //       //   if (pickedDate != null) {
              //       //     print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              //       //     // String formattedDate =
              //       //     // DateFormat('yyyy-MM-dd').format(pickedDate);
              //       //     // print(
              //       //     //     formattedDate); //formatted date output using intl package =>  2021-03-16
              //       //     setState(() {
              //       //       dateInput.text = pickedDate.toString(); //set output date to TextField value.
              //       //     });
              //       //   } else {}
              //       //
              //       //
              //       // },
              //
              //
              //     )
              // )


              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                      child : SizedBox(
                        height: 38,
                          child:  TextField(
                            readOnly: false,
                            controller: controller.searchInput,
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

              ),

              Expanded(

                  child :Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                      child : SizedBox(
                      height: 38,
                          child:  TextField(
                            readOnly: true,
                            controller: controller.orderStatusInput,
                            decoration: InputDecoration(
                              labelText: "Order Status",
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

                              fetchOrderStatus(context);

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
    final controller = Get.put(OrderReportController());

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child :Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 2, 0),
                      child : SizedBox(
                        height: 39,
                        child: MaterialButton(
                          onPressed: (){
                            setState(() {
                              FocusScope.of(context).unfocus();
                              orderReportModel.data?.clear();
                              // controller.dateInputFrom.clear();
                              // controller.dateInputTo.clear();
                              getCuurentDate(context);
                              controller.searchInput.clear();
                              controller.orderStatusInput.clear();
                            });
                            print(orderReportModel);
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
                      margin: EdgeInsets.fromLTRB(2, 4, 0, 0),
                      child : SizedBox(
                        height: 39,
                        child: MaterialButton(
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            // var fromdate = controller.dateInputFrom.text;
                            // var todate = controller.dateInputTo.text;
                            // var orderstat = controller.orderStatusInput.text;
                            // var searchname = controller.searchInput.text;

                            var fromdate = "";
                            var todate = "";
                            var orderstat ="";
                            var searchname = "";

                            if(!controller.dateInputFrom.text.isEmpty){
                              fromdate = controller.dateInputFrom.text;
                            }

                            if(!controller.dateInputTo.text.isEmpty){
                              todate = controller.dateInputTo.text;
                            }

                            if(!controller.orderStatusInput.text.isEmpty){
                              
                              orderstat = (controller.orderStatusInput.text).replaceAll(" ", "_").toLowerCase();
                            }

                            if(!controller.searchInput.text.isEmpty){
                              searchname = controller.searchInput.text;
                            }

                            DateTime parseDate1 = new DateFormat("dd-MM-yyyy").parse(controller.dateInputFrom.text.toString());
                            var inputDate1 = DateTime.parse(parseDate1.toString());
                            var outputFormat1 = DateFormat('yyyy-MM-dd');
                            var outputDate1 = outputFormat1.format(inputDate1);
                            print(outputDate1);

                            DateTime parseDate2 = new DateFormat("dd-MM-yyyy").parse(controller.dateInputTo.text.toString());
                            var inputDate2 = DateTime.parse(parseDate2.toString());
                            var outputFormat2 = DateFormat('yyyy-MM-dd');
                            var outputDate2 = outputFormat2.format(inputDate2);
                            print(outputDate2);

                            //
                            DateTime dt1 = DateTime.parse(outputDate1);
                            DateTime dt2 = DateTime.parse(outputDate2);
                            //    print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                            // DateTime dateTime1 = DateTime.parse(controller.dateInputFrom.text.toString());
                            // DateTime dateTime2 = DateTime.parse(controller.dateInputTo.text.toString());
                            // print(dateTime1);
                            // print(dateTime2);
                            // String formattedDate1 =DateFormat('yyyy-MM-dd').format(dateTime1);
                            // String formattedDate2 =DateFormat('yyyy-MM-dd').format(dateTime2);
                            // print(formattedDate1);
                            // print(formattedDate2);

                            // DateTime dt1 = DateTime.parse(formattedDate1);
                            // DateTime dt2 = DateTime.parse(formattedDate2);
                            //

                            if(dt1.compareTo(dt2) <= 0){
                              print("DT1 is before DT2");
                              print(fromdate);
                              SearchOrderReport(context,fromdate.toString(),todate.toString(),searchname.toString(),orderstat.toString());
                            }
                            else{
                              validateMessage(context,"Check Date");
                            }



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




  Widget filterScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/5,

       // child : Card(
       //      elevation: 1,
       //      shadowColor: Colors.black,
       //      color: Colors.white,
       //      child:Column(
       //          crossAxisAlignment: CrossAxisAlignment.start,
       //          mainAxisAlignment: MainAxisAlignment.center,
       //          children: <Widget>[
       //
       //            Text("He;lllol"),
       //            Text("He;lllol"),
       //            Text("He;lllol"),
       //            Text("He;lllol"),
       //            Text("He;lllol")
       //          ]
       //      )
       //  )


        // child : FutureBuilder<SockReportListModel>(
        //     future:  fetchData(context),
        //     builder: (context, snapshot) {
        //       if (stockModel.success == true) {
        //         return Container(
        //             child: Padding(
        //                 padding: const EdgeInsets.all(0.0),
        //                 child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: <Widget>[
        //
        //                       Container(
        //                           color: ColorUtility().colorReportHead,
        //                           child: Row(
        //                               crossAxisAlignment: CrossAxisAlignment.start,
        //                               children: <Widget>[
        //
        //
        //                               ]
        //                           )
        //                       ),
        //
        //                     ]
        //                 )
        //             )
        //
        //
        //         );
        //       }
        //       else{
        //         return Container();
        //       }
        //     }
        // )

      // child : TextDropdownFormField(
      //   options: ["Male", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female"],
      //   decoration: InputDecoration(
      //       border: OutlineInputBorder(),
      //       suffixIcon: Icon(Icons.arrow_drop_down),
      //       labelText: "Gender"),
      //   dropdownHeight: 120,
      // ),

      // child : GestureDetector(
      //     child : TextDropdownFormField(
      //       options: ["Male", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female"],
      //       decoration: InputDecoration(
      //           border: OutlineInputBorder(),
      //           suffixIcon: Icon(Icons.arrow_drop_down),
      //           labelText: "Gender"),
      //       dropdownHeight: 120,
      //     ),
      //   onTap: () => {
      //     print("HElloooo")
      //   },
      // ),

    //   child:DropdownButton(
    //     isExpanded: true,
    //     value: "countryname",
    //     hint: Text("Select Country"),
    //     items: countries.map((countryone){
    //       return DropdownMenuItem(
    //         child: Text(countryone), //label of item
    //         value: countryone, //value of item
    //       );
    //     }).toList(),
    //     onChanged: (value){
    //       countryname = value; //change the country name
    //       getCity(); //get city list.
    //     },
    //   ),
    //
    // ),



    // child:DropdownButton(
    //   value: "map",
    //   icon: Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: TextStyle(color: Colors.deepPurple),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.deepPurpleAccent,
    //   ),
    //   onChanged: (newValue) {
    //     setState(() {
    //       //dropdownValue = newValue;
    //     });
    //   },
    //   items: _myJson.map((Map map) {
    //     return DropdownMenuItem<String>(
    //       value: "kk",
    //       child: Text("pp"),
    //     );
    //   }).toList(),
    // )

      // child: DropdownFormField(
      //   onEmptyActionPressed: () async {},
      //     decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //         suffixIcon: Icon(Icons.arrow_drop_down),
      //         labelText: "Access"),
      //         onSaved: (dynamic str) {},
      //         onChanged: (dynamic str) {},
      //         validator: (dynamic str) {},
      //         displayItemFn: (dynamic item) => Text(
      //         item['name'] ?? '',
      //         style: TextStyle(fontSize: 16)), dropdownItemFn: (item, int position, bool focused, bool selected, dynamic Function() onTap) {
      //     return Container()
      // },
      // ),

      // child: DropdownSearch<int>(
      //   items: List.generate(50, (i) => i),
      //   popupProps: PopupProps.menu(
      //     title: Text('fit to a specific width and height'),
      //     showSearchBox: true,
      //     fit: FlexFit.loose,
      //     constraints: BoxConstraints.tightFor(
      //       width: 300,
      //       height: 300,
      //     ),
      //   ),
      // ),




     // child : Text(""+countys.toString())
    //  child : TextDropdownFormField()

    );


  }

  Future<OrderReportModel> SearchOrderReport(BuildContext context,String fromdate,String toDate,String searchUser,String orderStatus) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
       String token = await SharedPreferencesHelper.getAgent_token();
       final controller = Get.put(OrderReportController());
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
   //   Object queryParameters = {'status': '$orderStatus', 'from_date': '$fromdate', 'to_date': '$toDate', 'search': "tt"};
      Object queryParameters = {'status=$orderStatus&from_date=$fromdate&to_date=$toDate&search=$searchUser'};
    //  var request = http.Request('GET', Uri.parse('http://202.164.150.222:8000/seller_api/customer-order-report/?'+bodyString.toString()));


      var bodyString = {'status=$orderStatus&from_date=$fromdate&to_date=$toDate&search=$searchUser'};
      print(bodyString);
      print(queryParameters);
    //  var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/customer-order-report/'));
   //   var request = http.Request('GET', Uri.parse("http://202.164.150.222:8000/seller_api/customer-order-report/?status=success&from_date=12/11/2022&to_date=12/09/2022&search="));
   //   var request = http.Request('GET', Uri.parse('http://202.164.150.222:8000/seller_api/customer-order-report/?'+queryParameters.toString()));
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/customer-order-report/?status=$orderStatus&from_date=$fromdate&to_date=$toDate&search=$searchUser'));
      print(request);
     // var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/customer-order-report?/'+'status=$orderStatus'+'&from_date=$fromdate'+'&to_date=$toDate'+'&search=$searchUser'));
     // request.body = json.encode(bodyString);
      //  request.body = json.encode({"product":"$product_id","category":"$category_id","sub_category":"$sub_category_id","stk_mrp":"$stk_mrp","cur_qty":"$cur_qty","created_by":"$created_by","cancel_by":"$created_by","updated_by":"$created_by"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

 //    print("SearchOrderReport  850     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
         orderReportModel = OrderReportModel.fromJson(status);
        setState(() {
         
        });
        return  orderReportModel;

      }else{

        setState(() {
          controller.orderStatusInput.text = "";
          orderReportModel.data?.clear();
        });
         return showFaliureAlertDialog(context,errors);
      }
    }catch (e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      return showFaliureAlertDialog(context,"Some technical issues");
    }

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

  Future<void> fetchOrderStatus(BuildContext context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order/status/view/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("fetchOrderStatus  69     "+res.toString());
      
      //final status = jsonDecode(res);
      final status = jsonDecode('{"success":true, "data" : {"status":["initiated","success","failed","cancelled","order_cancelled","order_returned","pending"]},"errors":null}');
      
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;

      if(statuscode==true){
        orderStatusModel = OrderStatusModel.fromJson(status);
        // final List<String> names = <String>[
        //   'Manish',
        //   'Jitender',
        //   'Pankaj',
        //   'Aarti',
        //   'Nighat',
        //   'Mohit',
        //   'Ruchika',
        // ];
      //  orderStatusList = (orderStatusModel.data?.status).length;
        print(orderStatusModel.data?.status?.length);
        print(orderStatusModel.data?.status);
        print(orderStatusModel.data?.status?[0]);
        // print(names);
        // print(names[0]);
      //  print((orderStatusModel.data?.status.['initiated']));
        showStatusPopup(context,orderStatusModel);
      }else{
         showFaliureAlertDialog(context,errors);
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
        //System Platform Navigator pop up hide
        if (Platform.isAndroid){
            //Navigator.pop(context,true);
            Navigator.of(context,rootNavigator: true).pop();
        }else if (Platform.isIOS){
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
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) => Navigator.pop(context,true));
  }

  void showStatusPopup(BuildContext context,OrderStatusModel orderStatusModel) {
    final controller = Get.put(OrderReportController());
    showDialog(
      context: context,
     // barrierDismissible: false,
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
            child: Text('ORDER STATUS',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black))),
       // title: Text('ORDER STATUS',textAlign: TextAlign.center),
        content: Container(
          margin: EdgeInsets.all(5),
          width: double.maxFinite,  //  <------- Use SizedBox to limit width
          child: ListView.builder(
            shrinkWrap: true,  //            <------  USE SHRINK WRAP
            itemCount: orderStatusModel?.data?.status?.length,
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
                                print((((orderStatusModel?.data?.status?[index]).toString()).replaceAll("_", " ")).toTitleCase());
                                Navigator.pop(context);
                                controller.orderStatusInput.text = (((orderStatusModel?.data?.status?[index]).toString()).replaceAll("_", " ")).toTitleCase();
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
                                        new Text((((orderStatusModel?.data?.status?[index]).toString()).replaceAll("_", " ")).toTitleCase(),textAlign: TextAlign.start),
                                      ]
                                  )

                              )
                          )

                          // InkWell(
                          //   onTap: () {
                          //     print((orderStatusModel?.data?.status?[index]).toString());
                          //     Navigator.pop(context);
                          //     controller.orderStatusInput.text = (orderStatusModel?.data?.status?[index]).toString();
                          //   },
                          //   child: Text(""+(orderStatusModel?.data?.status?[index]).toString()),
                          // ),

                        ]
                    )

                )


            )
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


  void getCuurentDate(BuildContext context) {

    final controller = Get.put(OrderReportController());
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25

    controller.dateInputFrom.text = formattedDate.toString();
    controller.dateInputTo.text = formattedDate.toString();

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

}

TextStyle? headerFieldStyle(BuildContext context,Color color,double width,{ double space = .1}){
  TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * width,letterSpacing: space,color: color);
  return style;
}

TextStyle? descriptionFieldStyle(BuildContext context,Color color,double width,{ double space = .1}){
  TextStyle style = TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * width,letterSpacing: space,color: color);
  return style;
}

 String statusFomateString(String status){
  
     String currentStatus = "";
   
     currentStatus = status == "pending" ? "pending" : status == "verified" ? "verified" : 
                     status == "packed" ? "packed" : status == "dispatched" ? "dispatched" : 
                     status == "delivered" ? "delivered" : status == "order_cancelled" ? "cancelled" : status;

                    //currentStatus = status == "order_cancelled" ? "cancelled" : status;

     
    return currentStatus.replaceFirst(currentStatus[0], currentStatus[0].toUpperCase());
  }

Widget titleValueView(BuildContext context,String titile, String value,{bool alignLeft = true }){
  return Row(
    mainAxisAlignment: alignLeft == true ? MainAxisAlignment.start : MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
      height: 15,  
      margin: EdgeInsets.fromLTRB(5, 5, 5, 1),
      padding: EdgeInsets.zero,
      child: Text(titile + ": ",style: headerFieldStyle(context, Colors.black, 0.03),)),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(value,style: headerFieldStyle(context, Colors.black, 0.03),textAlign: TextAlign.justify,overflow: TextOverflow.ellipsis,))
    ],
  );
}

void showItemListing(BuildContext context ,List<Items>? items,OrderReportModel data,int index) {


  print(items?.length);
  print(items?[0].productName);
  try{

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
      //  title: Center(child: Text('ITEM LIST',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black))),
        content: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.fromLTRB(0, 3, 0, 2),
          width: double.maxFinite,

          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Container(
                  color: ColorUtility().colorAlertTop,
                  margin: EdgeInsets.all(0),
                  alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child:Text("Order Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.035,letterSpacing: .1,color: Colors.black54),textAlign: TextAlign.center,)

                ),
                Container(
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(3, 7, 5, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: ColorUtility().colorWhite,
                  ),
                  child: 
                  titleValueView(context, "Name", (data.data?[index].customerName).toString()),
                  //Text(""+data.data?[index].customerName,style: headerFieldStyle(context, Colors.black, 0.04),textAlign: TextAlign.center,maxLines: 2,),
                ),



                Container(
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(3, 3, 5, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: ColorUtility().colorWhite,
                  ),
                  child: 
                    //" Manu Prabakar \n Near Manachira Squre, \n Calicut, \n Manachira PO."
                    titleValueView(context, "Address", (data.data?[index].address?.address).toString().replaceAll(',', ',\n') + " \n" + (data.data?[index].address?.stateName).toString()+ " \n" + (data.data?[index].address?.countryName).toString()),
                ),

                Container(
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(3, 3, 5, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: ColorUtility().colorWhite,
                  ),
                  child: 
                  
                    titleValueView(context, "Order ID", (data.data?[index].orderId).toString()),
                ),



                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: ColorUtility().colorWhite,
                  ),
                  
                  child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 4),
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: <Widget>[
                      
                        Text("Status: "+ statusFomateString((data.data?[index].deliveryStatus).toString()),style: headerFieldStyle(context, Config.statusColor((data.data?[index].deliveryStatus).toString().replaceAll("\r\n", "")), 0.030),maxLines: 1,),
                        Spacer(),
                        Text(" "+"Date: " + Config.dateFormate((data.data?[index].createdAt).toString() + ""),style: headerFieldStyle(context, Colors.black, 0.030),maxLines: 1,)
                      ],
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: ColorUtility().colorAlertTop1,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                      ],
                    ),
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child :Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(4),
                                  child:Text("SI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                              )
                          ),
                          Expanded(
                              flex: 3,
                              child :Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(4),
                                  child:Text("PRODUCT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child :Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(4),
                                  child:Text("QTY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child :Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(4),
                                  child:Text("AMOUNT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                              )
                          )

                        ]
                    )
                ),

                Container(
                  margin: EdgeInsets.all(0),
                  child: ListView.builder(
                      shrinkWrap: true,  //            <------  USE SHRINK WRAP
                      itemCount: items?.length,
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

                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(1),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                                          ],
                                        ),
                                        child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child :Container(
                                                      color: Colors.white,
                                                      alignment: Alignment.centerLeft,
                                                      padding: EdgeInsets.all(4),
                                                      child:Text(""+(index+1).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child :Container(
                                                      color: Colors.white,
                                                      alignment: Alignment.centerLeft,
                                                      padding: EdgeInsets.all(4),
                                                      child:Text(""+(items?[index].productName).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child :Container(
                                                      color: Colors.white,
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.all(4),
                                                      child:Text(""+(items?[index].quantity).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.center,)
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child :Container(
                                                      color: Colors.white,
                                                      alignment: Alignment.centerRight,
                                                      padding: EdgeInsets.fromLTRB(4, 4, 8, 4),
                                                      child:Text(""+Config.priceFormate((items?[index].totalAmount).toString()), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.black),textAlign: TextAlign.right,)
                                                  )
                                              )

                                            ]
                                        )

                                    )


                                  ]
                              )

                          )


                      )
                  )
                ),

                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: ColorUtility().colorAlertTop,
                  margin: EdgeInsets.fromLTRB(0, 3, 7, 3),
                  child: 
                  
                  titleValueView(context, "Grand Total", Config.priceFormate((data.data?[index].grandTotal).toString()),alignLeft: false)
                  
                  // ListTile(
                    
                  //   title: Text("Grand Total"),
                    
                  //   subtitle: Text(Config.priceFormate((data.data?[index].grandTotal).toString())),
                  // ),
                )
                
              ]
          )

          //  <------- Use SizedBox to limit width

        ),
      ),
    );

  }catch(e){

  }

}








// Future<UserModel> fetchData(context) async {
//
//   try{
//     // String token = await SharedPreferencesHelper.getAgent_token();
//     // var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
//     var headers = {"Content-Type": "application/json"};
//     var request = http.Request('GET', Uri.parse('http://5d85ccfb1e61af001471bf60.mockapi.io/user'));
//     // var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/stock-report-list/'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     final res = await response.stream.bytesToString();
//
//     print("SockReportListModel  69     "+res.toString());
//     final status =jsonDecode(res);
//     return userModel = UserModel.fromJson(status);
//
//   }catch (e){
//     // return showFaliureAlertDialog(context,"Some technical issues");
//   }
//
// }