import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Login/mpin_verification_page.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import 'package:http/http.dart' as http;

class ChangeMpinController extends GetxController {


  TextEditingController textOldMpin = TextEditingController();
  TextEditingController textNewMpin = TextEditingController();
  TextEditingController textConfirmMpin = TextEditingController();


}

class ChangeMpin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _ChangeMpin();
  }
}

class _ChangeMpin extends State<ChangeMpin>{

  bool boolOld = false;
  bool boolNew = false;
  bool boolConfirm = false;

  @override
  initState(){
    super.initState();
  }

  @override
  void dispose() {

    final controller = Get.put(ChangeMpinController());
    controller.textOldMpin.clear();
    controller.textNewMpin.clear();
    controller.textConfirmMpin.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeMpinController());

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
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextFormField(
                        cursorColor: ColorUtility().colorAppbar,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],

                        decoration: InputDecoration(
                          labelText: "Old Mpin",
                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.lock, size: 24,color: Colors.grey),
                          suffixIcon: IconButton(
                              icon: Icon(boolOld == true?Icons.visibility_off:Icons.visibility),
                              color: Colors.grey,
                              onPressed: () {
                                if(boolOld){ //if passenable == true, make it false
                                  setState(() {
                                    boolOld = false;
                                  });
                                }else{
                                  setState(() {
                                    boolOld = true;
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
                        onChanged: (value) {
                        },
                        obscureText: boolOld,
                        controller: controller.textOldMpin,
                      ),

                  ),

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextFormField(
                        cursorColor: ColorUtility().colorAppbar,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
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
    final controller = Get.put(ChangeMpinController());
    if(controller.textOldMpin.text.isEmpty || controller.textOldMpin.text.length != 6){
      validateMessage(context,"Enter 6 digit old mpin");
    }else if(controller.textNewMpin.text.isEmpty || controller.textNewMpin.text.length != 6){
      validateMessage(context,"Enter 6 digit new mpin");
    }
    else if(controller.textConfirmMpin.text.isEmpty || controller.textConfirmMpin.text.length != 6){
      validateMessage(context,"Enter 6 digit confirm mpin");
    }
    else if(controller.textNewMpin.text.toString().compareTo(controller.textConfirmMpin.text.toString()) != 0){
      validateMessage(context,"Mpin Mismatch");
    }
    else{
      //String currentMpin = await SharedPreferencesHelper.get
      String Username = await SharedPreferencesHelper.getAgent_mobile_number();
      var users = await changeMpin(Username,controller.textOldMpin.text.toString(), controller.textNewMpin.text.toString(), context);
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

  static Future changeMpin(Username,oldMpin, newMpin,BuildContext context ) async {

    try{
      print(oldMpin);
      print(newMpin);

      ShowDialogs().showProgressDialog(context,"Loading....",true);
      String token = await SharedPreferencesHelper.getAgent_token();
      var headers = {"Authorization": "Token "+token,"Content-Type": "application/json"};
      var request = http.Request('POST', Uri.parse(Config().BASE_URL+'/customer_api/change_mpin/'));
      request.body = json.encode({"username": "$Username", "old_mpin": "$oldMpin", "new_mpin": "$newMpin"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("changeMpin  319     "+res.toString());

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
    final controller = Get.put(ChangeMpinController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textOldMpin.clear();
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