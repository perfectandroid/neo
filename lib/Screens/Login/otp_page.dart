import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/mpin_set_page.dart';
import 'package:neo/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import 'loginpage.dart';



class OTPVerification extends StatefulWidget{

  String text;
  String mobileNo;
  OTPVerification({required this.text,required this.mobileNo});

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _OTPVerification();
  }
}

class _OTPVerification extends State<OTPVerification>{


  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            // height: double.infinity,
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/images/loginbg.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.height/5,
                    height: MediaQuery.of(context).size.height/5,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [new BoxShadow(
                            color: Colors.grey,
                        )]
                    ),

                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100,
                        child: Image.asset('assets/images/iconotp.png')),//Text
                  ),
                 //Text

                  Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/20,MediaQuery.of(context).size.width/10,0),
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        alignment: Alignment.center,
                        child:Text("Verification", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.03,letterSpacing: .1,color: Colors.black),),

                      )
                  ),
                  Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        alignment: Alignment.center,
                        child:Text("Please enter your OTP Code sent to your mobile number "+widget.mobileNo.replaceRange(0, 6,"*****"), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: Colors.grey),textAlign: TextAlign.center),

                      )
                  ),


                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/6,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/6,0),
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
                        var users = await otp(widget.text, controller.textEditingController.text, context);
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

                  // Center(
                  //     child: Container(
                  //       margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/40,MediaQuery.of(context).size.width/10,0),
                  //       padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  //       alignment: Alignment.center,
                  //      // child:Text("OTP not received? ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,letterSpacing: .1,color: ColorUtility().colorAppbar),textAlign: TextAlign.right),
                  //       child: RichText(
                  //             text: TextSpan(
                  //             text: ' OTP not received? ',
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontSize: MediaQuery.of(context).size.height * 0.017,
                  //               ),
                  //               children: [
                  //                 TextSpan(
                  //                   text: ' RESEND ',
                  //                   style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.normal,
                  //                     fontSize: MediaQuery.of(context).size.height * 0.02,
                  //                   ),
                  //                 recognizer: TapGestureRecognizer()
                  //                   ..onTap = () =>   Navigator.push(
                  //
                  //                       context, MaterialPageRoute(builder: (context) => LoginPage()))
                  //                 ),
                  //
                  //               ],
                  //             ),
                  // )
                  //
                  //
                  //     )
                  // ),


                  //Text






                ],
              ),
            ),
          )),

    );




  }

  static Future otp(Username, Password, BuildContext context) async {

    try{
      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(Config().BASE_URL+'/customer_api/verify_otp/'));
      request.body = json.encode({"username": '$Username', "otp": '$Password'});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      print("INPUT  322   :  $Username   $Password");
      print(res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      print(Username);
      print(statuscode);
      if(statuscode==true){
        print(statuscode);
        //showSuccessAlertDialog(context, Username);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MPINCREATION(text: Username,),
            ));
      }else{
        print(statuscode);
        //showSuccessAlertDialog(context, Username);
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      showFaliureAlertDialog(context, e.toString());
    }


  }

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(OTPController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
        controller.textEditingController.clear();
        Navigator.pop(context);
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

class OTPController extends GetxController {

  var isLoading = false.obs;
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  late String mobileNumber ;

}


// class OTPController extends GetxController {
//
//   var isLoading = false.obs;
//   final eMailController = TextEditingController();
//   final passWordController = TextEditingController();
//
//   void checkUserInputs(String Username,BuildContext context) async {
//     print(passWordController.text);
//     isLoading.value = true;
//     if(passWordController.text.length == 0){
//       showFaliureAlertDialog1(context, "Please Enter OTP");
//     }else{
//       var users = await otp(Username, passWordController.text, context);
//       isLoading.value = false;
//     }
//
//   }
//
//   static Future otp(Username, Password, BuildContext context) async {
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request(
//         'POST', Uri.parse(Config().BASE_URL+'/customer_api/verify_otp/'));
//     request.body = json.encode({"username": '$Username', "otp": '$Password'});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     final res = await response.stream.bytesToString();
//
//     print("INPUT  322   :  $Username   $Password");
//     print(res.toString());
//     final status =jsonDecode(res);
//     final statuscode = status['success'] as bool;
//     final errors = status['errors'] as String;
//     print(Username);
//     print(statuscode);
//     if(statuscode==true){
//       print(statuscode);
//       showSuccessAlertDialog(context, Username);
//     }else{
//       print(statuscode);
//       //showSuccessAlertDialog(context, Username);
//       showFaliureAlertDialog1(context, errors);
//     }
//
//   }
//
// }
//
// showSuccessAlertDialog(BuildContext context, String Username) {
//   Widget okButton = TextButton(
//     child: Text("Continue"),
//     onPressed: () {
//       // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MPINCREATION(text: Username,),
//           ));
//
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("OTP VERIFIED SUCCESSFULLY"),
//     content: Text("Please do MPIN creation to complete the login process."),
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
//     title: Text("OTP VERIFICATION FAILURE" ),
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
// showFaliureAlertDialog1(BuildContext context, String errorMsg) {
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {
//     //  Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
//       Navigator.pop(context);
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("OTP VERIFICATION FAILURE" ),
//     content: Text(errorMsg),
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
//
// class OTPVerification extends GetView<OTPController> {
//   final String text;
//   const OTPVerification({Key? key, required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(OTPController());
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
//                       labelText: "OTP",
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
//                       child: const Text("OTP"))
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
//
// }


