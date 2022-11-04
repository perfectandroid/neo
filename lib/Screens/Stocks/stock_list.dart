import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/Screens/Stocks/edit_stock.dart';
import 'package:neo/Screens/Stocks/report_stock.dart';

import '../../helper/colorutility.dart';

class StockList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StockList();
  }
}

class _StockList extends State<StockList>{

  @override
  initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.receipt_long_rounded),text: 'Report'),
                Tab(icon: Icon(Icons.border_color_outlined),text: 'Edit'),

              ],
            ), // TabBar
            title: const Text('Stock',textAlign: TextAlign.center),
            backgroundColor: ColorUtility().colorAppbar,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context,true);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ), // AppBar
            body: TabBarView(
              children: [
                ReportStock(),
               // EditStock(id: '',),
              ],
            ),
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }



}