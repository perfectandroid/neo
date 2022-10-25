import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:neo/Screens/Login/otp_page.dart';
import 'package:neo/constants.dart';
import 'package:neo/helper/colorutility.dart';

import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';

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
    if(statuscode==true){
      print(statuscode);
      print(status['data']['id']);
      showSuccessAlertDialog(context, Username,status);
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

showSuccessAlertDialog(BuildContext context, String Username, status) {





  Widget okButton = TextButton(
    child: Text("Continue"),
    onPressed: () async{
      try {

        var ss = status['data']["id"];
        print('login  :   $ss');


        await SharedPreferencesHelper.setAgent_id(status['data']["id"]?? (throw ArgumentError("id is required")));
        await SharedPreferencesHelper.setAgent_name(status['data']["name"]?? (throw ArgumentError("name is required")));
        await SharedPreferencesHelper.setAgent_mobile_number(status['data']["mobile_number"]?? (throw ArgumentError("mobile_number  is required")));
        await SharedPreferencesHelper.setAgent_email(status['data']["email"]?? (throw ArgumentError("email is required")));
        await SharedPreferencesHelper.setAgent_token(status['data']["token"]?? (throw ArgumentError("token is required")));
        await SharedPreferencesHelper.setAgent_user_type(status['data']["user_type"]?? (throw ArgumentError("user_type is required")));
        await SharedPreferencesHelper.setAgent_image(status['data']["image"]?? (throw ArgumentError("image is required")));


        //SESSION
      //  await SharedPreferencesHelper.set_is_login(true);

        var token = await SharedPreferencesHelper.getAgent_token();
        print("TOKEN LOGIN"+token);
        String mobileNo = status['data']["mobile_number"].toString();


        // Navigator.push(context, MaterialPageRoute(builder: (_) => const OTPVerification()));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPVerification(text: Username,mobileNo : mobileNo),
            ));
      }
      catch(e)
      {

        debugPrint("113   :   "+e.toString());
      }
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
    bool boolPass = true;

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
                    width: MediaQuery.of(context).size.height/4,
                    height: MediaQuery.of(context).size.height/4,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 100,
                        child: Image.asset('assets/images/logo.png')),//Text
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/10,MediaQuery.of(context).size.width/10,0),
                    height: MediaQuery.of(context).size.height/16,
                    child:  TextField(
                      cursorColor: ColorUtility().colorAppbar,
                      decoration: InputDecoration(
                        labelText: "Username",
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
                      controller: controller.eMailController,
                    )
                  ),//Text

                  Container(
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10,MediaQuery.of(context).size.height/50,MediaQuery.of(context).size.width/10,0),
                      height: MediaQuery.of(context).size.height/16,
                      child:  TextField(
                        cursorColor: ColorUtility().colorAppbar,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035,color: Colors.grey.shade400),
                          prefixIcon: Icon(Icons.lock, size: 24,color: Colors.grey),
                          // suffixIcon: IconButton(
                          //     icon: Icon(Icons.remove_red_eye),
                          //     onPressed: () {
                          //       controller.passWordController.clear();
                          //
                          //     }
                          // ),

                          suffixIcon: IconButton(
                              icon: Icon(boolPass == true?Icons.remove_red_eye:Icons.password),
                              onPressed: () {
                                  if(boolPass){ //if passenable == true, make it false
                                    boolPass = false;
                                  }else{
                                    boolPass = true; //if passenable == false, make it true
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
                        obscureText: false,
                        controller: controller.passWordController,
                      )
                  ),//Text


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
                                child: Text('Login',style:TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                                style: ElevatedButton.styleFrom(primary: ColorUtility().colorAppbar),
                                onPressed: () {
                                  // controller.checkUserInputs(context);
                                  controller.checkUserInputs(context);
                                },
                              ),
                            ),
                          ]
                      )

                  ),


                ],
              ),
            ),
          )),

    );
  }

}


