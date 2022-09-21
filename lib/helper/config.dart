

import 'package:shared_preferences/shared_preferences.dart';

class Config {

  var BASE_URL = "http://202.164.150.222:8000";

  var msg_check_internet = "No Internet Connection,make sure that Wi-fi or Mobile data is turned on ,then try again";

  var prefs ="";
  getCredential() async  {
    // prefs = (await SharedPreferences.getInstance()) as String;
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  

}