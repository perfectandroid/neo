

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
class SharedPreferencesHelper {

  static Future<bool> setId(int value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("id", value);
  }

  static Future<int>getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id");
  }

  static Future<bool>removeId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove
      ("id");
  }

  //////////

  static Future<bool> setdescription(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("description", value);
  }

  static Future<String>getdescription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("description");
  }

  static Future<bool>removedescription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("description");
  }

////////////

  static Future<bool> setfacebook(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("facebook", value);
  }

  static Future<String>getfacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("facebook");
  }

  static Future<bool>removefacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("facebook");
  }

  ////////////

  static Future<bool> setinstagram(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("instagram", value);
  }

  static Future<String>getinstagram() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("instagram");
  }

  static Future<bool>removeinstagram() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("instagram");
  }

  ////////////

  static Future<bool> setlogo(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("logo", value);
  }

  static Future<String>getlogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("logo");
  }

  static Future<bool>removelogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("logo");
  }



  ////////////

  static Future<bool> setmobile(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("mobile", value);
  }

  static Future<String>getmobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile");
  }

  static Future<bool>removemobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("mobile");
  }



  ////////////

  static Future<bool> setaddress(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("address", value);
  }

  static Future<String>getaddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("address");
  }

  static Future<bool>removeaddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("address");
  }


  ////////////

  static Future<bool> setemail(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", value);
  }

  static Future<String>getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  static Future<bool>removeemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("email");
  }


  ////////////

  static Future<bool> setis_deleted(bool value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("facebook", value);
  }

  static Future<bool>getis_deleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("facebook");
  }

  static Future<bool>removeis_deleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("is_deleted");
  }



  ////////////

  static Future<bool> setcreated_by(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("created_by", value);
  }

  static Future<String>getcreated_by() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("created_by");
  }

  static Future<bool>removecreated_by() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("created_by");
  }



  ////////////

  static Future<bool> setcreated_at(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("created_at", value);
  }

  static Future<String>getcreated_at() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("created_at");
  }

  static Future<bool>removecreated_at() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("created_at");
  }





}