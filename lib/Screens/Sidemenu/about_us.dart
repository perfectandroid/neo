import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/AboutUsModel.dart';
import 'package:neo/Screens/Home/home_activity.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class AboutUs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _AboutUs();
  }
}

class _AboutUs extends State<AboutUs>{

  AboutUsModel aboutUsModel = new AboutUsModel();
  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: ColorUtility().colorAboutsUs,
              child : FutureBuilder<AboutUsModel>(
                future:  fetchPost(context),
                builder: (context, snapshot) {
                  if (aboutUsModel.success == true) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(
                              flex: 3,
                              child:  Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
                                      boxShadow: [new BoxShadow(
                                        color: ColorUtility().colorAboutsUs,
                                      )]
                                  ),

                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                              // child: CircleAvatar(
                                              //     backgroundColor: Colors.white,
                                              //     radius: MediaQuery.of(context).size.height/12,
                                              //     child: Image.asset('assets/images/logo.png'))//Text

                                           child : Container(
                                              child:SizedBox(
                                                  height:200,width:200,
                                                  // child:Image.asset("assets/images/aboutus.png")
                                                   child: Image.network(Config().BASE_URL+(aboutUsModel.data?[0].image).toString())
                                              ),
                                            ),

                                            // child: CircleAvatar(
                                            //         child: Image.network(Config().BASE_URL+(aboutUsModel.data?[0].image).toString()),
                                            //         backgroundColor: Colors.white,
                                            //         radius: 100,
                                            //       //  child: Image.network(picsUrl),backgroundColor: Colors.white
                                            //       // child: Image.network(picsUrl),
                                            // ),

                                          ),
                                        )
                                      ]
                                  )


                              )
                          ),
                          Expanded(
                              flex: 7,
                              child: Container(
                                  decoration: new BoxDecoration(
                                     // borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.height/13),topRight: Radius.circular(MediaQuery.of(context).size.height/13)),
                                      boxShadow: [new BoxShadow(
                                        color: Colors.white,
                                      )]
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.height/25),
                                              child:Flexible(
                                                child: new Container(
                                                    padding: new EdgeInsets.only(right: 0),
                                                    child: new Text(""+(aboutUsModel.data?[0].description).toString(),
                                                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                                            letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.justify)
                                                ),
                                              )
                                          ),
                                        )
                                      ]
                                  )
                                //Text
                              )
                          ),




                        ],
                      ),
                    );
                  }else{
                  return Container();
                  }
                }
              )







            // decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/images/loginbg.png"), fit: BoxFit.fill)),

          ))
    );
  }


  Future<AboutUsModel> fetchPost(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/customer_about_us/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getConfirmList  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        AboutUsModel aboutInfo = AboutUsModel.fromJson(status);
        if (aboutInfo.data?.length == 0){
            return showFaliureAlertDialog(context,"No data found");
        }else{
           return aboutUsModel = AboutUsModel.fromJson(status);
        }
        
      }else{
        return showFaliureAlertDialog(context,errors);

      }
    }catch (e){
      return showFaliureAlertDialog(context,"Some technical issues");
    }


  }
}

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      //Navigator.pop(context,true);
      //Navigator.pop(context);
      // commented two pop and added 25/01/2023(today == 10:48 am )
      Navigator.of(context,rootNavigator: true).pop();
      //Navigator.pop(context,true);
      //Navigator.pop(context,true);
      
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
  ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => new DrawerActivity(),)));
  // then is added 25/01/2023(today == 10:48 am )
}