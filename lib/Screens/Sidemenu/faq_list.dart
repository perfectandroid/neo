import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/faqModel.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class Faq extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _Faq();
  }
}

class _Faq extends State<Faq>{

  FaqModel faqModel = new FaqModel();
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
                height: MediaQuery.of(context).size.height,
                color: ColorUtility().colorAboutsUs,
                child : FutureBuilder<FaqModel>(
                    future:  fetchPost(context),
                    builder: (context, snapshot) {
                      if (faqModel.success == true) {
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
                                                        child:Flexible(
                                                          child: new Container(
                                                              padding: new EdgeInsets.only(right: 0),
                                                              child: new Text("FAQ",
                                                                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.03,
                                                                      letterSpacing: .1,color: Colors.black),textAlign: TextAlign.justify)
                                                          ),
                                                        )
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Container(
                                                          color: Colors.white,
                                                          padding:EdgeInsets.all(0),
                                                          child:  ListView.builder(
                                                              shrinkWrap: true,
                                                              itemCount: faqModel?.data?.length,
                                                              itemBuilder: (context,index){

                                                                return   Container(
                                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                                                  padding: EdgeInsets.all(0),
                                                                  alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorUtility().colorReportHead,
                                                                            width: 0.9
                                                                        ),
                                                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                                                    ),
                                                                  child: ExpansionTile(
                                                                    initiallyExpanded: false,
                                                                    title: Text(""+(faqModel?.data?[index].question).toString(),textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.025,color: Colors.black),),
                                                                    collapsedBackgroundColor: ColorUtility().colorReportHead,
                                                                    collapsedIconColor: Colors.black,
                                                                    iconColor: Colors.black,
                                                                    backgroundColor: Colors.white,
                                                                    children: [
                                                                      Container(
                                                                          padding: const EdgeInsets.fromLTRB(10,0,10,10),
                                                                        child: Divider(color: ColorUtility().colorReportHead,height: 1)
                                                                      ),

                                                                      Center(
                                                                          child: Container(
                                                                            alignment: Alignment.centerLeft,
                                                                            padding: const EdgeInsets.fromLTRB(10,0,10,10),
                                                                            child:Text(""+(faqModel?.data?[index].answer).toString(),textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,color: Colors.grey),),

                                                                          )
                                                                      ),

                                                                    ]
                                                                )
                                                                );


                                                              }
                                                          )

                                                      )
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

  Future<FaqModel> fetchPost(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/faq/'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("FAQ  149     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        return faqModel = FaqModel.fromJson(status);
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