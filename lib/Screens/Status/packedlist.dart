import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/helper/sharedprefhelper.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/showDialogs.dart';
import '../SplashScreen/splash_screen.dart';
import 'package:http/http.dart' as http;

class PackedScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PackedScreen();
  }

}

class _PackedScreen extends State<PackedScreen>{
  @override

  late var h ;
  List packedList = [];
  late List<bool> _isChecked;

  initState(){
    checkInterNet(this.context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height * 01;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtility().colorAppbar,
          title: Text("Packed List"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: Icon(Icons.arrow_back),
          ),

        ),


        body: getBody()


    );
  }

  Widget getBody(){
    return Stack(
        children: <Widget>[

          new Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height * 0.06),
              child :ListView.builder(
                // padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.04,0,MediaQuery.of(context).size.height * 0.04),
                shrinkWrap: true,
                itemCount: packedList.length,
                itemBuilder: (context,index){
                  return getCard(packedList,index);
                },
              )
          ),



          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity, // <-- match_parent
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                        backgroundColor: ColorUtility().colorAppbar,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero))
                    ),
                    onPressed: () {
                      print('List :  $_isChecked');
                      for (var i = 0; i < packedList.length; i++){
                        if(_isChecked[i]){
                          print("Packed List 96");
                          print(packedList[i]['id'].toString());
                        }
                      }


                    },
                    child: Text('DELETE'),
                  )
              )
          )

        ]
    );


  }

  Widget getCard(item,index){

    print("147893");
    print(item);
    return Card(
      // margin: EdgeInsets.zero,
        margin: EdgeInsets.all(2.0),
        color: ColorUtility().colorLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),),
        elevation: 5,

        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Container(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,0,0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[


                                    Center(
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          width: MediaQuery.of(context).size.width * 0.85,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[

                                                Center(
                                                    child: Container(
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.8,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05,letterSpacing: .1,color: ColorUtility().colorAppbar),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Address ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['fk_shipping_address'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),
                                                                        //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Status ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(5,1,5,1),
                                                                        alignment: Alignment.centerLeft,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                          color: ColorUtility().colorPacked,
                                                                        ),
                                                                        child:Text(""+item[index]['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: Colors.white),),
                                                                        //  child:Text(""+index.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.20,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Total ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['grand_total'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                ),

                                                Center(
                                                    child: Container(
                                                        child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                            child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[

                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.2,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text("Ordered On ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorBlack),),

                                                                      )
                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                                        alignment: Alignment.centerLeft,
                                                                        child:Text(""+item[index]['created_at'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorLightBlack),),

                                                                      )
                                                                  ),

                                                                ]
                                                            )
                                                        )

                                                    )
                                                )

                                                ,
                                                // Text(""+item[index]['fk_user'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Address       : "+item[index]['fk_shipping_address'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Total            : "+item[index]['grand_total'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                                //
                                                // Text("Ordered On : "+item[index]['created_at'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                                                // SizedBox(height: 5,),
                                              ]
                                          )
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
                                                value: _isChecked[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    _isChecked[index] = value!;
                                                    print(value);
                                                  });
                                                },
                                              )
                                          )
                                          ,
                                        )
                                    ),

                                    // Center(
                                    //   child: Container(
                                    //       padding: const EdgeInsets.all(0.0),
                                    //       width: MediaQuery.of(context).size.width * 0.2,
                                    //       child: Column(
                                    //           crossAxisAlignment: CrossAxisAlignment.end,
                                    //           children: <Widget>[
                                    //             Text(item[index]['delivery_status'].toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorGreen),),
                                    //             SizedBox(height: 5,),
                                    //
                                    //           ]
                                    //       )
                                    //   ),
                                    // ),
                                  ]
                              )
                          )
                      )
                  ),

                  // Center(
                  //     child: Container(
                  //         child: Padding(
                  //             padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  //             child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Center(
                  //                     child: Container(
                  //                         padding: const EdgeInsets.all(0.0),
                  //                         width: MediaQuery.of(context).size.width,
                  //                         child: Column(
                  //                             crossAxisAlignment: CrossAxisAlignment.end,
                  //                             children: <Widget>[
                  //                               Text("Ordered On : "+item['created_at'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.02,letterSpacing: .1,color: ColorUtility().colorBlack),),
                  //                               SizedBox(height: 5,),
                  //
                  //
                  //                             ]
                  //                         )
                  //                     ),
                  //                   )
                  //
                  //
                  //                 ]
                  //             )
                  //         )
                  //     )
                  // )
                ]
            )
        )





    );

  }

  Future<void> checkInterNet(context) async {
    isOnline =  await NetworkUtility().checkInternet();
    print("122   :  $isOnline");
    if(isOnline){
      getPackedList(context);
    }
    else{
      checkOnlineAlert(context);
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
                                            Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new SplashScreen()),);
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

  void getPackedList(context) async {
    try {

      ShowDialogs().showProgressDialog(context,"Loading....",true);

      String token = await SharedPreferencesHelper.getAgent_token();
      print("Token  536  :  $token");
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/seller_api/order_list_packed/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getConfirmList  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;

      if(statuscode==true){
        await Future.delayed(const Duration(seconds: 1));
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        var items = json.decode(res.toString())['data'];
        print(items);
        setState(() {
          // showProgress(context,"message",false);
          //progressDialog.hide();
          _isChecked = List<bool>.filled(items.length, false);
          packedList = items;

        });

      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        setState(() {
          packedList = [];
        });
        showFaliureAlertDialog(context, errors);
      }
    }catch(e) {
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      ShowDialogs().showAlertDialog(context, e.toString());
    }
  }


  showFaliureAlertDialog(BuildContext context, String errorMsg) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("LOGIN FAILURE" ),
      content: Text(errorMsg),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


