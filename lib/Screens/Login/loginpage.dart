import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Login/send_otp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helper/colorutility.dart';
import 'package:http/http.dart' as http;

import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import 'forgot_password.dart';
import 'otp_page.dart';
class LoginController extends GetxController {
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();
  final textEditingController = TextEditingController();
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage>{
  // TextEditingController eMailController = TextEditingController();
  // TextEditingController passWordController = TextEditingController();
  bool boolPass = true;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  initState(){

    super.initState();
    
  }

  // @override
  // void dispose() {
  //   final controller = Get.put(LoginController());
  //   controller.eMailController.dispose();
  //   controller.passWordController.dispose();
  //   controller.textEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child :Container(
                    
                    height: MediaQuery.of(context).size.height <= 667 ? 720 : MediaQuery.of(context).size.height,
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
                              bottom: MediaQuery.of(context).padding.bottom - 40,
                              child:  Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height/2 ,
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
                              top: MediaQuery.of(context).size.height/10,
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
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.width/20,0),
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
                                                          child: new Text('Login Account', textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06,color: Colors.black54,fontWeight: FontWeight.bold))
          
                                                      )
                                                    ]
                                                )
                                            ),
          
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/25,MediaQuery.of(context).size.width/20,0),
                                               // height: MediaQuery.of(context).size.height/13,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      TextFormField(
                                                        maxLength: 15,
                                                        cursorColor: ColorUtility().colorAppbar,
                                                        focusNode: emailFocusNode,
                          
                                                        onFieldSubmitted: (value) {
          
                                                        FocusScope.of(context).requestFocus(passwordFocusNode);
                            
                                                        },
          
                                                        decoration: InputDecoration(
                                                          labelText: "Username",
                                                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorBorderBox),
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
                                                        controller: controller.eMailController,
                                                      )
                                                    ]
                                                )
          
                                            ),
          
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/20,0),
                                               // height: MediaQuery.of(context).size.height/15,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
          
                                                      TextField(
                                                        maxLength: 15,
                                                        focusNode: passwordFocusNode,
                                                        cursorColor: ColorUtility().colorAppbar,
                                                        decoration: InputDecoration(
                                                          labelText: "Password",
                                                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045,color: ColorUtility().colorBorderBox),
                                                          prefixIcon: Icon(Icons.lock, size: 24,color: ColorUtility().colorBorderBox),
                                                          suffixIcon: IconButton(
                                                              icon: Icon(boolPass == true?Icons.visibility_off:Icons.visibility),
                                                              color: ColorUtility().colorBorderBox,
                                                              onPressed: () {
                                                                if(boolPass){ //if passenable == true, make it false
                                                                  setState(() {
                                                                    boolPass = false;
                                                                  });
                                                                }else{
                                                                  setState(() {
                                                                    boolPass = true;
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
                                                        obscureText: boolPass,
                                                        controller: controller.passWordController,
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
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/50,MediaQuery.of(context).size.width/10,0),
                                                child: Column(
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft, child:
                                                      new GestureDetector(
                                                          onTap: () {
          
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => SendOtp()
                                                                ),
                                                                    
                                                            );
          
                                                            //   confirmOtpPopup(context);
                                                          },
                                                          child: new Text('Forgot Password ?', textAlign: TextAlign.left, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,color: ColorUtility().colorAppbar))
                                                      )
          
                                                      )
                                                    ]
                                                )
                                            ),
          
          
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/10),
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      new SizedBox(
                                                        height: MediaQuery.of(context).size.height/17,
                                                        width: MediaQuery.of(context).size.width,
                                                        child: ElevatedButton(
                                                          child: Text('Login',style:TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
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
          
                                            ),
          
          
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
      ),
    
    );
  }

  Future<void> validator() async {
    final controller = Get.put(LoginController());

    double screenHeight = MediaQuery.of(context).size.height;
    print("screen height === " + (screenHeight).toString());

    if(controller.eMailController.text.isEmpty){
     validateMessage(context,"Enter User Name");
    }else if(controller.passWordController.text.isEmpty){
      validateMessage(context,"Enter password");
    }else{
      var users = await login(controller.eMailController.text, controller.passWordController.text, context);
    }
  }

  static Future login(Username, Password,BuildContext context ) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
          
      var request = http.Request('POST', Uri.parse(Config().BASE_URL+'/customer_api/login/'));
      request.body = json.encode({"username": "$Username", "password": '$Password'});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("LOGIN"+res.toString());
      print("300   : $response");
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){

        print(statuscode);
        print(status['data']['id']);
        String mobileNum = status['data']['mobile_number'];
        OtpPage(context, Username,status);

        
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

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(LoginController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.eMailController.clear();
        controller.passWordController.clear();
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("LOGIN FAILURE",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
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

  void confirmOtpPopup(context) {
    final controller = Get.put(LoginController());
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
                          child:Image.asset("assets/images/iconotp.png")

                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10,20,10,0),
                        child:SizedBox(
                          child:Text("OTP Verification", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.025,letterSpacing: .1,color: Colors.black),),                        )

                    ),

                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10,5,10,0),
                        child:SizedBox(
                          child:Text("Please enter your 4 digit OTP Code ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.00,letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.center,),                        )

                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: true,
                        autoFocus: true,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: MediaQuery.of(context).size.height/25,
                            fieldWidth: MediaQuery.of(context).size.height/25,
                            activeFillColor: Colors.white,
                            activeColor: ColorUtility().colorAppbar,
                            inactiveColor: Colors.grey,
                            inactiveFillColor: Colors.grey,
                            selectedFillColor: Colors.grey,
                            selectedColor: Colors.grey,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        enableActiveFill: false,
                        controller: controller.textEditingController,
                        onCompleted: (v) async {
                          debugPrint("Completed");
                        //  var users = await otp(widget.text, controller.textEditingController.text, context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()
                              ),
                                  (route) => true
                          );
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            //  currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),

                    Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/80,MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/40),
                            padding: const EdgeInsets.fromLTRB(0,0,0,0),
                            alignment: Alignment.center,
                            // child:Text("OTP not received? ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: ColorUtility().colorAppbar),textAlign: TextAlign.right),
                            child: RichText(
                              text: TextSpan(
                                text: "Didn't receive the verification OTP ?" ,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.014,
                                ),
                                children: [
                                  TextSpan(
                                      text: ' Resend again',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: MediaQuery.of(context).size.height * 0.014,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                                            )


                                  ),

                                ],
                              ),textAlign: TextAlign.center,
                            )


                        )
                    )


                  ],
                ),
              ),
            ),
          );
        });


  }

}

