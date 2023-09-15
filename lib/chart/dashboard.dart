import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neo/Model/dash_pie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/pendings.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../Screens/Home/home_activity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Screens/Login/login_page.dart';
import '../helper/showDialogs.dart';
import 'itemgrid.dart';
import 'package:intl/intl.dart';


void main() => runApp(Dashboard());



class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Chart Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


Griddetails griddetailsFromJson(String str) => Griddetails.fromJson(json.decode(str));

String griddetailsToJson(Griddetails data) => json.encode(data.toJson());

class Griddetails {
  Griddetails({
    this.success,
    this.data,
    this.errors,
  });

  bool? success;
  Data? data;
  dynamic? errors;

  factory Griddetails.fromJson(Map<String, dynamic> json) => Griddetails(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "errors": errors,
  };

  @override
  String toString() {
    return '{ ${this.success}, ${this.data}, ${this.errors} }';
  }
}

class Data {
  Data({
    this.totalProduct,
    this.totalStock,
    this.totalSales,
    this.todaySales,
  });

  int? totalProduct;
  int? totalStock;
  double? totalSales;
  int? todaySales;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalProduct: json["total_product"],
    totalStock: json["total_stock"],
    totalSales: json["total_sales"],
    todaySales: json["today_sales"],
  );

  Map<String, dynamic> toJson() => {
    "total_product": totalProduct,
    "total_stock": totalStock,
    "total_sales": totalSales,
    "today_sales": todaySales,
  };
  @override
  String toString() {
    return '{ ${this.totalProduct}, ${this.totalStock}, ${this.totalSales}, ${this.todaySales} }';
  }

}


class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class Datas {
  late String categories_list;
  late String product_count_list;

}

class ChartData{

  ChartData(this.x,this.y,[this.color]);
  final String x;
  final double y;
  final Color? color;
  
}


class _MyHomePageState extends State<MyHomePage> {
  //List<ChartData> chartData = [];
      List<SalesData> saleData = [];
      String total_sales = "";
      String total_product = "";
      String sales_value = "";
      String start_date = "";
      String end_date = "";
      
      List<String> infoList = ['1','2','3','4'];
      final startDateController = TextEditingController();
      final endDateController = TextEditingController();

  ProfitWiseModel modelInfo = ProfitWiseModel();

  Future<void> topViewApiDetails() async {

    await totalSaleApi();
    await totalProductsApi();
    await stockValueApi();

  }

  Future<dynamic> dateFilterApi() async {

    try{

      var _token = await SharedPreferencesHelper.getAgent_token();

       print("TOKEN  547   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('POST', Uri.parse(Config().BASE_URL+'/customer_api/date_range_post/'));
    request.body = json.encode({"start": "$start_date", "end": '$end_date'});
    print('{"start": $start_date, "end": $end_date}');
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("date wise filter    "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;

    if(statuscode==true) {

    

     setState(() {
       start_date = "";
       end_date = ""; 
       startDateController.text = "";
       endDateController.text = "";
     });

    }else{

      print("errors "+errors.toString());
    }

    }catch(e){

      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());

    }

  }

  Future<dynamic> totalSaleApi() async {
    try {

      var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/total_sales/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("totalSaleApi    "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;

    if(statuscode==true) {

       dynamic final_data = status['final_data'];


      total_sales = Config.priceFormate((final_data['total_sales']).toString());

      

    }else{

      print("errors "+errors.toString());
    }
      
    }
    catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }

  Future<dynamic> totalProductsApi() async {
    try {

       var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/total_products/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("totalSaleApi    "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;

    if(statuscode==true) {

      dynamic data = status['data'];


      total_product = data.toString();

      

    }else{

      print("errors "+errors.toString());
    }
       
    }
    catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }

  Future<dynamic> stockValueApi() async {
    try {

       var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/stock_value/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("stockValueApi    "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;

    if(statuscode==true) {

      totalProductsApi();

      dynamic final_data = status['data'];

      sales_value = Config.priceFormate((final_data).toString());

    }else{

      print("errors "+errors.toString());
    }
       
    }
    catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }




  Future<dynamic>loadSalesData() async {

   try{

     var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/prowise_sales/'));
    print("URL :  " + Config().BASE_URL+'/prowise_sales/');
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("Dashboard    "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
     final errors = status['errors'] as String;
    
      if(statuscode==true) {
      

      final dynamic jsonResponse = json.decode(res.toString());

      print(jsonResponse);

       
       modelInfo = ProfitWiseModel.fromJson(status);
       
       saleData = [];
       var infolist = modelInfo.final_data;
        
       infolist?.prod_name.asMap().forEach((index, value) {
        
        saleData.add(SalesData((infolist.prod_name[index]).toString(), infolist.prod_sale[index]));
        print("index - $index && value = $value");

       });
      
      return modelInfo;
      }
      else{

        //showFaliureAlertDialog(context, errors.toString());
         ShowDialogs().showAlertDialog(context, errors.toString());
         String errorUrl = Config().BASE_URL+'/prowise_sales/';
         print("error url: $errorUrl");
      }

      


    //  final data = status['data'] as JsObject;
  //  print("Data"+name);
    print("statuscode "+statuscode.toString());

   

   }catch(e){

      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
   }

  }


  @override
  void initState() {
    //loadSalesData();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: ColorUtility().colorAppbar,
          leading: IconButton(
            onPressed: () {
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
        body: 

        ListView.builder(itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: EdgeInsets.only(top: 2,bottom: 2,left: 5,right: 5),
            child: 
            Column(
              children: <Widget>[
                
                 topView_Widget(context,index,color: ColorUtility().colorWhite),
                 
              ],
            ),
            );
          },
          itemCount: 3,
        )


        
        
        // Center(
        //     child: FutureBuilder(
        //         future: loadSalesData(),
        //         builder: (context, snapshot) {
        //           if (modelInfo.data != null) {
        //             return SfCartesianChart(
        //                 primaryXAxis: CategoryAxis(),
        //                 // Chart title
        //                 title: ChartTitle(text: 'CATEGORY WISE PRODUCTS COUNT'),
        //                 series: <ChartSeries>[
        //                   LineSeries<ChartData, String>(
        //                     dataSource: chartData,
        //                     xValueMapper: (ChartData sales, _) => sales.x,
        //                     yValueMapper: (ChartData sales, _) => sales.y,
        //                   )
        //                 ]);
        //           } else {
        //             return Card(
        //               elevation: 5.0,
        //               child: Container(
        //                 height: 100,
        //                 width: 400,
        //                 child: Center(
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Text('Retriving JSON data...',
        //                           style: TextStyle(fontSize: 20.0)),
        //                       Container(
        //                         height: 40,
        //                         width: 40,
        //                         child: CircularProgressIndicator(
        //                           semanticsLabel: 'Retriving JSON data',
        //                           valueColor: AlwaysStoppedAnimation<Color>(
        //                               Colors.blueAccent),
        //                           backgroundColor: Colors.grey[300],
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //           }
        //         }
        //         )
        //     )
    );
  }

  Widget profitChartContainer(BuildContext context,{double height = 400}){
       return  FutureBuilder<dynamic>(
        future: loadSalesData(),
        builder: (context, snapshot) {
          if (saleData.length > 0){
             return Container(
                      
                      width: double.infinity,
                      height: height,
                      margin: EdgeInsets.all(8),
                      child:    
                      SfCartesianChart(
                        enableAxisAnimation: true,
                        plotAreaBorderWidth: 0,
                        title: ChartTitle(text: "PROFIT",textStyle: TextStyle(color:ColorUtility().colorAppbar,fontWeight: FontWeight.w700)),
                        primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
                 legend: Legend(isVisible: true,backgroundColor: Colors.white70,position: LegendPosition.bottom),
              series: <ChartSeries>[
                ColumnSeries<SalesData,String>(
                  
                  dataSource: saleData,
                  //isTrackVisible: true,
                  isVisibleInLegend: true,
                  color: ColorUtility().colorSubHeaderText, 
                  enableTooltip: true,
                  //pointColorMapper: (SalesData data, _) => data.color, 
                  xValueMapper: (SalesData data, _) => data.product_name,
                  yValueMapper: (SalesData data, _) => data.sales,
                  //pointColorMapper: (SalesData data, _) => data.color,
                
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    showZeroValue: false,
                    //color: ColorUtility().colorAppbar,
                    //angle: -90
                    
                    
                  ),
                  
                )
              ]
            ),
           );
          }else{
              return  Center(child: Text('Please wait its loading...'));
          }
        },
          
       );
  }



  Widget topInnerContainer(BuildContext context,String title,String value,{Color color = Colors.blueAccent,double edgeTop = 0,double edgeBottom = 0,double edgeLeft = 2,double edgeRight = 2,double height = 100}){
       return Flexible(
         child: Container(
           height: height,
            
             // padding: EdgeInsets.only(left: 2,right: 5),
              margin: EdgeInsets.only(left: edgeLeft,right: edgeRight,top: edgeTop,bottom: edgeBottom),
              padding: EdgeInsets.only(left: 12,right: 12),       
              //color: color,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorUtility().colorWhite,
                  width: 0.35
                ),
              color: ColorUtility().colorAppbar,
              
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
              ),
           boxShadow: [
                    // BoxShadow(
                    //   color: Colors.white, //New
                    //   spreadRadius: 1,
                    // )
                      ],
           ),
              child: Center(
              child: topSaleDetailsContainer(context, title, value)),
              
          ),
       );
       
  }

  Widget topSaleDetailsContainer(BuildContext context,String title,String value){
     return Container(
      height: 45,
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(title,style: TextStyle(color: ColorUtility().colorWhite,fontSize: 15,fontWeight: FontWeight.w900),)),
          ),
          Container(
            height: 20,
            child: Text(value,style: TextStyle(color: ColorUtility().colorWhite,fontSize: 12,fontWeight: FontWeight.w400),),
          ),
        ],
      ),
     );
  }

  Widget chartCalenderSelectContainer(BuildContext context){
    return Container(
        
        width: double.infinity,
        decoration: BoxDecoration(

          border: Border.all(
            width: 3,
            color: ColorUtility().colorAppbar

          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.fromLTRB(12, 10, 10, 12),
        height: 50,

        child: MaterialButton(
          onPressed: () {

            showModalBottomSheet<void>(context: context,
             builder: (BuildContext context){
             return Container(
              height: 350,
              color: ColorUtility().colorWhite,
              

              child: Center(
                child: dateItemContainer(context),
              ),

               );
              }
            
             );
            
          },
          child: Text("Select Date",style: TextStyle(color: ColorUtility().colorAppbar,fontSize: 15,fontWeight: FontWeight.w600),),
        ),
        
    );
  }

  Widget dateItemContainer(BuildContext context){
    return Container(
       height: 340,
       margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
       width: double.infinity,
       color: ColorUtility().colorWhite,
      
       child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                       Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                            height: 2,
                            margin: EdgeInsets.only(right: 15),
                            color: ColorUtility().colorAppbar,
                            )
                          ),
                          Expanded(child: 
                          Center(child: Text(" Select Period ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: ColorUtility().colorAppbar),))
                          ),
                          
                          Expanded(child: 
                          Container(
                            height: 2,
                            margin: EdgeInsets.only(left: 15),
                            color: ColorUtility().colorAppbar,
                          )
                          )

                        ],
                      ),

                      SizedBox(height: 10,),

                      

                      Row(
                      
                        children: <Widget>[
                        
                        dateButtonContainer(context, "Today"),
                        SizedBox(width: 11,),
                        dateButtonContainer(context, "Yesterday"),
                          
                          
                        ],

                    
                      ),

                      Row(
                      
                        children: <Widget>[
                        
                        dateButtonContainer(context, "Last 7 Days"),
                        SizedBox(width: 11,),
                        dateButtonContainer(context, "Last 30 Days"),
                          
                          
                        ],
                      ),

                      Row(
                      
                        children: <Widget>[
                        
                        dateButtonContainer(context, "This Month"),
                        SizedBox(width: 11,),
                        dateButtonContainer(context, "Last Month"),
                          
                          
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                            height: 2,
                            color: ColorUtility().colorAppbar,
                            )
                          ),
                          Expanded(child: 
                          Center(child: Text("Custom Range",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: ColorUtility().colorAppbar),))
                          ),
                          
                          Expanded(child: 
                          Container(
                            height: 2,
                            margin: EdgeInsets.only(left: 15),
                            color: ColorUtility().colorAppbar,
                          )
                          )

                        ],
                      ),

                      SizedBox(height: 15,),

                      Row(
                         children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(0.5),
                              decoration: BoxDecoration(
                                color: ColorUtility().colorWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorUtility().colorAppbar,
                                  width: 2
                                ),
                              ),
                              //color: Colors.redAccent,
                              child: TextField(
                                controller: startDateController,
                                onTap: () async {

                                  DateTime? startPickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100)
                                    );

                                    if (startPickedDate != null){
                                        print(startPickedDate);

                                        setState(() {
                                          startDateController.text = Config.dateFormate(startPickedDate.toString());
                                          String fromDate = startDateController.text;
                                          start_date = Config.apiConvertedDateFormate(fromDate);
                                          print('date 1: ' + start_date );

                                        });
                                    }else{

                                    }

                                    
                                },
                                readOnly: true,
                              decoration: 
                              InputDecoration(
                                 border: InputBorder.none,
                                  hintText: 'Select Start Date',
                                  ),
                                   textAlign: TextAlign.center,
                                  ),
                            )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(0.5),
                              decoration: BoxDecoration(
                                color: ColorUtility().colorWhite,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorUtility().colorAppbar,
                                  width: 2
                                ),
                              ),
                              child: TextField(
                                controller: endDateController,
                                onTap: () async {
                                  DateTime? endPickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100)
                                    );

                                    if (endPickedDate != null){
                                        print(endPickedDate);

                                        setState(() {
                                          endDateController.text = Config.dateFormate(endPickedDate.toString());
                                          String toDate = endDateController.text;
                                           end_date = Config.apiConvertedDateFormate(toDate);
                                           print('date 2: ' + end_date );

                                        });
                                    }else{

                                    }

                                    
                               

                                  
                                },
                                readOnly: true,

                              decoration: 
                              InputDecoration(
                              
                                 border: InputBorder.none,
                                
                                  hintText: 'Select End Date',
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                            )
                          ),
                         ],
                      ),
                      
                      SizedBox(height: 10,),

                      Container(
                        height: 45,
                        child: Row(
                      
                          children: <Widget>[
                      
                            Expanded(
                            
                               child: ElevatedButton(
                              
                               onPressed: 
                               () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                             backgroundColor: ColorUtility().colorAppbar,
                             ),
                            
                          child: Text("Cancel")
                          ),
                          ),
                      
                          SizedBox(width: 11,),
                      
                          Expanded(
                            
                               child: ElevatedButton(
                              
                               onPressed: 
                               (){
                                   

                                  Navigator.pop(context); 

                                  if (start_date.length == 0  || end_date.length == 0){

                                    Future.delayed(Duration(microseconds: 500),(){
                                    validateMessage(context, start_date.length == 0 ? "Start Date  cannot be blank" : "End Date  cannot be blank");
                                    });

                                    

                                  }else{
                                    

                                  Future.delayed(Duration(microseconds: 500),(){

                                  dateFilterApi();
                                   });

                                  }


                               },
                              style: ElevatedButton.styleFrom(
                             backgroundColor: ColorUtility().colorAppbar,
                             ),
                            
                          child: Text("Ok")
                          ),
                          ),
                      
                           
                          ],
                        ),
                      )
                    ],
                  ),

      
    );
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

  Widget dateButtonWidget(BuildContext context,String title,{double height = 40}){
    return Flexible(child: 
    Container(
      width: double.infinity,
      height: height,
      child: Center(
        child: dateButtonContainer(context, title)
      ),
     )
    );
  }

  Widget dateButtonContainer(BuildContext context,String title){
    List<String> dateList = [];
    return Expanded(
    
      child: ElevatedButton(
        
        onPressed: (){

          print(title);
          Navigator.pop(context);
          switch(title){
            
            case 'Today' : 
            dateList = Config.dateCalculateFromDays(0);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
            Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;

            case 'Yesterday' : 
            dateList = Config.dateCalculateFromDays(1);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
             Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;

            case 'Last 7 Days' :
            dateList = Config.dateCalculateFromDays(6);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
             Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;

            case 'Last 30 Days' :
            dateList = Config.dateCalculateFromDays(30);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
             Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;

            case 'This Month' :
            dateList = Config.dateCalcutateByMonth(0);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
             Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;

            case 'Last Month' :
            dateList = Config.dateCalcutateByMonth(1);
            start_date = Config.apiConvertedDateFormate(dateList[0]);
            end_date = Config.apiConvertedDateFormate(dateList[1]);
            Future.delayed(Duration(microseconds: 500),(){
               dateFilterApi();
            });
            break;
 
          }

          setState(() {
            startDateController.text = "";
            endDateController.text = "";
            


          });
    
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtility().colorAppbar,
      ),
      
       child: Text(title)
      ),
    );
  }

  

  Widget dateDropDownContainer(BuildContext context, List<String> dateList){
     return Center(
       child: DropdownButton<dynamic>(
        items: dateList
            .map((string) => DropdownMenuItem(
                  child: Center(
                    child: Text(
                      string,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ))
            .toList(), 
        
        onChanged: (value) { 

         },
         ),
     );
  }

  Widget topView_Widget(BuildContext context,int index,{ Color color = Colors.redAccent,double height = 224}){
    double screen_width = MediaQuery.of(context).size.width - 4;
    return 

    index == 0 ?
    
    FutureBuilder<dynamic>(
      
      future: topViewApiDetails(),
      builder: (context, snapshot) {
       return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [color,Colors.white70])
      ),
      child: Column(
        children: <Widget>[
           Container(
            child: Row(
              children: <Widget>[
                topInnerContainer(context, total_sales == "" ? "Loading.." : "₹ " + total_sales, "Total Sales",color: ColorUtility().colorWhite,edgeTop: 8,edgeLeft: 8,edgeRight: 4),
                topInnerContainer(context, total_product == "" ? "Loading.." : total_product, "Total Products",color: ColorUtility().colorWhite,edgeTop: 8,edgeLeft: 4,edgeRight: 8),
              ],
            ),
           ),
           Container(
            child: topInnerContainer(context, sales_value == "" ? "Loading.." : "₹ " + sales_value, "Stock Value",color: ColorUtility().colorWhite,edgeTop: 8,edgeBottom: 8,edgeLeft: 8,edgeRight: 8),
           )
        ],
      ),
    );
      },
      

    )

    : index == 1 ?


    chartCalenderSelectContainer(context)

    :

    profitChartContainer(context);


  }
  
}

class ChartParsedModel{

  bool? success;
  ChartDataModel? data;
  dynamic error;
  
  ChartParsedModel({
    this.success,
    this.data,
    this.error
  }){
    success = success;
    data = data;
    error = error;
  }

  factory ChartParsedModel.fromJson(Map<String,dynamic> json) => ChartParsedModel(
        success: json["success"],
        data: ChartDataModel.fromJson(json["data"]),
        error: json["error"],
  );

}


// key:
// "data"
// value:
// Map (4 items)
// 0:
// "categories_list" -> List (7 items)
// 1:
// "product_count_list" -> List (7 items)
// 2:
// "days" -> List (7 items)
// 3:
// "sales" -> List (7 items)

class ChartDataModel{

List<dynamic>? categories_list;
List<dynamic>? product_count_list;
List<dynamic>? days;
List<dynamic>? sales;

ChartDataModel({
  this.categories_list,
  this.product_count_list,
  this.days,
  this.sales
}){
  categories_list = categories_list;
  product_count_list = product_count_list;
  days = days;
  sales = sales;
}

factory ChartDataModel.fromJson(Map<String,dynamic> json) => ChartDataModel(
  categories_list: json["categories_list"] == null ? [] : json["categories_list"].toList(),
  product_count_list: json["product_count_list"] == null ? [] : json["product_count_list"].toList(),
  days: json["days"] == null ? [] : json["days"].toList(),
  sales: json["sales"] == null ? [] : json["sales"].toList(),
);

   

}

