import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtility {

  Future<bool> checkInternet() async {
    var _internetAvail = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      _internetAvail = true;
      print("Internet is available");
      return _internetAvail;

    } else if (connectivityResult == ConnectivityResult.wifi) {

      _internetAvail = true;
      print("Internet is available");
      return _internetAvail;
    }else{

      _internetAvail = false;
      print("Sorry, Internet is not available");
      return _internetAvail;
    }
  }



}