OtpPage(BuildContext context, String Username, status) async {

  try {
    final controller = Get.put(LoginController());
    var ss = status['data']["id"];
    print('login  :   $ss');


    await SharedPreferencesHelper.setAgent_id(status['data']["id"]?? (throw ArgumentError("id is required")));
    await SharedPreferencesHelper.setAgent_name(status['data']["name"] ?? "");
    await SharedPreferencesHelper.setAgent_mobile_number(status['data']["mobile_number"]?? "");
    await SharedPreferencesHelper.setAgent_email(status['data']["email"] == null ? "" : status['data']["email"]);
    await SharedPreferencesHelper.setAgent_token(status['data']["token"]?? (throw ArgumentError("token is required")));
    await SharedPreferencesHelper.setAgent_user_type(status['data']["user_type"]?? (throw ArgumentError("user_type is required")));
    await SharedPreferencesHelper.setAgent_image(status['data']["image"]?? "");


    var token = await SharedPreferencesHelper.getAgent_token();
    print("TOKEN LOGIN"+token);
    String mobileNo = status['data']["mobile_number"].toString();
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => OTPVerification(text: Username,mobileNo : mobileNo),
    //     ));

    var pass = controller.passWordController.text.toString();
    controller.eMailController.clear();
    controller.passWordController.clear();


    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => OTPVerification(text: Username,mobileNo : mobileNo,pass : pass)
        ),
            (route) => false
    );

    

  }
  catch(e)
  {
    debugPrint("113   :   "+e.toString());
  }
}