class SalesData {
  SalesData(this.product_name, this.sales,[this.color]);
 
  final String product_name;
  final double sales;
  final Color? color;

  // factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
  //   return SalesData(
  //     parsedJson['month'].toString(),
  //     parsedJson['sales'],
  //   );
  // }
}



class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {


  String data="";
  String? todayssale="";
  String? json="";
  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<String?> fetchJSONData() async {
    try {
      var _token = await SharedPreferencesHelper.getAgent_token();
      print("TOKEN  546   :  $_token");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token="Token "+_token;
      var headers = {'Content-Type': 'application/json', 'Authorization': token,};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/dashboardgridcount/'));
      // request.body = json.encode({});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();
      print("data     "+res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      json=res.toString();
      if(statuscode==true) {

      }
      else{

        showFaliureAlertDialog(context, errors.toString());
      }

    }
    catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
    return json!;

    /* var jsonResponse = await http.get( Uri.parse(apiURL));

    if (jsonResponse.statusCode == 200) {
   //   print("json"+jsonResponse.body);
      final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
     //

       usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();
   //
      return usersList;

    } else {
      throw Exception('Failed to load data from internet'+usersList.toString());
    }*/
  }

  @override
  Widget build(BuildContext context) {

    fetchJSONData().then((result) {
      setState(() {
        data=result!;


      });
    });
    Griddetails tutorial = Griddetails.fromJson(jsonDecode(data));
    String results=data;
    todayssale=tutorial.data?.todaySales.toString();
    print(tutorial.data?.todaySales.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtility().colorAppbar,
        title: Text('Dashboard'),
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

      ),
    /*  body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             ListTile(
                // leading: ImageIcon(AssetImage('assets/images/todyssales.png')),

               title: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Text('Todayssale'),
                    Text(todayssale!),
                 ],
               ),

                 trailing:CircleAvatar(backgroundImage:AssetImage('assets/images/todyssales.png')) ,

             ),
           ],
         ),
      ),*/
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              onTimeComp(context),
            ],
          ),
        ],
      ),
    );
  }
  

  Widget onTimeComp(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      padding: EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 0),
    child: Column(children: <Widget>[
      Container(
      child:Card(
        child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => SaleDetails(
                //  liste: album,
              ),
            ),
          );


        },
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          ListTile(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Todayssale'),
            Text(todayssale!),
          ],
      ),
            trailing:CircleAvatar(backgroundImage:AssetImage('assets/images/todyssales.png')) ,
         ),

            ],
      ),
        ),
    ),
        ),
    ]),
    );

}

}


