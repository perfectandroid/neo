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
import 'loginpage.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {

  TextEditingController textUserName = TextEditingController();
  TextEditingController textNewPaasword = TextEditingController();
  TextEditingController textConfirmPaasword = TextEditingController();

}
class ForgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword>{
  final controller = Get.put(ForgotPasswordController());
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
          child :Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Stack(
                  children: <Widget>[

                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child:  Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/2,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: ColorUtility().colorAppbar,
                              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                            )
                        )
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height/2,
                        left: 0,
                        right: 0,
                        child:  Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/2,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: Colors.white,
                              //     //color: myImageAndCaption[i].color,
                              //     width: 0.9
                              // ),
                              // borderRadius: BorderRadius.all(Radius.circular(5))
                              image: DecorationImage(
                                image: AssetImage("assets/images/loginbg.png"),
                                fit: BoxFit.fill,
                              ),
                            )
                        )
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height/20,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.height/6,
                        height: MediaQuery.of(context).size.height/6,
                        child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 100,
                            child: Image.asset('assets/images/logo.png')),//Text
                      ),
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height/3,
                      left: MediaQuery.of(context).size.width/10,
                      right: MediaQuery.of(context).size.width/10,
                      child: Card(
                          elevation: 5,
                          //shadowColor: Colors.grey,
                          shadowColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child : Container(
                              width: MediaQuery.of(context).size.height/20,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/30,MediaQuery.of(context).size.width/20,0),
                                          width: MediaQuery.of(context).size.height/17,
                                          height: MediaQuery.of(context).size.height/17,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 100,
                                              child: Image.asset('assets/images/lock_login.png')),//Text
                                        ),

                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/90,MediaQuery.of(context).size.width/20,0),
                                            child: Column(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.center,
                                                      child: new Text('Forgot Password', textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06,color: Colors.black54,fontWeight: FontWeight.bold))

                                                  )
                                                ]
                                            )
                                        ),

                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.width/20,0),
                                           // height: MediaQuery.of(context).size.height/15,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                   TextFormField(
                                                    cursorColor: ColorUtility().colorAppbar,
                                                    decoration: InputDecoration(
                                                        labelText: "User Name",
                                                        labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorBorderBox),
                                                        prefixIcon: Icon(Icons.person, size: 24,color: ColorUtility().colorBorderBox),

                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorBorderBox,
                                                            )
                                                        ),

                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorAppbar,
                                                            )
                                                        )

                                                      // enabledBorder: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.circular(2),
                                                      //   borderSide: BorderSide(
                                                      //     color: ColorUtility().colorBorderBox,
                                                      //   ),
                                                      // ),
                                                      // focusedBorder: OutlineInputBorder(
                                                      //     borderRadius: BorderRadius.circular(2),
                                                      //     borderSide: BorderSide(
                                                      //       color: ColorUtility().colorAppbar,
                                                      //     )
                                                      // ),
                                                    ),
                                                    obscureText: false,
                                                    controller: controller.textUserName,
                                                  )

                                                  // new SizedBox(
                                                  //     height: MediaQuery.of(context).size.height/17,
                                                  //     width: MediaQuery.of(context).size.width,
                                                  //
                                                  // )
                                                ]
                                            )

                                        ),

                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/80,MediaQuery.of(context).size.width/20,0),
                                           // height: MediaQuery.of(context).size.height/15,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  TextFormField(
                                                    cursorColor: ColorUtility().colorAppbar,
                                                    decoration: InputDecoration(
                                                        labelText: "New Password",
                                                        labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorBorderBox),
                                                        prefixIcon: Icon(Icons.lock, size: 24,color:ColorUtility().colorBorderBox),
                                                        suffixIcon: IconButton(
                                                            icon: Icon(boolNew == true?Icons.visibility_off:Icons.visibility),
                                                            color: ColorUtility().colorBorderBox,
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

                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorBorderBox,
                                                            )
                                                        ),

                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorAppbar,
                                                            )
                                                        )
                                                      //   enabledBorder: OutlineInputBorder(
                                                      //     borderRadius: BorderRadius.circular(2),
                                                      //     borderSide: BorderSide(
                                                      //       color: ColorUtility().colorBorderBox,
                                                      //     ),
                                                      //   ),
                                                      //   focusedBorder: OutlineInputBorder(
                                                      //       borderRadius: BorderRadius.circular(2),
                                                      //       borderSide: BorderSide(
                                                      //         color: ColorUtility().colorAppbar,
                                                      //       )
                                                      //   ),
                                                    ),
                                                    obscureText: boolNew,
                                                    controller: controller.textNewPaasword,
                                                  )

                                                  // new SizedBox(
                                                  //     height: MediaQuery.of(context).size.height/17,
                                                  //     width: MediaQuery.of(context).size.width,
                                                  //     child:
                                                  // )
                                                ]
                                            )


                                        ),


                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/90,MediaQuery.of(context).size.width/40,0),
                                         //   height: MediaQuery.of(context).size.height/15,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  TextField(
                                                    cursorColor: ColorUtility().colorAppbar,
                                                    decoration: InputDecoration(
                                                        labelText: "Confirm Password",
                                                        labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: ColorUtility().colorBorderBox),
                                                        prefixIcon: Icon(Icons.punch_clock_rounded, size: 24,color: ColorUtility().colorBorderBox),
                                                        suffixIcon: IconButton(
                                                            icon: Icon(boolConfirm == true?Icons.visibility_off:Icons.visibility),
                                                            color: ColorUtility().colorBorderBox,
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

                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorBorderBox,
                                                            )
                                                        ),

                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: ColorUtility().colorAppbar,
                                                            )
                                                        )

                                                      // enabledBorder: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.circular(2),
                                                      //   borderSide: BorderSide(
                                                      //     color: ColorUtility().colorBorderBox,
                                                      //   ),
                                                      // ),
                                                      // focusedBorder: OutlineInputBorder(
                                                      //     borderRadius: BorderRadius.circular(2),
                                                      //     borderSide: BorderSide(
                                                      //       color: ColorUtility().colorAppbar,
                                                      //     )
                                                      // ),
                                                    ),
                                                    obscureText: boolConfirm,
                                                    controller: controller.textConfirmPaasword,
                                                  )

                                                  // new SizedBox(
                                                  //     height: MediaQuery.of(context).size.height/17,
                                                  //     width: MediaQuery.of(context).size.width,
                                                  //     child:
                                                  // )
                                                ]
                                            )


                                        ),




                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/20),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  new SizedBox(
                                                    height: MediaQuery.of(context).size.height/17,
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

                                        )


                                      ]
                                  )
                              )

                          )
                      ),
                    ),




                  ]
              )
          )
      ),

    );
  }

  Future<void> validator() async {
    final controller = Get.put(ForgotPasswordController());
    if(controller.textUserName.text.isEmpty){
      validateMessage(context,"Enter User Name");
    }else if(controller.textNewPaasword.text.isEmpty){
      validateMessage(context,"Enter New Password");
    }
    else if(controller.textConfirmPaasword.text.isEmpty){
      validateMessage(context,"Enter Confirm Password");
    }
    else if(controller.textNewPaasword.text.toString().compareTo(controller.textConfirmPaasword.text.toString()) != 0){
      validateMessage(context,"Password Mismatch");
    }
    else{
      var users = await login(controller.textUserName.text.toString(), controller.textNewPaasword.text.toString(), context);
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

  static Future login(Username, Password,BuildContext context ) async {

    try{
      print(Username);
      print(Password);

      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('PUT', Uri.parse(Config().BASE_URL+'/customer_api/set_forgot_password/'));
      request.body = json.encode({"username": "$Username", "new_password": "$Password"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("sendOtp  319     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;


      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){

        print(statuscode);
      //  print(status['data']['id']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()
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
    final controller = Get.put(ForgotPasswordController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textUserName.clear();
        controller.textNewPaasword.clear();
        controller.textConfirmPaasword.clear();
       // Navigator.pop(context);
       //  Navigator.pushAndRemoveUntil(
       //      context,
       //      MaterialPageRoute(
       //          builder: (context) => LoginPage()
       //      ), (route) => false
       //  );
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("CHANGE PASSWORD",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
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