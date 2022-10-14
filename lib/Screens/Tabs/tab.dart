import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';

class PendingTab extends StatefulWidget {
  PendingTab({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  TabPageState createState() => TabPageState();
}
class GetUsers {
  int id;
  String status;
  String payment;
  double tot;

  GetUsers({
    required this.id,
    required this.status,
    required this.payment,
    required this.tot
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
      id: json['id'],
      status: json['status'],
      payment: json['payment_method'],
      tot: json['total_amount'],
      //name: json['name'],
      //email: json['email'],
      //phoneNumber: json['phone']
    );
  }
}
class TabPageState extends State<PendingTab> with SingleTickerProviderStateMixin {

  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        automaticallyImplyLeading: false,
       // title: Text('Flutter Tab'),
        bottom: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              color: Colors.white),
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Image(image: AssetImage('images/pendnglst.png')),text:"Pending"),
            Tab(icon: Image(image: AssetImage('images/return.png')),text: "Return",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
         /* Center(child: Text('Pending'),),
          Center(child: Text('Return'),),*/
          new JSONListView(

          ),
         /* new JSONListView1(

          ),*/
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('$_currentIndex'),
      ),
    );
  }

  _handleTabSelection() {
   // if (_controller.indexIsChanging) {
      setState(() {
        _currentIndex = _controller.index;
      });
  //  }
  }
}

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}
class JSONListView1 extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}
class CustomJSONListView extends State {
  List<GetUsers> usersList=[];
  List<GetUsers> usersList2=[];


  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<GetUsers>> fetchJSONData() async {

    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_pending/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    // print("getPendinglist 200     "+res.toString());
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    if(statuscode==true) {

      final jsonItems1 = json.decode(res)['data'].cast<Map<String, dynamic>>();
      usersList2 = jsonItems1.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();
      //  print("json2"+jsonItems1);
    }
    else {
      throw Exception('Failed to load data from internet'+usersList2.toString());
    }
    return usersList2;
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
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Pending List'),
      ),*/
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: usersList2 == null ? 0 : usersList2.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image(image: AssetImage('images/time.png')),
                            /* child: Image(

                              Asse("assets/images/time.png",
                              width: 300,
                              height: 300,)

                          ),
*/
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,


                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Order Id :"+
                                        usersList2[index].id.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Status :"+usersList2[index].status.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Payment :"+usersList2[index].payment.toString()),
                                  ), Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Total Amount :"+usersList2[index].tot.toString()),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


                    ),
                  );
                }
            ),
          );

/*          return ListView(
            children: snapshot.data!.map((user) => ListTile(

              title: Text(user.name),
              onTap: (){ print(user.name); },
              subtitle: Text(user.phoneNumber),

              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(user.name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            )
                .toList(),
          );*/
        },
      ),
    );
  }

}