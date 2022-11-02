import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/send_mpin_otp.dart';
import 'package:neo/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';


var TAG = "MPINVerificationController";

class MPINVerificationController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

}

class MPINVerification extends StatefulWidget{
  final String text;
  const MPINVerification({Key? key, required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _MPINVerification();
  }
}

class _MPINVerification extends State<MPINVerification>{


  @override
  initState(){

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MPINVerificationController());

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            // height: double.infinity,
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: ColorUtility().colorAppbar,
           // decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/images/loginbg.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
                          boxShadow: [new BoxShadow(
                            color: ColorUtility().colorAppbar,
                          )]
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:Text("MPIN Verification", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.03,letterSpacing: .1,color: Colors.white),textAlign: TextAlign.center),
                            ),
                          ),

                          Center(
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/20,0,0),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: MediaQuery.of(context).size.height/8,
                                    child: Image.asset('assets/images/logo.png'))//Text
                            ),
                          ),




                        ],
                      )



                  ),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/15,MediaQuery.of(context).size.width/10,0),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.height/13),topRight: Radius.circular(MediaQuery.of(context).size.height/13)),
                          boxShadow: [new BoxShadow(
                            color: Colors.white,
                          )]
                      ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         Center(
                          child: Container(
                              padding: const EdgeInsets.all(5.0),
                              margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/70,0,0),
                              alignment: Alignment.topCenter,
                              child:Text("To unlock the application, please enter your 6 digit mpin", style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.center),

                          ),
                        ),

                        Center(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/25,0,0),
                            child: PinCodeTextField(
                              length: 6,
                              obscureText: true,
                              autoFocus: true,
                              animationType: AnimationType.fade,
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: MediaQuery.of(context).size.height/20,
                                  fieldWidth: MediaQuery.of(context).size.height/20,
                                  activeFillColor: Colors.white,
                                  activeColor: ColorUtility().colorAppbar,
                                  inactiveColor: Colors.grey,
                                  inactiveFillColor: Colors.grey,
                                  selectedFillColor: Colors.grey,
                                  selectedColor: Colors.grey
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              backgroundColor: Colors.white,
                              enableActiveFill: false,
                              controller: controller.textEditingController,
                              onCompleted: (v) async {
                                debugPrint("Completed");
                                String Username = await SharedPreferencesHelper.getAgent_mobile_number();
                                print(Username);
                                print(controller.textEditingController.text);
                                var mpinStr = controller.textEditingController.text;
                                controller.textEditingController.clear();
                                var users = await mpin(Username, mpinStr, context);
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
                        ),



                        // Container(
                        //     margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/10,0),
                        //     child: Column(
                        //         children: [
                        //           Align(
                        //               alignment: Alignment.center, child:
                        //           new GestureDetector(
                        //               onTap: () {
                        //
                        //                 Navigator.pushAndRemoveUntil(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                         builder: (context) => SendMpinOtp()
                        //                     ),
                        //                         (route) => false
                        //                 );
                        //
                        //                 //   confirmOtpPopup(context);
                        //               },
                        //               child: new Text('Forgot Mpin ?', textAlign: TextAlign.right, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05,color: ColorUtility().colorAppbar))
                        //           )
                        //
                        //           )
                        //         ]
                        //     )
                        // )

                      ],
                    )



                  //Text
                  )
                 ],
              ),
            ),
          )),

    );




  }

  // static Future mpin(Username, Password, BuildContext context) async {
  //
  //   try{
  //     ShowDialogs().showProgressDialog(context,"Loading....",true);
  //     var headers = {'Content-Type': 'application/json'};
  //     var request = http.Request(
  //         'POST', Uri.parse(Config().BASE_URL+'/customer_api/mpin/'));
  //     request.body = json.encode({"username": '$Username', "mpin": '$Password'});
  //     request.headers.addAll(headers);
  //     http.StreamedResponse response = await request.send();
  //     final res = await response.stream.bytesToString();
  //     ShowDialogs().showProgressDialog(context,"Loading....",false);
  //     print(res.toString());
  //     final status =jsonDecode(res);
  //     final statuscode = status['success'] as bool;
  //     final errors = status['errors'] as String;
  //     print(Username);
  //     print(statuscode);
  //     if(statuscode==true){
  //       print(statuscode);
  //       // print(status['data']['id']);
  //       showSuccessAlertDialog(context, Username,status);
  //     }else{
  //       showFaliureAlertDialog(context, errors.toString());      }
  //
  //   }catch(e){
  //     ShowDialogs().showProgressDialog(context,"Loading....",false);
  //     showFaliureAlertDialog(context, e.toString());
  //   }
  //
  //
  // }
  //
  // static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
  //   final controller = Get.put(MPINSetController());
  //   Widget okButton = TextButton(
  //     child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
  //     onPressed: () {
  //       //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
  //       controller.textEditingController.clear();
  //       Navigator.pop(context);
  //     },
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Text("MPIN",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
  //     content: Text(errorMsg,style : TextStyle( color: Colors.grey),textAlign:TextAlign.center),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
  static Future mpin(Username, Password, BuildContext context) async {

    print("USERNAME"+Username);
    print(Password);
    print("gjjghjghjghjghj");
    try{

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(Config().BASE_URL+'/customer_api/confirm/mpin/'));
    request.body = json.encode({"username": '$Username', "mpin": '$Password'});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    print(res.toString());
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;
    print(Username);
    print(statuscode);
    if(statuscode==true){
      print("1234568eee");
      var items = status['data']["name"];
      print(items);
      // await SharedPreferencesHelper.setId(items[0]['id']?? (throw ArgumentError("id is required")));
      //  showSuccessAlertDialog(context, errors,status);



        await SharedPreferencesHelper.setAgent_id(status['data']["id"]?? (throw ArgumentError("id is required")));
        await SharedPreferencesHelper.setAgent_name(status['data']["name"]?? (throw ArgumentError("name is required")));
        await SharedPreferencesHelper.setAgent_mobile_number(status['data']["mobile_number"]?? (throw ArgumentError("mobile_number  is required")));
        await SharedPreferencesHelper.setAgent_email(status['data']["email"]?? (throw ArgumentError("email is required")));
        await SharedPreferencesHelper.setAgent_token(status['data']["token"]?? (throw ArgumentError("token is required")));
        await SharedPreferencesHelper.setAgent_user_type(status['data']["user_type"]?? (throw ArgumentError("user_type is required")));
        await SharedPreferencesHelper.setAgent_image(status['data']["image"]?? (throw ArgumentError("image is required")));


        //SESSION
        await SharedPreferencesHelper.set_is_login(true);
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new DrawerActivity()));

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DrawerActivity(),
        //     ));


    }else{
      showFaliureAlertDialog(context, errors);
    }
    }catch(e) {
      ShowDialogs().showAlertDialog(context, e.toString());
    }

  }


  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(MPINVerificationController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textEditingController.clear();
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("MPIN Verification",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
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




//
// class MPINVerificationController extends GetxController {
//
//   var isLoading = false.obs;
//   final eMailController = TextEditingController();
//   final passWordController = TextEditingController();
//
//   void checkUserInputs(String Username,BuildContext context) async {
//     print(passWordController.text);
//     isLoading.value = true;
//     var users = await mpin(Username, passWordController.text, context);
//     isLoading.value = false;
//   }
//
//   static Future mpin(Username, Password, BuildContext context) async {
//
//     print(Username);
//     print(Password);
//     print("gjjghjghjghjghj");
//
//
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request(
//         'POST', Uri.parse(Config().BASE_URL+'/customer_api/confirm/mpin/'));
//     request.body = json.encode({"username": '$Username', "mpin": '$Password'});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     final res = await response.stream.bytesToString();
//     print(res.toString());
//     final status =jsonDecode(res);
//     final statuscode = status['success'] as bool;
//     final errors = status['errors'] as String;
//     print(Username);
//     print(statuscode);
//     if(statuscode==true){
//       print("1234568eee");
//       var items = status['data']["name"];
//       print(items);
//      // await SharedPreferencesHelper.setId(items[0]['id']?? (throw ArgumentError("id is required")));
//     //  showSuccessAlertDialog(context, errors,status);
//
//       try{
//
//         await SharedPreferencesHelper.setAgent_id(status['data']["id"]?? (throw ArgumentError("id is required")));
//         await SharedPreferencesHelper.setAgent_name(status['data']["name"]?? (throw ArgumentError("name is required")));
//         await SharedPreferencesHelper.setAgent_mobile_number(status['data']["mobile_number"]?? (throw ArgumentError("mobile_number  is required")));
//         await SharedPreferencesHelper.setAgent_email(status['data']["email"]?? (throw ArgumentError("email is required")));
//         await SharedPreferencesHelper.setAgent_token(status['data']["token"]?? (throw ArgumentError("token is required")));
//         await SharedPreferencesHelper.setAgent_user_type(status['data']["user_type"]?? (throw ArgumentError("user_type is required")));
//         await SharedPreferencesHelper.setAgent_image(status['data']["image"]?? (throw ArgumentError("image is required")));
//
//
//         //SESSION
//         await SharedPreferencesHelper.set_is_login(true);
//         Navigator.pushReplacement(
//             context,
//             new MaterialPageRoute(
//                 builder: (BuildContext context) => new DrawerActivity()));
//
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => DrawerActivity(),
//         //     ));
//       }catch(e) {
//         ShowDialogs().showAlertDialog(context, e.toString());
//       }
//
//     }else{
//       showFaliureAlertDialog(context, errors);
//     }
//
//   }
//
// }

//
showSuccessAlertDialog(BuildContext context, String Username,status) async {

     try{

        await SharedPreferencesHelper.setAgent_id(status['data']["id"]?? (throw ArgumentError("id is required")));
        await SharedPreferencesHelper.setAgent_name(status['data']["name"]?? (throw ArgumentError("name is required")));
        await SharedPreferencesHelper.setAgent_mobile_number(status['data']["mobile_number"]?? (throw ArgumentError("mobile_number  is required")));
        await SharedPreferencesHelper.setAgent_email(status['data']["email"]?? (throw ArgumentError("email is required")));
        await SharedPreferencesHelper.setAgent_token(status['data']["token"]?? (throw ArgumentError("token is required")));
        await SharedPreferencesHelper.setAgent_user_type(status['data']["user_type"]?? (throw ArgumentError("user_type is required")));
        await SharedPreferencesHelper.setAgent_image(status['data']["image"]?? (throw ArgumentError("image is required")));


        //SESSION
        await SharedPreferencesHelper.set_is_login(true);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => new DrawerActivity()
            ),
                (route) => false
        );
        // Navigator.pushReplacement(
        //     context,
        //     new MaterialPageRoute(
        //         builder: (BuildContext context) => new DrawerActivity()));

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DrawerActivity(),
        //     ));
      }catch(e) {
        ShowDialogs().showAlertDialog(context, e.toString());
      }
      // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));

}

// showFaliureAlertDialog(BuildContext context, String errorMsg) {
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("MPIN VERIFICATION FAILURE" ),
//     content: Text(errorMsg),
//     actions: [
//       okButton,
//     ],
//   );
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
//
// class MPINVerification extends GetView<MPINVerificationController> {
//   final String text;
//   const MPINVerification({Key? key, required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MPINVerificationController());
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//             // color: Colors.white,
//             // height: double.infinity,
//             // width: double.infinity,
//
//             padding: EdgeInsets.only(left: 16,right: 16),
//
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Colors.grey.shade200,
//                       offset: Offset(2, 4),
//                       blurRadius: 5,
//                       spreadRadius: 2)
//                 ],
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [PrimaryColor, PrimaryLightColor])),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//
// /*
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "Username",
//                       labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade300,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.red,
//                           )
//                       ),
//                     ),
//                     obscureText: true,
//                     controller: controller.eMailController,
//
//                   ),
// */
//                   SizedBox(height: 16,),
//
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "MPIN",
//                       labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade300,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.red,
//                           )
//                       ),
//                     ),
//                     obscureText: true,
//                     controller: controller.passWordController,
//
//                   ),
//                   SizedBox(height: 16,),
//
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                       onPressed: () async {
//                         String username = await SharedPreferencesHelper.getAgent_mobile_number();
//                         controller.checkUserInputs(username,context);
//                       },
//                       child: const Text("Submit"))
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
//
// }


