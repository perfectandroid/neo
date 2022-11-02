import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import 'package:http/http.dart' as http;

import 'mpin_verification_page.dart';

class ForgotMpinController extends GetxController {

  TextEditingController textUserName = TextEditingController();
  TextEditingController textNewMpin = TextEditingController();
  TextEditingController textConfirmMpin = TextEditingController();
}

class ForgotMpin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _ForgotMpin();
  }
}

class _ForgotMpin extends State<ForgotMpin>{
  final controller = Get.put(ForgotMpinController());

  bool boolNew = false;
  bool boolConfirm = false;
  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            // height: double.infinity,
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      margin: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                      child: Image.asset('assets/images/forgot_password.png')),

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextFormField(
                        cursorColor: ColorUtility().colorAppbar,
                        decoration: InputDecoration(
                          labelText: "User Name",
                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.person, size: 24,color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: ColorUtility().colorAppbar,
                              )
                          ),
                        ),
                        obscureText: false,
                        controller: controller.textUserName,
                      )
                  ),

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextFormField(
                        cursorColor: ColorUtility().colorAppbar,
                        decoration: InputDecoration(
                          labelText: "New Mpin",
                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.lock, size: 24,color: Colors.grey),
                          suffixIcon: IconButton(
                              icon: Icon(boolNew == true?Icons.visibility_off:Icons.visibility),
                              color: Colors.grey,
                              onPressed: () {
                                if(boolNew){ //if passenable == true, make it false
                                  setState(() {
                                    boolNew = false;
                                  });
                                }else{
                                  setState(() {
                                    boolNew = true;
                                  });
                                }

                              }
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: ColorUtility().colorAppbar,
                              )
                          ),
                        ),
                        obscureText: boolNew,
                        controller: controller.textNewMpin,
                      )
                  ),

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextField(
                        cursorColor: ColorUtility().colorAppbar,
                        decoration: InputDecoration(
                          labelText: "Confirm Mpin",
                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.punch_clock_rounded, size: 24,color: Colors.grey),
                          suffixIcon: IconButton(
                              icon: Icon(boolConfirm == true?Icons.visibility_off:Icons.visibility),
                              color: Colors.grey,
                              onPressed: () {
                                if(boolConfirm){ //if passenable == true, make it false
                                  setState(() {
                                    boolConfirm = false;
                                  });
                                }else{
                                  setState(() {
                                    boolConfirm = true;
                                  });
                                }

                              }
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: ColorUtility().colorAppbar,
                              )
                          ),
                        ),
                        obscureText: boolConfirm,
                        controller: controller.textConfirmMpin,
                      )
                  ),

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/10,0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new SizedBox(
                              height: MediaQuery.of(context).size.height/16,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Text('CONFIRM',style:TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                                style: ElevatedButton.styleFrom(primary: ColorUtility().colorAppbar),
                                onPressed: () {
                                  // controller.checkUserInputs(context);
                                  // controller.checkUserInputs(context);
                                  validator();
                                },
                              ),
                            ),
                          ]
                      )

                  )//Text//Text

                ],
              ),
            ),
          )),

    );
  }

  Future<void> validator() async {
    final controller = Get.put(ForgotMpinController());
    if(controller.textUserName.text.isEmpty){
      validateMessage(context,"Enter User Name");
    }else if(controller.textNewMpin.text.isEmpty){
      validateMessage(context,"Enter New Mpin");
    }
    else if(controller.textConfirmMpin.text.isEmpty){
      validateMessage(context,"Enter Confirm Mpin");
    }
    else if(controller.textNewMpin.text.toString().compareTo(controller.textConfirmMpin.text.toString()) != 0){
      validateMessage(context,"Mpin Mismatch");
    }
    else{
      var users = await forgotMpin(controller.textUserName.text.toString(), controller.textNewMpin.text.toString(), context);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => LoginPage()
      //     ), (route) => false
      // );
    }
  }

  void validateMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content:  Text(''+message,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      backgroundColor: ColorUtility().colorWarning,
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.

        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static Future forgotMpin(Username, Password,BuildContext context ) async {

    try{
      print(Username);
      print(Password);

      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('PUT', Uri.parse(Config().BASE_URL+'/seller_api/forgot/mpin/'));
      request.body = json.encode({"username": "$Username", "new_mpin": "$Password"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("sendOtp  319     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;


      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        String Username = await SharedPreferencesHelper.getAgent_mobile_number();
        print(statuscode);
        //  print(status['data']['id']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MPINVerification(text: Username)
            ), (route) => false
        );
      }else{

        print(statuscode);
        // showSuccessAlertDialog(context, Username);
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      showFaliureAlertDialog(context, e.toString());
    }

  }

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(ForgotMpinController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textUserName.clear();
        controller.textNewMpin.clear();
        controller.textConfirmMpin.clear();
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("CHANGE MPIN",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
      content: Text(errorMsg,style : TextStyle( color: Colors.grey),textAlign:TextAlign.center),
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