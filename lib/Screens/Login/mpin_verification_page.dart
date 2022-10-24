import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/constants.dart';

import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';


var TAG = "MPINVerificationController";
class MPINVerificationController extends GetxController {

  var isLoading = false.obs;
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();

  void checkUserInputs(String Username,BuildContext context) async {
    print(passWordController.text);
    isLoading.value = true;
    var users = await mpin(Username, passWordController.text, context);
    isLoading.value = false;
  }

  static Future mpin(Username, Password, BuildContext context) async {

    print(Username);
    print(Password);
    print("gjjghjghjghjghj");


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
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new DrawerActivity()));

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DrawerActivity(),
        //     ));
      }catch(e) {
        ShowDialogs().showAlertDialog(context, e.toString());
      }

    }else{
      showFaliureAlertDialog(context, errors);
    }

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

showFaliureAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => DrawerActivity()));
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("MPIN VERIFICATION FAILURE" ),
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

class MPINVerification extends GetView<MPINVerificationController> {
  final String text;
  const MPINVerification({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MPINVerificationController());
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
                      labelText: "MPIN",
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
                      onPressed: () async {
                        String username = await SharedPreferencesHelper.getAgent_mobile_number();
                        controller.checkUserInputs(username,context);
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          )),
    );
  }

}


