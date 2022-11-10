import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/Model/user_model.dart';
import 'package:neo/Screens/Home/home_activity.dart';

import '../../helper/colorutility.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class OrderReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderReport();
  }

}


class _OrderReport extends State<OrderReport>{
  // bool _isLoading=false; //bool variable created
  Future<UserModel>? futureAlbum;
  UserModel userModel = UserModel();

  @override
  initState(){
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
                          builder: (context) => new DrawerActivity()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


            body: Center(child : getBody())


        )
    );


  }

  Widget getBody(){
    return Stack(

        children: <Widget>[
          Container(
              child: Padding(
                padding: const EdgeInsets.all(2),
                // child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       filterScreen(context)
                //     ]
                // )
                //
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
            builder: (context) => new DrawerActivity()
        ),
            (route) => false
    )) ??
        false;
  }



  Widget filterScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/5,
       child : Card(
            elevation: 1,
            shadowColor: Colors.black,
            color: Colors.white,
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("He;lllol"),
                  Text("He;lllol"),
                  Text("He;lllol"),
                  Text("He;lllol"),
                  Text("He;lllol")
                ]
            )
        )
    );


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