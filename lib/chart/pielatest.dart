import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper/config.dart';
import '../helper/sharedprefhelper.dart';

CategoriesCount categoriescountfromjson(String str) =>
    CategoriesCount.fromJson(json.decode(str));

String categoriescounttojson(CategoriesCount data) =>
    json.encode(data.toJson());


class PieModel {
  bool? success;
  Data? data;
  Null? errors;

  PieModel({this.success, this.data, this.errors});

  PieModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  CategoriesCount? categoriesCount;
  DailySalesCount? dailySalesCount;
  List<String>? categoriesList;
  List<int>? productCountList;
  List<String>? days;
  List<int>? sales;

  Data(
      {this.categoriesCount,
        this.dailySalesCount,
        this.categoriesList,
        this.productCountList,
        this.days,
        this.sales});

  Data.fromJson(Map<String, dynamic> json) {
    categoriesCount = json['categories_count'] != null
        ? new CategoriesCount.fromJson(json['categories_count'])
        : null;
    dailySalesCount = json['daily_sales_count'] != null
        ? new DailySalesCount.fromJson(json['daily_sales_count'])
        : null;
    categoriesList = json['categories_list'].cast<String>();
    productCountList = json['product_count_list'].cast<int>();
    days = json['days'].cast<String>();
    sales = json['sales'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesCount != null) {
      data['categories_count'] = this.categoriesCount!.toJson();
    }
    if (this.dailySalesCount != null) {
      data['daily_sales_count'] = this.dailySalesCount!.toJson();
    }
    data['categories_list'] = this.categoriesList;
    data['product_count_list'] = this.productCountList;
    data['days'] = this.days;
    data['sales'] = this.sales;
    return data;
  }


}

class CategoriesCount {
  int? goods;
  int? bank;
  int? retailer;

  CategoriesCount({this.goods, this.bank, this.retailer});


/*  factory CategoriesCount.fromJson (Map<String,dynamic>json){
    return CategoriesCount(goods: json['goods'],
        bank: json['bank'],
        retailer: json['Retailer']);
  }*/

  CategoriesCount.fromJson(Map<String, dynamic> json) {
    goods = json['goods'];
    bank = json['bank'];
    retailer = json['Retailer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods'] = this.goods;
    data['bank'] = this.bank;
    data['Retailer'] = this.retailer;
    return data;
  }


}

class DailySalesCount {
  int? i08Nov;
  int? i07Nov;
  int? i06Nov;
  int? i05Nov;
  int? i04Nov;
  int? i03Nov;
  int? i02Nov;

  DailySalesCount(
      {this.i08Nov,
        this.i07Nov,
        this.i06Nov,
        this.i05Nov,
        this.i04Nov,
        this.i03Nov,
        this.i02Nov});

  DailySalesCount.fromJson(Map<String, dynamic> json) {
    i08Nov = json['08-Nov'];
    i07Nov = json['07-Nov'];
    i06Nov = json['06-Nov'];
    i05Nov = json['05-Nov'];
    i04Nov = json['04-Nov'];
    i03Nov = json['03-Nov'];
    i02Nov = json['02-Nov'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['08-Nov'] = this.i08Nov;
    data['07-Nov'] = this.i07Nov;
    data['06-Nov'] = this.i06Nov;
    data['05-Nov'] = this.i05Nov;
    data['04-Nov'] = this.i04Nov;
    data['03-Nov'] = this.i03Nov;
    data['02-Nov'] = this.i02Nov;
    return data;
  }
}
void main() {
  runApp(PieCht1());
}
class PieCht1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: Pie(),
    );
  }
}
class Pie extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}
class _PieState extends State<Pie> {

  final Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  late String jsonString = "";
  late CategoriesCount _categoriesCount;

  Future<String>_getData() async {
    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "Token " + _token;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var request = http.Request('GET',
        Uri.parse(Config().BASE_URL + '/seller_api/categorywise/chart/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    jsonString=res.toString();


    Map<String, dynamic> jsonData =
    json.decode(jsonString) as Map<String, dynamic>;

    // final statuscode = status['success'] as bool;
    // jsonString = res.toString();
    //print("getPchart      "+res.toString());
    return jsonString;
    print("pies"+jsonString);

    /*  if (statuscode == true) {

    }*/
  }


  @override
  void initState() {

    super.initState();
    getjson();







     // var category = tagsJson['categories_count'];
     // final List<String> ctgryList = new List<String>.from(category);
     // print("CATEGORY"+tagsJson);
    /*  */


  /*  */


  }

  Future getjson() async {
   /* jsonString = await _getData();
    print("jsons"+jsonString);*/
   /* jsonString = (await _getData()) as String;


    final jsonResponse = json.decode(jsonString);
    PieModel shape = new PieModel.fromJson(jsonResponse);

    print("Datas"+shape.data.toString());*/
    jsonString = '''{
       "goods": 0,
            "bank": 1,
            "Retailer": 2
    }
    ''';
    _categoriesCount = categoriescountfromjson(jsonString);
    dataMap.putIfAbsent(
        "goods", () => _categoriesCount.goods!.toDouble());
    dataMap.putIfAbsent("bank", () => _categoriesCount.bank!.toDouble());
    dataMap.putIfAbsent(
        "Retailer", () => _categoriesCount.retailer!.toDouble());
  }


  @override
  Widget build(BuildContext context) {


  //_getData();


    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
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
    // _getData();
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      padding: EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 0),
      color: Colors.lightBlue[100],
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text("CATEGORY WISE PRODUCTS COUNT",
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery
                      .of(context)
                      .size
                      .width / 2.7,
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  showChartValuesOutside: false,
                  chartValueBackgroundColor: Colors.grey[200],
                  colorList: colorList,
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                  decimalPlaces: 1,
                  showChartValueLabel: true,
                  initialAngle: 0,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                      color: Colors.blueGrey[900]!.withOpacity(0.9)),
                  chartType: ChartType.disc,
                )),
          ],
        ),
      ]),
    );
  }


}
