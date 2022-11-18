
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {

   var BASE_URL = "http://202.164.150.222:8000";
 // var BASE_URL = "http://202.164.150.222:8001";
 //  var BASE_URL = "http://10.1.11.151:8000";

 // var BASE_URL = "http://202.164.150.222:8001";

  var msg_check_internet = "No Internet Connection,make sure that Wi-fi or Mobile data is turned on ,then try again";

  var prefs ="";
  getCredential() async  {
    // prefs = (await SharedPreferences.getInstance()) as String;
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  getScreenHeight(BuildContext context){
    int screenHeight = MediaQuery.of(context).size.height as int;
  }

  getScreenWidth(BuildContext context){
    int screenWidth = MediaQuery.of(context).size.width as int;
  }


  

}