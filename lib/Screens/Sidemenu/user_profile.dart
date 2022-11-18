import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/Model/profile_model.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _UserProfile();
  }
}

class _UserProfile extends State<UserProfile>{

  ProfileModel profileModel = new ProfileModel();
  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
          child : FutureBuilder<ProfileModel>(
              future:  fetchPost(context),
              builder: (context, snapshot) {
                if (profileModel.success == true) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child :  ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height,
                              color: Colors.white,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        color: Colors.white,

                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[

                                              Expanded(
                                                  flex: 2,
                                                  child: Stack(
                                                      children: <Widget>[
                                                        Positioned(
                                                            top: 0,
                                                            left: 0,
                                                            right: 0,
                                                            child:  Container(
                                                                width: MediaQuery.of(context).size.width,
                                                                height: MediaQuery.of(context).size.height/6,
                                                                margin: EdgeInsets.fromLTRB(15, 0, 20, 15),
                                                                padding: EdgeInsets.all(0),
                                                                alignment: Alignment.topCenter,
                                                                decoration: BoxDecoration(
                                                                  color: ColorUtility().colorProfileTop,
                                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                                                )
                                                            )
                                                        ),
                                                        Positioned(
                                                            top: MediaQuery.of(context).size.height/40,
                                                            left: 0,
                                                            right: 0,

                                                            child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.height/6,
                                                                    height: MediaQuery.of(context).size.height/6,
                                                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/15),
                                                                    padding: EdgeInsets.all(0),
                                                                    child: CircleAvatar(
                                                                        backgroundColor: Colors.white,
                                                                        radius: MediaQuery.of(context).size.height/15,
                                                                      child: ClipOval(
                                                                          child: Image.network(Config().BASE_URL+(profileModel.data?.image).toString(),width: MediaQuery.of(context).size.height/6,height: MediaQuery.of(context).size.height/6,fit: BoxFit.fill,),
                                                                      )),
                                                                    //    child: Image.network(Config().BASE_URL+(profileModel.data?.image).toString(),width: MediaQuery.of(context).size.height/9,height: MediaQuery.of(context).size.height/9,fit: BoxFit.fill,)),
                                                                    // child: Image.asset('assets/images/logo.png',width: MediaQuery.of(context).size.height/6,height: MediaQuery.of(context).size.height/6)),
                                                                    decoration: BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      border: Border.all(
                                                                        color: Colors.grey,
                                                                        width: 1.0,
                                                                      ),
                                                                    ),//Text

                                                                  ),
                                                                  Center(
                                                                      child: Container(
                                                                          margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/50,0,0),
                                                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                                          alignment: Alignment.center,
                                                                          child:Text(""+(profileModel.data?.name).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.025,letterSpacing: .1,color: Colors.black))

                                                                      )
                                                                  ),
                                                                ]
                                                            )


                                                        )
                                                      ]
                                                  )
                                              ),

                                              Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width/8, 0, 0),
                                                    decoration: BoxDecoration(
                                                      // border: Border.all(
                                                      //     color: Colors.white,
                                                      //     //color: myImageAndCaption[i].color,
                                                      //     width: 0.9
                                                      // ),
                                                      // borderRadius: BorderRadius.all(Radius.circular(5))
                                                      image: DecorationImage(
                                                        image: AssetImage("assets/images/maskbg.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),

                                                      child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[

                                                            Container(
                                                                margin: EdgeInsets.fromLTRB(0,0,0,0),
                                                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/8,0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Icon(Icons.location_on_outlined, color: ColorUtility().colorAppbar, size: 20),
                                                                    Container(color: Colors.transparent,width: 10),
                                                                    Flexible(
                                                                      child: new Container(
                                                                          padding: new EdgeInsets.only(right: 0),
                                                                        child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(""+(profileModel.data?.address).toString(),
                                                                                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.018,
                                                                                      letterSpacing: .1,color: Colors.black45),maxLines: 3),
                                                                              Divider(height: 10,color: Colors.transparent),
                                                                              Divider(height: 0.03,color: Colors.grey)
                                                                            ]
                                                                        )

                                                                      ),
                                                                    )

                                                                  ],
                                                                )

                                                            ),

                                                            Container(
                                                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/8,0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Icon(Icons.phone_iphone_rounded, color: ColorUtility().colorAppbar, size: 20),
                                                                    Container(color: Colors.transparent,width: 10),
                                                                    Flexible(
                                                                      child: new Container(
                                                                          padding: new EdgeInsets.only(right: 0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(""+(profileModel.data?.mobile).toString(),
                                                                                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.018,
                                                                                        letterSpacing: .1,color: Colors.black45),maxLines: 3),
                                                                                Divider(height: 10,color: Colors.transparent),
                                                                                Divider(height: 0.03,color: Colors.grey)
                                                                              ]
                                                                          )

                                                                      ),
                                                                    )

                                                                  ],
                                                                )

                                                            ),

                                                            Container(
                                                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/8,0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Icon(Icons.email_outlined, color: ColorUtility().colorAppbar, size: 20),
                                                                    Container(color: Colors.transparent,width: 10),
                                                                    Flexible(
                                                                      child: new Container(
                                                                          padding: new EdgeInsets.only(right: 0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(""+(profileModel.data?.email).toString(),
                                                                                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.018,
                                                                                        letterSpacing: .1,color: Colors.black45),maxLines: 3),
                                                                                Divider(height: 10,color: Colors.transparent),
                                                                                Divider(height: 0.03,color: Colors.grey)
                                                                              ]
                                                                          )

                                                                      ),
                                                                    )

                                                                  ],
                                                                )

                                                            ),

                                                          ]
                                                      )

                                                  )
                                              )


                                            ]
                                        )




                                    )
                                  ]
                              )

                          )
                        ]
                    ),

                  );
                }else{
                  return Container();
                }
              }
          )
      )




    );
  }

  Future<ProfileModel> fetchPost(context) async {

    try{
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/profile/'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("fetchPost  234     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      if(statuscode==true){
        return profileModel = ProfileModel.fromJson(status);
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
        Navigator.pop(context,true);
        Navigator.pop(context,true);
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