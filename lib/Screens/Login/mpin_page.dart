import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:neo/constants.dart';

import '../../helper/config.dart';

class MPINController extends GetxController {

  var isLoading = false.obs;
  final eMailController = TextEditingController();
  final passWordController = TextEditingController();

  void checkUserInputs() async {
    //print(eMailController.text);
    print(passWordController.text);
    isLoading.value = true;
    var users = await mpin(/*eMailController.text,*/ passWordController.text);
    isLoading.value = false;
  }

  static Future mpin(/*Username,*/ Password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(Config().BASE_URL+'/customer_api/login/'));
    request.body = json.encode({/*"username": "$Username",*/ "password": '$Password'});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    print(statuscode);
    if(statuscode==true){
    }else{      /*Login();*/
    }
    // print(res);
    // print('${status.runtimeType} : $status');


    // if (response.statusCode == 200) {
    //   print(res);
    // } else {
    //   print(response.statusCode);
    // }
  }

}

class MPINVerifications extends GetView<MPINController> {
  const MPINVerifications({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MPINController());
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
                      onPressed: () {
                        controller.checkUserInputs();
                      },
                      child: const Text("MPIN"))
                ],
              ),
            ),
          )),
    );
  }

}








// import 'package:flutter/material.dart';
// import 'package:neo/Screens/Register/signup_page.dart';
// import '../../constants.dart';
//
// class LoginPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.only(left: 16,right: 16),
//
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                     color: Colors.grey.shade200,
//                     offset: Offset(2, 4),
//                     blurRadius: 5,
//                     spreadRadius: 2)
//               ],
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [PrimaryColor, PrimaryLightColor])),
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(height: 50,),
//                   Text("Welcome,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 6,),
//                 //Text("Sign in to continue!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "Email ID",
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
//                   ),
//                   SizedBox(height: 16,),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "Password",
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
//                   ),
//                   SizedBox(height: 12,),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Text("Forgot Password ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
//                   ),
//                   SizedBox(height: 30,),
//                   Container(
//                     height: 50,
//                     width: double.infinity,
//                     child: FlatButton(
//                       onPressed: (){},
//                       padding: EdgeInsets.all(0),
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           gradient: LinearGradient(
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                             colors: [
//                               Color(0xffff5f6d),
//                               Color(0xffff5f6d),
//                               Color(0xffffc371),
//                             ],
//                           ),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
//                           child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                         ),
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16,),
//                   SizedBox(height: 30,),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("I'm a new user.",style: TextStyle(fontWeight: FontWeight.bold),),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return SignupPage();
//                         }));
//                       },
//                       child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }