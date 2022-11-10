import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:standard_dialogs/classes/dialog_action.dart';
import '../../Model/pendings.dart';
import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../Home/home_activity.dart';
import '../Login/login_page.dart';
import '../Login/otp_page.dart';
import '../SplashScreen/splash_screen.dart';
import '../../helper/showDialogs.dart';
void main() => runApp(Test2());


class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _MainScreenState();
}

class _MainScreenState extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorUtility().colorAppbar,

            title: const Text(""),
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
            bottom: const TabBar(tabs: [
              Tab(icon: Image(image: AssetImage('assets/images/pendnglst.png')),text:"Pending"),
              Tab(icon: Image(image: AssetImage('assets/images/return.png')),text: "Return",),

            ]),
          ),
          body: TabBarView(
            children: [
              Chkbxjson(),
              Chkbxreturn(),
            ],
          ),
        ),
      ),
    );
  }
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





class Chkbxjson extends StatefulWidget{

  @override
  _ChkbxjsonListViewState createState() => _ChkbxjsonListViewState();
}

class Chkbxreturn extends StatefulWidget{

  @override
  _ChkbxjsonreturnListViewState createState() => _ChkbxjsonreturnListViewState();
}

class _ChkbxjsonListViewState  extends State<Chkbxjson>{
  List pendings1 = [];
  bool selected = false;
  late List<bool> userStatus;

  initState(){
    checkInterNet(this.context);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    List<int> _ids = [];
    // TODO: implement build
    return Scaffold(

        body: getPending(_ids)


    );
  }

  getPending(List<int> ids) {

    return Stack(
        children: <Widget>[

          new Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height * 0.06),
              child :ListView.builder(
                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                shrinkWrap: true,
                itemCount: pendings1.length,
                itemBuilder: (context, index){
                  ids.add(pendings1[index]['id']);
                  return getPendinglist(pendings1,index);
                },
              )
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width, // <-- match_parent
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                            backgroundColor: ColorUtility().colorAppbar,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))
                        ),
                        onPressed: () {
                          print('List :  $userStatus');
                          print('List2 :'+ids.toString());

                          List<int> _ids2 = [];
                          for (var i = 0; i < userStatus.length; i++){
                            if(userStatus[i]){
                              print("Packed List 96");
                              _ids2.add(ids[i]);

                            }
                            AlertDialog(
                              title: Text("Success"),
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                              actions: [
                                ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("Close")),
                              ],
                              content: Text("Saved successfully"),
                            );

                            // ShowDialogs().showAlertDialog1(context, "TEST");
                            savePending(context,_ids2.toString());

                            print('Listin :  '+_ids2.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => DrawerActivity(
                                  //  liste: album,
                                ),
                              ),
                            );
                          }

                        },
                        child: Text('SAVE'),
                      )
                  ),

                ]
            ),
          )




        ]
    );
  }

  getPendinglist( pendings1,  index) {
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
              //  child: Image(image: AssetImage('assets/images/time.png')),
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
                          pendings1[index]['id'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Status :"+pendings1[index]['status'].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Payment :"+pendings1[index]['payment_method'].toString()),
                    ), Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("Total Amount :"+pendings1[index]['total_amount'].toString()),
                    ),


                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0,10,10,10),
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.15,
                alignment: Alignment.centerRight,
                child: Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      activeColor: ColorUtility().colorAppbar,
                      value: userStatus[index],
                      onChanged: (value) {
                        setState(() {
                          userStatus[index] = value!;

                        });
                      },
                    )
                ),
              ),
            ),
          ],
        ),


      ),
    );
  }

  Future<void> checkInterNet(context) async {
    isOnline =  await NetworkUtility().checkInternet();
    print("122   :  $isOnline");

    if(isOnline){
      getpendingList(context);
    }
    else{
      checkOnlineAlert(context);
    }
  }
  void getpendingList(context) async {
    try {

      ShowDialogs().showProgressDialog(context,"Loading....",true);

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
      print("getPendinglist 200     "+request.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      print("statuscode"+statuscode.toString());
      final errors = status['errors'] as String;
      if(statuscode==true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);
        if (items.length == 0) {
          print('List is empty11.');
          print("4542  :$errors");
          Fluttertoast.showToast(
              msg: errors.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.yellow
          );
          // showAlertDialog(context, errors.toString());
          setState(() {
            pendings1 = [];
          });
        } else {
          print("4541");
          setState(() {
            // showProgress(context,"message",false);
            //progressDialog.hide();
            userStatus = List<bool>.filled(items.length, false);
            pendings1 = items;

          });
        }



      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        setState(() {
          pendings1 = [];
        });
        Fluttertoast.showToast(
            msg: errors.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.yellow
        );
        //   showAlertDialog(context, errors.toString());
      }
    }catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      //  ShowDialogs().showAlertDialog(context, e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );;
    }
  }

}

void savePending(BuildContext context,String id) async{



  print('Test Ids :  $id');
  var _token = await SharedPreferencesHelper.getAgent_token();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = "Token " + _token;
  var headers = {'Content-Type': 'application/json', 'Authorization': token,};
  var params={"order_ids": "$id"};
  var request = http.Request('PUT', Uri.parse(Config().BASE_URL + '/seller_api/order/update/'+"?order_ids="+id));


  request.headers.addAll(headers);
  request.body = json.encode(params);

  http.StreamedResponse response = await request.send();

  print("Res1"+request.toString());




  final res = await response.stream.bytesToString();

  print("Save data     "+res.toString());
  final status = jsonDecode(res);
  final statuscode = status['success'] as bool;
  final msg = status[id]['mesaage'] as String;
  if (statuscode == true) {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );

    // ShowDialogs().showAlertDialog1(context, message);

  }
}




class _ChkbxjsonreturnListViewState  extends State<Chkbxreturn> {

  List<GetUsers> usersList2 = [];


  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<GetUsers>> fetchJSONData() async {
    var _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "Token " + _token;
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var request = http.Request(
        'GET', Uri.parse(Config().BASE_URL + '/seller_api/order/return/list/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    // print("getPendinglist 200     "+res.toString());
    final status = jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;
    if (statuscode == true) {
      final jsonItems1 = json.decode(res)['data'].cast<Map<String, dynamic>>();
      usersList2 = jsonItems1.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();
      //  print("json2"+jsonItems1);
    }
    else {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      Fluttertoast.showToast(
          msg: errors.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow
      );     // duration

      //  showAlertDialog(context, errors.toString());
    }
    return usersList2;
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
                            //  child: Image(image: AssetImage('assets/images/time.png')),
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

        },
      ),

    );
  }


}






