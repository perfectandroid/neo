import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/PrivacyPolicyModel.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _PrivacyPolicy();
  }
}

class _PrivacyPolicy extends State<PrivacyPolicy>{

  PrivacyPolicyModel privacyPolicyModel = new PrivacyPolicyModel();
  @override
  initState(){
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              color: ColorUtility().colorAboutsUs,
              child : FutureBuilder<PrivacyPolicyModel>(
                future:  fetchPost(context),
                builder: (context, snapshot) {
                    if (privacyPolicyModel.success == true) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 15,
                          shadowColor: Colors.black,
                          color: Colors.white,
                          child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.fromLTRB(0,0,0,0),
                              child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Center(
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.height/25),
                                              child:new Container(
                                                  padding: new EdgeInsets.only(right: 0),
                                                  child: new Text("Privacy Policy",
                                                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.03,
                                                          letterSpacing: .1,color: Colors.black),textAlign: TextAlign.justify)
                                              )
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.height/25),
                                              child:new Container(
                                                  padding: new EdgeInsets.only(right: 0),
                                                  //privacyPolicyModel.data?[0].description
                                                  child: new Text(""+(largeTextModel.text).toString(),
                                                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                                          letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.justify)
                                              )
                                          ),
                                        )

                                      ]
                                  )
                              )
                          )
                        )

                      );
                    }
                    else{
                      return Container();
                    }
                }
              )

            )
        )
    );
  }

  Future<PrivacyPolicyModel> fetchPost(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/customer/privacy_policy/view/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("Privacy Policy  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        return privacyPolicyModel = PrivacyPolicyModel.fromJson(status);
      }else{
        return showFaliureAlertDialog(context,errors);

      }
    }catch (e){
      return showFaliureAlertDialog(context,"Some technical issues");
    }


  }

  showFaliureAlertDialog(BuildContext context, String errorMsg) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        //Navigator.pop(context,true);
        //Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryScreen(),));
        // Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("" ),
      content: Text(errorMsg),
      actions: [
        okButton,
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}