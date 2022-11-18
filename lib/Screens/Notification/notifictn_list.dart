import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/pendings.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../Home/home_activity.dart';

void main() => runApp(Notificationlist());

class Notificationlist extends StatelessWidget {
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

class GetUsers {
  int id;
  String order;
  String user;
  String product;
  bool isread;
  /*String created;
  String fkorder;
  String fkprdct;
*/

  GetUsers({
    required this.id,
   required this.order,
    required this.user,
    required this.product,
    required this.isread,
   /* required this.created,
    required this.fkorder,
    required this.fkprdct,*/



  /*  required this.payment,
    required this.tot*/
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
      id: json['id'],
     order: json['order'],
      user: json['user'],
      product: json['product'],
      isread: json['is_read'],
      /*created: json['created_at'],
      fkorder: json['fk_order'],
      fkprdct: json['fk_product'],*/


 //    tot: json['total_amount'],
      //name: json['name'],
      //email: json['email'],
      //phoneNumber: json['phone']
    );
  }
}


class JSONListView extends StatefulWidget {
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
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order/notification/list/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
     print("data     "+res.toString());
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
      appBar: AppBar(
        backgroundColor: ColorUtility().colorAppbar,
        title: Text('Notification List'),
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
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return
            Container(

            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: usersList2 == null ? 0 : usersList2.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(

                    onTap: () =>
                       setState(() {
                         readStatus(usersList2[index].id.toString());
                         child: Icon(Icons.add);
                         CustomJSONListView createState() => CustomJSONListView();
                       }),

                      //  print("Clicked item"+usersList2[index].id.toString()),


                      child: new Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

                  child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    if (usersList2[index].isread.toString()=="false") ...[
                      Container(
                        width: 50,
                        height: 50,

                        child: Image(image: AssetImage('assets/images/notifunread.png')),

                      )
                    ] ,
                    if (usersList2[index].isread.toString()=="true") ...[
                      Container(
                        width: 50,
                        height: 50,

                        child: Image(image: AssetImage('assets/images/notifread.png')),

                      )
                    ] ,

                    // if(usersList2[index].id.toString()=="false")


                    
                  Expanded(
                  child: Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,



                  children: [
                  /*  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Id :"+
                                        usersList2[index].id.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),

                                    ),
                                  )
                                  ,*/
                  Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text("Order Id  :"+usersList2[index].order.toString()),
                  ),
                  Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text("Contact :"+usersList2[index].user.toString()),
                  ),
                  Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text("Product :"+usersList2[index].product.toString()),
                  )
                  /*,
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("User :"+usersList2[index].user.toString()),
                                  )
                                  ,
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("Product :"+usersList2[index].product.toString()),
                                  )*/
                  ],
                  ),
                  ),
                  ),
                  ],

                  ),


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

Future<String> readStatus(String id) async {
  late  bool status;
  try {
    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token="Token "+_token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order/notification/read/'+id+'/'));
    print("REQUSET"+request.toString());
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print("data status     "+res.toString());
    final status1 =jsonDecode(res);
     status = status1['success']  ;
    if(status1==true) {


      //  print("json2"+jsonItems1);
    }
    else {
      throw Exception('Failed to load data from internet'+status.toString());
    }
    return status.toString();

  } catch (e) {
    // If encountering an error, return
    return 'Error!';
  }
}
