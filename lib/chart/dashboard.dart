import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import '../helper/config.dart';
import '../helper/sharedprefhelper.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class Data {
  late String categories_list;
  late String product_count_list;

}


class _MyHomePageState extends State<MyHomePage> {
  List<SalesData> chartData = [];

  Future loadSalesData() async {

    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/categorywise/chart/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("Dashboard    "+res.toString());

    final status =jsonDecode(res.toString());
    final statuscode = status['success'] as bool;



    //  final data = status['data'] as JsObject;
  //  print("Data"+name);
    print("statuscode "+statuscode.toString());

    final dynamic jsonResponse = json.decode(res.toString());
    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(SalesData.fromJson(i));
    }

  }


  @override
  void initState() {
  //  loadSalesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
            child: FutureBuilder(
                future: loadSalesData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        title: ChartTitle(text: 'CATEGORY WISE PRODUCTS COUNT'),
                        series: <ChartSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                            dataSource: chartData,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                          )
                        ]);
                  } else {
                    return Card(
                      elevation: 5.0,
                      child: Container(
                        height: 100,
                        width: 400,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Retriving JSON data...',
                                  style: TextStyle(fontSize: 20.0)),
                              Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  semanticsLabel: 'Retriving JSON data',
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blueAccent),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                })));
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['month'].toString(),
      parsedJson['sales'],
    );
  }
}