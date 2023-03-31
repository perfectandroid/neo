
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/colorutility.dart';


class Config {
   
 // var BASE_URL = "http://202.164.150.222:8002";
 // var BASE_URL = "http://202.164.150.222:8000";
 // var BASE_URL = "http://202.164.150.222:8001";
 // var BASE_URL = "http://10.1.11.151:8000";
    var BASE_URL = "http://202.164.150.65:8000";
 // var BASE_URL = "https://neoecommerce.perfectlimited.com";

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

  static String splitDateFormate(String timeStamp){

    String date_and_time = timeStamp;
    
    String timeStampTime =  timeStamp.split("T")[1];
    String exactTime = timeStampTime.replaceRange(8, timeStampTime.length, "");
    
    String getdate = DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.parse(timeStamp.split("T")[0] + " " + exactTime).toLocal());
    // DateTime dateTime = DateTime.parse(timeStampTime).toLocal();
    String date  =  getdate.split(" ")[0];
    String time =  getdate.split(" ")[1];
    // String time = DateFormat.jm().format(dateTime).toString();;
    // print(date + "  " + time);
    
    //String getTime = timeConvertToStandard(time); 
    return getdate;
  }

  static String dateFormate(String date){
    String getDate = DateFormat("dd-MM-yyyy").format(DateTime.parse(date.split("T")[0]).toLocal());
    return getDate;
  }

  static String timeConvertToStandard(String time){

    String correctTime = DateFormat("h:mma").format(DateTime.parse(time));
    return correctTime;
  }

  static String priceFormate(String amount){
    String num = amount;
    double doubleVal = double.parse(num);
    //print('Result: ${doubleVal.toStringAsFixed(2)}');
    String getAmount = doubleVal.toStringAsFixed(2);
    return getAmount;
  }

   static Color statusColor(String status){
     print(status);
     Color currrntColor = Colors.black;
     currrntColor = status == "pending" ? ColorUtility().colorAppbar : 
                    status == "verified" ? ColorUtility().colorVerified :
                    status == "packed" ? ColorUtility().colorPacked : 
                    status == "dispatched" ? ColorUtility().colorDispatched :
                    status == "delivered" ? ColorUtility().colorDelivered : 
                    status == "order_cancelled" ? ColorUtility().colorWarning : Colors.black;

      return currrntColor;              

  }

  static List<String> dateCalculateFromDays(int ofDays){
    
    
    DateTime currentDays = DateTime.now();
    String toDay = DateFormat("dd-MM-yyyy").format(currentDays);
    DateTime lastofDays = DateTime.now().subtract(Duration(days: ofDays));
    String numberOfDays = DateFormat("dd-MM-yyyy").format(lastofDays);
    List<String> daysArray = [];
    daysArray.add(numberOfDays);
    daysArray.add(toDay);
    print(daysArray);
    return daysArray;
  }

  static List<String> dateCalcutateByMonth(int ofMonth){

    var now = DateTime.now();
    String toDay = DateFormat("dd-MM-yyyy").format(now);
    //var monthCalculate = DateTime(now.year,now.month - ofMonth,now.day);
    var monthCalculate = DateTime(now.year,now.month - ofMonth,ofMonth == 0 ? 1 : now.day);
    String monthCheck = DateFormat("dd-MM-yyyy").format(monthCalculate);
    List<String> monthArray = [];
    monthArray.add(monthCheck);
    monthArray.add(toDay);
    return monthArray;
  }

  static String apiConvertedDateFormate(String date){

    //DateTime date_formate = new DateFormat("yyyy-MM-dd").parse(date);
    
    return convertDateFormat(date, "dd-MM-yyyy", "yyyy-MM-dd");


  }

  static String convertDateFormat(String dateTimeString, String oldFormat, String 
           newFormat) {
        DateFormat newDateFormat = DateFormat(newFormat);
        DateTime dateTime = DateFormat(oldFormat).parse(dateTimeString);
        String selectedDate = newDateFormat.format(dateTime);
        return selectedDate;
            
        }
  

}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}