import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/pendings.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../Screens/Home/home_activity.dart';
import '../Screens/Login/login_page.dart';
import '../helper/showDialogs.dart';
import 'itemgrid.dart';


void main() => runApp(SaleDetails());

class SaleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
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



class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {


  String data="";
  String? todayssale="";
  String? totalsale="";
  String? totalproduct="";
  String? totalstock="";
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
    totalsale=tutorial.data?.totalSales.toString();
    totalproduct=tutorial.data?.totalProduct.toString();
    totalstock=tutorial.data?.totalStock.toString();
    print(tutorial.data?.todaySales.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtility().colorAppbar,
        title: Text('Sale Details'),
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
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => SaleDetails(
                      //  liste: album,
                    ),
                  ),
                );
*/

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
        Container(
          child:Card(
            child: InkWell(
              onTap: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => SaleDetails(
                      //  liste: album,
                    ),
                  ),
                );
*/

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Sale'),
                        Text(totalsale!),
                      ],
                    ),
                    trailing:CircleAvatar(backgroundImage:AssetImage('assets/images/totalsales.png')) ,
                  ),

                ],
              ),
            ),
          ),

        ),
        Container(
          child:Card(
            child: InkWell(
              onTap: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => SaleDetails(
                      //  liste: album,
                    ),
                  ),
                );
*/

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Product'),
                        Text(totalproduct!),
                      ],
                    ),
                    trailing:CircleAvatar(backgroundImage:AssetImage('assets/images/totalproduct.png')) ,
                  ),

                ],
              ),
            ),
          ),

        ),
        Container(
          child:Card(
            child: InkWell(
              onTap: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => SaleDetails(
                      //  liste: album,
                    ),
                  ),
                );
*/

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Stock'),
                        Text(totalsale!),
                      ],
                    ),
                    trailing:CircleAvatar(backgroundImage:AssetImage('assets/images/totalstock.png')) ,
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


