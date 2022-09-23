

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
class SharedPreferencesHelper {

  ////////// CLEAR DATA

  static Future<bool> logout() async {
    print('Logout : ');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  ////////// SESSION DATA DATA

  static Future<bool> set_is_login(bool value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("is_login", value);
  }

  static Future<bool>get_is_login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_login");
  }

  static Future<bool>remove_is_login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("is_login");
  }

  ////////// RESELLER DATA

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
    String value = prefs.getString("facebook") ?? "";
    return value;
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

  static Future<bool> settesting_url(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("testing_url", value);
  }

  static Future<String>gettesting_url() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("testing_url");
  }

  static Future<bool>removetesting_url() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("testing_url");
  }


  ////////////

  static Future<bool> setimage_storing_url(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("image_storing_url", value);
  }

  static Future<String>getimage_storing_url() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("image_storing_url");
  }

  static Future<bool>removeimage_storing_url() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("image_storing_url");
  }


  ////////////

  static Future<bool> setusername(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("username", value);
  }

  static Future<String>getusername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  static Future<bool>removeusername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("username");
  }



  ////////////

  static Future<bool> setpassword(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("password", value);
  }

  static Future<String>getpassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("password");
  }

  static Future<bool>removepassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("password");
  }



  ////////////

  static Future<bool> setis_deleted(bool value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("is_deleted", value);
  }

  static Future<bool>getis_deleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_deleted");
  }

  static Future<bool>removeis_deleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("is_deleted");
  }



  ////////////   Agent LoginDetails


  static Future<bool> setAgent_id(int value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("id", value);
  }

  static Future<int>getAgent_id() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id");
  }

  static Future<bool>removeAgent_id() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("id");
  }





  ////////////

  static Future<bool> setAgent_name(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("name", value);
  }

  static Future<String>getAgent_name() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<bool>removeAgent_name() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }

  ////////////

  static Future<bool> setAgent_mobile_number(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("mobile_number", value);
  }

  static Future<String>getAgent_mobile_number() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile_number");
  }

  static Future<bool>removeAgent_mobile_number() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("mobile_number");
  }


  ////////////

  static Future<bool> setAgent_email(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", value);
  }

  static Future<String>getAgent_email() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  static Future<bool>removeAgent_email() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("email");
  }


  ////////////

  static Future<bool> setAgent_token(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", value);
  }

  static Future<String>getAgent_token() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<bool>removeAgent_token() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("token");
  }


  ////////////

  static Future<bool> setAgent_user_type(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_type", value);
  }

  static Future<String>getAgent_user_type() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_type");
  }

  static Future<bool>removeAgent_user_type() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user_type");
  }

  ////////////

  static Future<bool> setAgent_image(String value) async {
    print('values :  $value');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("image", value);
  }

  static Future<String>getAgent_image() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("image");
  }

  static Future<bool>removeAgent_image() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("image");
  }




////////////

  // static Future<bool> setcreated_at(String value) async {
  //   print('values :  $value');
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString("created_at", value);
  // }
  //
  // static Future<String>getcreated_at() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("created_at");
  // }
  //
  // static Future<bool>removecreated_at() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.remove("created_at");
  // }





}