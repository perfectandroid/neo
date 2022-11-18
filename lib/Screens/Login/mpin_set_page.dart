import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import '../Home/home_activity.dart';

class MPINSetController extends GetxController {

  TextEditingController textEditingController = TextEditingController();
  // final mpin1 = TextEditingController();
  // final mpin2 = TextEditingController();
  // final mpin3 = TextEditingController();
  // final mpin4 = TextEditingController();
  // final mpin5 = TextEditingController();
  // final mpin6 = TextEditingController();
  //
  // final FocusNode mpinFocus1 = FocusNode();
  // final FocusNode mpinFocus2 = FocusNode();
  // final FocusNode mpinFocus3 = FocusNode();
  // final FocusNode mpinFocus4 = FocusNode();
  // final FocusNode mpinFocus5 = FocusNode();
  // final FocusNode mpinFocus6 = FocusNode();
  //
  //
  // late bool mpinRead1 = false;
  // late bool mpinRead2 = false;
  // late bool mpinRead3 = false;
  // late bool mpinRead4 = false;
  // late bool mpinRead5 = false;
  // late bool mpinRead6 = false;


}

class MPINCREATION extends StatefulWidget{

   String text;
   MPINCREATION({required this.text});

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _MPINCREATION();
  }
}

class _MPINCREATION extends State<MPINCREATION>{


  @override
  initState(){

    super.initState();

  }


  @override
  void dispose() {
    final controller = Get.put(MPINSetController());
    controller.textEditingController.clear();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MPINSetController());

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
                                                      child: new Text('SET MPIN', textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06,color: Colors.black54,fontWeight: FontWeight.bold))

                                                  )
                                                ]
                                            )
                                        ),

                                        Center(
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/20,0),
                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                              alignment: Alignment.center,
                                              child:Text("Please provide a 6 digit  numaric MPIN to protect your account", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.center),

                                            )
                                        ),

                                        Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.height/40,MediaQuery.of(context).size.width/20,MediaQuery.of(context).size.width/10),
                                          height: MediaQuery.of(context).size.height/16,
                                          child: PinCodeTextField(
                                            length: 6,
                                            obscureText: true,
                                            autoFocus: true,
                                            animationType: AnimationType.fade,
                                            keyboardType: TextInputType.number,
                                            autoDisposeControllers: false,
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
                                            backgroundColor: Colors.grey.shade50,
                                            enableActiveFill: false,
                                            controller: controller.textEditingController,
                                            onCompleted: (v) async {
                                              debugPrint("Completed");
                                              var users = await mpin(widget.text, controller.textEditingController.text, context);
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

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static Future mpin(Username, Password, BuildContext context) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(Config().BASE_URL+'/customer_api/mpin/'));
      request.body = json.encode({"username": '$Username', "mpin": '$Password'});
      print(request.body);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      print(res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      print(Username);
      print(statuscode);
      if(statuscode==true){
        print(statuscode);
        // print(status['data']['id']);
        showSuccessAlertDialog(context, Username,status);
      }else{
        showFaliureAlertDialog(context, errors.toString());      }

    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      showFaliureAlertDialog(context, e.toString());
    }


}

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(MPINSetController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textEditingController.clear();
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("MPIN",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
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

// class MPINSetController extends GetxController {
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
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request(
//         'POST', Uri.parse(Config().BASE_URL+'/customer_api/mpin/'));
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
//       print(statuscode);
//      // print(status['data']['id']);
//       showSuccessAlertDialog(context, Username,status);
//     }else{
//       showFaliureAlertDialog(context, errors);
//     }
//
//   }
//
// }
//
// showSuccessAlertDialog(BuildContext context, String Username,status) {
//   Widget okButton = TextButton(
//     child: Text("Continue"),
//     onPressed: () async {
//       // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));
//       try{
//
//         var ss = status['data']["id"];
//         print('5222  :   $ss');
//
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
//
//         var token = await SharedPreferencesHelper.getAgent_token();
//         print("TOKEN MPIN"+token);
//
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MPINVerification(text: Username,),
//             ));
//       }catch(e) {
//         ShowDialogs().showAlertDialog(context, e.toString());
//       }
//
//
//
//
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("MPIN CREATED SUCCESSFULLY"),
//     content: Text("Please do MPIN verification to complete the login process."),
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
// showFaliureAlertDialog(BuildContext context, String errorMsg) {
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("MPIN CREATION FAILURE" ),
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
// class MPINCREATION extends GetView<MPINSetController> {
//   final String text;
//   const MPINCREATION({Key? key, required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MPINSetController());
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
//                       onPressed: () {
//                         controller.checkUserInputs(text,context);
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


