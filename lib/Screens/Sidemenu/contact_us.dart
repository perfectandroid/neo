import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/ContactUsModel.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _ContactUs();
  }
}

class _ContactUs extends State<ContactUs>{

  ContactUsModel contactUsModel = new ContactUsModel();
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
                child : FutureBuilder<ContactUsModel>(
                    future:  fetchPost(context),
                    builder: (context, snapshot) {
                      if (contactUsModel.success == true) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  margin: EdgeInsets.zero,
                                  height: MediaQuery.of(context).size.height/3,
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
                                      boxShadow: [new BoxShadow(
                                        color: ColorUtility().colorContactTop,
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
                                                  child: Image.network(Config().BASE_URL+(contactUsModel.data?[0].logo).toString())
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


                              ),

                              Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 0.9
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.location_on_outlined, color: Colors.grey ,size: 24),
                                                    Flexible(
                                                      child: new Container(
                                                          padding: new EdgeInsets.all(5),
                                                          child: new Text(""+(contactUsModel.data?[0].address).toString(),
                                                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                                                  letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.left)
                                                      ),
                                                    )

                                                  ],
                                                )
                                            ),
                                            Divider(
                                                color: Colors.grey,
                                                height: 0.01
                                            ),
                                            Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.email_outlined, color: Colors.grey ,size: 24),
                                                    Flexible(
                                                      child: new Container(
                                                          padding: new EdgeInsets.all(5),
                                                          child: new Text(""+(contactUsModel.data?[0].email).toString(),
                                                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                                                  letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.left)
                                                      ),
                                                    )

                                                  ],
                                                )
                                            ),
                                            Divider(
                                                color: Colors.grey,
                                                height: 0.01
                                            ),
                                            Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.phone_iphone_rounded, color: Colors.grey ,size: 24),
                                                    Flexible(
                                                      child: new Container(
                                                          padding: new EdgeInsets.all(5),
                                                          child: new Text(""+(contactUsModel.data?[0].mobile).toString(),
                                                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                                                  letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.left)
                                                      ),
                                                    )

                                                  ],
                                                )
                                            )

                                          ]
                                      )
                                  ),


                                //Text
                              )



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

  Future<ContactUsModel> fetchPost(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/customer/footer/view/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("getConfirmList  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        return contactUsModel = ContactUsModel.fromJson(status);
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
      Navigator.pop(context,true);
      Navigator.pop(context,true);
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