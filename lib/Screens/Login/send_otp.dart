import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Login/loginpage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/showDialogs.dart';
import 'package:http/http.dart' as http;

import 'forgot_password.dart';

class SendOtpController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
}

class SendOtp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _SendOtp();
  }
}

class _SendOtp extends State<SendOtp>{
  @override
  initState(){
    print("dfvhjsfvdsvbghjdfsghjdfsghjdfghjbdfghj");
    final controller = Get.put(SendOtpController());
    controller.userNameController.clear();
    super.initState();
  }


  @override
  void dispose() {
    final controller = Get.put(SendOtpController());
    //controller.userNameController.dispose();
   // controller.eMailController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SendOtpController());
    return Scaffold(
      body: GestureDetector(
        onTap: () {
            FocusScope.of(context).unfocus();
          },
        child: SingleChildScrollView(
      
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
                        top: 27,
                        left: 15,
      
                        child: IconButton(
                          onPressed: (){
                            print("clicked");
                             Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()
            ),
            (route) => false
        );
                          }, 
                          
                          icon: Icon(Icons.arrow_back,color: ColorUtility().colorWhite,),
                             
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
                                                        child: new Text('Send OTP', textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06,color: Colors.black54,fontWeight: FontWeight.bold))
      
                                                    )
                                                  ]
                                              )
                                          ),
      
                                          Center(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/20,0),
                                                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                alignment: Alignment.center,
                                                child:Text("We will send you a One Time Password (OTP) on your mobile ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.center),
      
                                              )
                                          ),
      
      
                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/20,0),
                                              //height: MediaQuery.of(context).size.height/16,
                                              child:  TextFormField(
                                                cursorColor: ColorUtility().colorAppbar,
                                                decoration: InputDecoration(
                                                  labelText: "User Name",
                                                  labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                                                  prefixIcon: Icon(Icons.person, size: 24,color: Colors.grey),
      
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
                                                  //     color: Colors.grey,
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
                                                controller: controller.userNameController,
                                              
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
                                                        child: Text('Send OTP',style:TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
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
      ),

    );
  }

  Future<void> validator() async {
    final controller = Get.put(SendOtpController());
    print(controller.userNameController.text);
    if(controller.userNameController.text.length == 0){
      validateMessage(context,"Enter User Name");
    }else{
      print(controller.userNameController.text);
      var otp = await sendOtpFrogot(context,controller.userNameController.text.toString());

    }





  }



  static sendOtpFrogot(BuildContext context, String Username) async {
    print('sendOtp');
    print(Username);
    print("14789325");
    try {
      // ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(Config().BASE_URL+'/customer_api/forgot_otp/'));
      request.body = json.encode({"username": "$Username"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();

      print("sendOtp  221     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;

      if(statuscode==true){
        // ShowDialogs().showProgressDialog(context,"Loading....",false);
        print("229");
        confirmForgotOtpPopup(context);
        print("231");

      }else{
        // ShowDialogs().showProgressDialog(context,"Loading....",false);
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      print(e.toString());
    }
  }



  static Future<void>  confirmForgotOtpPopup(BuildContext context) async{
    print("2291");
    final controller = Get.put(SendOtpController());
    print("2292  ");
    print(controller.userNameController.text);
  //  var verify = await veriFyOtp( context,controller.userNameController.text, "1234");

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
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                        height: MediaQuery.of(context).size.height/16,
                        child:  TextFormField(
                            textAlign: TextAlign.center,
                            cursorColor: ColorUtility().colorAppbar,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputDecoration(
                            labelText: "Enter OTP",
                            labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
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
                            )
                          ),
                          obscureText: false,
                          controller: controller.eMailController,
                          onChanged: (vales) async {
                            print('First text field: $vales');
                            if(vales.length == 4){
                             // 
                              
                              FocusScope.of(context).unfocus();
                              var verify = await veriFyOtp( context,controller.userNameController.text, vales.toString());
                              
                            }
                          },
                        )
                    ),//Text

                    // Container(
                    //   margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                    //   height: MediaQuery.of(context).size.height/16,
                    //   child: PinCodeTextField(
                    //     length: 4,
                    //     obscureText: true,
                    //     autoFocus: true,
                    //     animationType: AnimationType.fade,
                    //     keyboardType: TextInputType.number,
                    //     pinTheme: PinTheme(
                    //       shape: PinCodeFieldShape.box,
                    //       borderRadius: BorderRadius.circular(5),
                    //       fieldHeight: MediaQuery.of(context).size.height/25,
                    //       fieldWidth: MediaQuery.of(context).size.height/25,
                    //       activeFillColor: Colors.white,
                    //       activeColor: ColorUtility().colorAppbar,
                    //       inactiveColor: Colors.grey,
                    //       inactiveFillColor: Colors.grey,
                    //       selectedFillColor: Colors.grey,
                    //       selectedColor: Colors.grey,
                    //     ),
                    //     animationDuration: const Duration(milliseconds: 300),
                    //     backgroundColor: Colors.white,
                    //     enableActiveFill: false,
                    //     controller: controller.textEditingController,
                    //     onCompleted: (v) async {
                    //       debugPrint("Completed");
                    //
                    //       Navigator.pop(context);
                    //        var verify = await veriFyOtp( context,controller.userNameController.text, v.toString());
                    //       // var verify = await veriFyOtp( context,controller.userNameController.text, "1234");
                    //
                    //     },
                    //     onChanged: (value) {
                    //       debugPrint(value);
                    //
                    //     },
                    //     beforeTextPaste: (text) {
                    //       return true;
                    //     },
                    //     appContext: context,
                    //   ),
                    // ),

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
                                        ..onTap = () =>{
                                          // clearData(),

                                          // controller.textEditingController.clear(),
                                          controller.userNameController.clear(),
                                          // Navigator.pop(context),
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendOtp()),
                                                  (route) => true
                                          )

                                        }

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

  static void ShowWarnigAlert(BuildContext context, String message) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future veriFyOtp(BuildContext context, String Username, String otp) async {

    print("veriFyOtp");
    print(Username);
    print(otp);
    final controller = Get.put(SendOtpController());
    controller.userNameController.clear();
    controller.eMailController.clear();
    controller.eMailController.clear();
    print('sendOtp');
    print(Username);
   
    try {
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(Config().BASE_URL+'/customer_api/verify_forgot_otp/'));
      request.body = json.encode({"username": "$Username","fpassotp": "$otp"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();
        
      print("sendOtp  407     "+res.toString());

      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      print("sendOtp  4071     "+res.toString());
      if(statuscode==true){
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        print("sendOtp  4072     "+res.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => ForgotPassword()
            ),
                (route) => false
        );

      }else{
        ShowDialogs().showProgressDialog(context,"Loading....",false);
        
        showFaliureAlertDialog(context,errors.toString());
        

        //validateMessage(context,errors.toString());
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      showFaliureAlertDialog(context, e.toString());
      print(e.toString());
    }


  }

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(SendOtpController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {

        Navigator.of(context).pop();
        Navigator.pop(context);

        controller.userNameController.clear();
        controller.eMailController.clear();

      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("OTP",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
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

 validateMessage(BuildContext context, String message) {
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








