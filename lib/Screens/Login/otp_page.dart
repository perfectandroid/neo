import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/mpin_set_page.dart';
import 'package:neo/constants.dart';

import '../../helper/config.dart';

class OTPController extends GetxController {

  var isLoading = false.obs;
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();

  void checkUserInputs(String Username,BuildContext context) async {
    print(passWordController.text);
    isLoading.value = true;
    if(passWordController.text.length == 0){
      showFaliureAlertDialog1(context, "Please Enter OTP");
    }else{
      var users = await otp(Username, passWordController.text, context);
      isLoading.value = false;
    }

  }

  static Future otp(Username, Password, BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(Config().BASE_URL+'/customer_api/verify_otp/'));
    request.body = json.encode({"username": '$Username', "otp": '$Password'});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();

    print("INPUT  322   :  $Username   $Password");
    print(res.toString());
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;
    print(Username);
    print(statuscode);
    if(statuscode==true){
      print(statuscode);
      showSuccessAlertDialog(context, Username);
    }else{
      print(statuscode);
      //showSuccessAlertDialog(context, Username);
      showFaliureAlertDialog1(context, errors);
    }

  }

}


showSuccessAlertDialog(BuildContext context, String Username) {
  Widget okButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
      // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MPINCREATION(text: Username,),
          ));

    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("OTP VERIFIED SUCCESSFULLY"),
    content: Text("Please do MPIN creation to complete the login process."),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("OTP VERIFICATION FAILURE" ),
    content: Text(errorMsg),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showFaliureAlertDialog1(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
    //  Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("OTP VERIFICATION FAILURE" ),
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

class OTPVerification extends GetView<OTPController> {
  final String text;
  const OTPVerification({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    return Scaffold(
      body: SafeArea(
          child: Container(
            // color: Colors.white,
            // height: double.infinity,
            // width: double.infinity,

            padding: EdgeInsets.only(left: 16,right: 16),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [PrimaryColor, PrimaryLightColor])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

/*
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      ),
                    ),
                    obscureText: true,
                    controller: controller.eMailController,

                  ),
*/
                  SizedBox(height: 16,),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "OTP",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      ),
                    ),
                    obscureText: true,
                    controller: controller.passWordController,

                  ),
                  SizedBox(height: 16,),



                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        controller.checkUserInputs(text,context);
                      },
                      child: const Text("OTP"))
                ],
              ),
            ),
          )),
    );
  }

}


