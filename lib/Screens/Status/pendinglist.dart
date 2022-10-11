import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:neo/Screens/Login/mpin_verification_page.dart';
import 'dart:convert';
import 'package:neo/Screens/WelcomeSlider/welcomeintroslider.dart';
import 'package:neo/helper/colorutility.dart';
import 'package:neo/helper/config.dart';
import 'package:neo/helper/showDialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../Home/home_activity.dart';

bool isOnline = false;
class PendingScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _PendingScreen();
  }
}




class User {
  String id ="";
  String status ="";
  String deliverystatus ="";
  String totalamt ="";



  User(this.id, this.status, this.deliverystatus, this.totalamt);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    deliverystatus = json['delivery_status'];
    totalamt = json['grand_total'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['delivery_status'] = this.deliverystatus;
    data['grand_total'] = this.totalamt;

    return data;
  }
}

class _PendingScreen extends State<PendingScreen>{
  @override
  var _token="";
  initState(){

    super.initState();
    checkInterNet(this.context);
    getToken();



  }
  /* getAgent_token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token')??'');
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* body:
      Center(
          child: FutureBuilder <List<User>>(
            future: getPendingList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> data = snapshot.data;
                return
                  ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 75,
                          color: Colors.white,
                          child: Center(child: Text(data[index].status),
                          ),);
                      }
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },

          );
      ),*/

    );
  }
  Future<void> checkInterNet(context) async {
    isOnline =  await NetworkUtility().checkInternet();
    print("122   :  $isOnline");

    if(isOnline){


      getPendingList(context);
    }
    else{

      checkOnlineAlert(context);
    }

  }
  Future<void> getPendingList(context) async {

    // Future<User> getPendingList() async{
    // Future<User> getPendingList() async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //  var token = await prefs.getString('intValue') ?? 0;
      // _token = await SharedPreferencesHelper.getAgent_token();
      var token="Token "+_token;

      var headers = {'Content-Type': 'application/json', 'Authorization': token,};

      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_pending/'));
      // request.body = json.encode({});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getPendinglist 200     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;

      if(statuscode==true) {


        /*    var maintain = status['data'] as List;
        var image = maintain[0]['image'] ??
            (throw ArgumentError("image is required"));
        var description = maintain[0]['description'] ??
            (throw ArgumentError("description is required"));
        print('157   :  $statuscode');
        var maintain_type = maintain[0]['maintain_type'] ??
            (throw ArgumentError("maintain_type is required"));*/
        /*  if(maintain_type == '0'){
          print("1671   : $maintain_type");

          getReseller(context);

        }
        else if(maintain_type == 1) {
          print("1672   : $maintain_type");
          openCustomDialogClose(context,image,description,maintain_type);
        }
        else{
          openCustomDialog(context,image,description,maintain_type);
        }

      } else{
        //  print("FALSE  123     ");
        ShowDialogs().showAlertDialog(context, status['errors'] as String);
      }*/
      }
    }catch(e) {
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }
  void checkOnlineAlert(context) {
    print('openCustomDialog  174   :');
    bool visibilityTag = false;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),

            content: Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0.0),
                      child:SizedBox(
                          height:100,width:100,
                          // child:Image.asset("assets/images/logo.png")
                          child:Image.asset("assets/images/wifi_router.png")

                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10,20,10,0),
                        child:SizedBox(
                          child: Text(Config().msg_check_internet,textAlign: TextAlign.center,),
                        )

                    ),


                    Container(
                        height: 50,
                        width: double.infinity,
                        margin: new EdgeInsets.fromLTRB(0, 30, 0, 25),
                        child:Row(
                            children:<Widget>[
                              Expanded(
                                flex: 5,
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.of(context).pop();
                                      SystemNavigator.pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:ColorUtility().colorNo,
                                      fixedSize: Size(100, 40),
                                    ),
                                    child: Text(
                                      "Close",
                                    ),
                                  ),
                                ),
                              ),



                              Expanded(
                                flex: 5,
                                child: Center(
                                    child: Visibility(
                                        visible: true,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            // checkInterNet(context);
                                            Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new PendingScreen()),);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: ColorUtility().colorYes,
                                            fixedSize: Size(100, 40),
                                          ),
                                          child: Text(
                                            "Retry",
                                          ),
                                        ))

                                ),
                              )
                            ]
                        )

                    )






                  ],
                ),
              ),
            ),
          );
        });


  }
  Future<void> getToken() async {
    _token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN  546   :  $_token");

    // await SharedPreferencesHelper.logout();
  }
}
















