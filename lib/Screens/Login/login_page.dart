import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:neo/Screens/Login/otp_page.dart';
import 'package:neo/constants.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();

  void checkUserInputs(BuildContext context) async {
    print(eMailController.text);
    print(passWordController.text);
    isLoading.value = true;
    var users = await login(eMailController.text, passWordController.text, context);
    isLoading.value = false;
  }

  static Future login(Username, Password,BuildContext context ) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://202.164.150.222:8000/customer_api/login/'));
    request.body = json.encode({"username": "$Username", "password": '$Password'});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();

    print(res.toString());
    print("300   : $response");
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    final errors = status['errors'] as String;
    if(statuscode==true){
      print(statuscode);
      showSuccessAlertDialog(context, Username);
    }else{
      print(statuscode);
     // showSuccessAlertDialog(context, Username);
      showFaliureAlertDialog(context, errors);
    }
  }
}

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
   //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("LOGIN FAILURE" ),
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

showSuccessAlertDialog(BuildContext context, String Username) {
  Widget okButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
     // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerification(text: Username,),
          ));

    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("LOGIN SUCCESSFULLY"),
    content: Text("Please do OTP verification to complete the login process."),
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

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                  SizedBox(height: 16,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
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
                        controller.checkUserInputs(context);
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
          )),
    );
  }

}
