import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:neo/Screens/Login/mpin_verification_page.dart';
import 'package:neo/Screens/Welcome/welcome_page.dart';
import 'dart:convert';
import 'package:neo/Screens/WelcomeSlider/welcomeintroslider.dart';
import 'package:neo/helper/colorutility.dart';
import 'package:neo/helper/config.dart';
import 'package:neo/helper/showDialogs.dart';
import '../../helper/networkutitlity.dart';
import '../../helper/sharedprefhelper.dart';
import '../Home/home_activity.dart';

bool isOnline = false;
class SplashScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  int splashtime = 5;
  @override
  initState(){

    // Future.delayed(Duration(seconds: splashtime), () async {
    //   Navigator.pushReplacement(this.context, MaterialPageRoute(
    //       builder: (context){
    //         return IntroScreen();
    //       }));
    // });

    super.initState();
    checkInterNet(this.context);


   // getReseller(context);

  }

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Scaffold(
        body:Container(
            //decoration: new BoxDecoration(color: Colors.red),
           // decoration: const BoxDecoration(color: Color(0xff00BCD1)),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
            alignment: Alignment.center,

            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children:<Widget>[
                  Container(
                    child:SizedBox(
                        height:200,width:200,
                        child:Image.asset("assets/images/logo.png")
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20),
                    //margin top 20
                    child:Text("Neo", style: TextStyle(
                      color:Colors.white,
                      fontSize: 30,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20),
                    //margin top 20
                    child:Text("Stock Management App", style: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                  Container(
                    margin:EdgeInsets.only(top:5),
                    child:Text("Version: 1.0.0", style:TextStyle(
                      color:Colors.white,
                      fontSize: 15,
                    )),
                  ),
                ]
            )
        )
    );
  }



}

Future<void> checkInterNet(context) async {
   isOnline =  await NetworkUtility().checkInternet();
  print("122   :  $isOnline");

  if(isOnline){
    // getReseller(context);
    getMaintainance(context);
  }
  else{

    checkOnlineAlert(context);
  }

}

void getReseller(context) async{

  try {
    print(Config().BASE_URL);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/reseller/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();


      print("RESELLER     "+res.toString());
    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;

    print("statuscode  123     "+statuscode.toString());
    //  print("statuscode  123     "+status['errors'] as String);

    if(statuscode==true){
      var items = status['data'] as List;
      await SharedPreferencesHelper.setId(items[0]['id']?? (throw ArgumentError("id is required")));
       await SharedPreferencesHelper.setdescription(items[0]['description']?? (throw ArgumentError("description is required")));
      // await SharedPreferencesHelper.setfacebook(items[0]['facebook']?? (throw ArgumentError("facebook is required")));
      //
       await SharedPreferencesHelper.setinstagram(items[0]['instagram']?? (throw ArgumentError("instagram is required")));
      await SharedPreferencesHelper.setlogo(items[0]['logo']?? (throw ArgumentError("logo is required")));
      await SharedPreferencesHelper.setmobile(items[0]['mobile']?? (throw ArgumentError("mobile is required")));
      await SharedPreferencesHelper.setaddress(items[0]['address']?? (throw ArgumentError("address is required")));
      await SharedPreferencesHelper.setemail(items[0]['email']?? (throw ArgumentError("email is required")));
      await SharedPreferencesHelper.settesting_url(items[0]['testing_url']?? (throw ArgumentError("testing_url is required")));
      await SharedPreferencesHelper.setimage_storing_url(items[0]['image_storing_url']?? (throw ArgumentError("image_storing_url is required")));
      await SharedPreferencesHelper.setusername(items[0]['username']?? (throw ArgumentError("username is required")));
      await SharedPreferencesHelper.setpassword(items[0]['password']?? (throw ArgumentError("Password is required")));
      await SharedPreferencesHelper.setis_deleted(items[0]['is_deleted']?? (throw ArgumentError("is_deleted is required")));


      bool isLogin = await SharedPreferencesHelper.get_is_login();
      print("RESELLER  1591   :  $isLogin");
      if(isLogin==true){
        print("RESELLER  1592   :  $isLogin");

        var Username = await SharedPreferencesHelper.getmobile();
        print("USER"+Username);

        Future.delayed(Duration(seconds: 5), () async {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MPINVerification(text: Username,),
          //     ));

          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => MPINVerification(text: Username,)));
        });



      }else{

        print("RESELLER  1593   :  $isLogin");
        Future.delayed(Duration(seconds: 5), () async {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context){
                return IntroScreen();
              }));
        });

      }


      // NO need
      // await SharedPreferencesHelper.setcreated_by(items[0]['created_by']?? (throw ArgumentError("created_by is required")));
      // await SharedPreferencesHelper.setcreated_at(items[0]['created_at']?? (throw ArgumentError("created_at is required")));

      // await SharedPreferencesHelper.setupdated_at(items[0]['updated_at']?? (throw ArgumentError("id is updated_at")));
      // await SharedPreferencesHelper.setcreator(items[0]['creator']?? (throw ArgumentError("id is creator")));

      //getMaintainance(context);




    }
    else{
      print("FALSE  123     ");
      ShowDialogs().showAlertDialog(context, status['errors'] as String);
    }

  } catch(e) {
    print('1234    :   $e');
    ShowDialogs().showAlertDialog(context, e.toString());
  }
}



void getMaintainance(context) async {

  try {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(Config().BASE_URL+'/customer_api/maintain/'));
    // request.body = json.encode({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();

    print("getMaintainance  149     "+res.toString());

    final status =jsonDecode(res);
    final statuscode = status['success'] as bool;
    //print(Config.dateCalcutateByMonth(2));
      print(Config.dateCalculateFromDays(1));
    if(statuscode==true){
      var maintain = status['data'] as List;
      var image = maintain[0]['image']?? (throw ArgumentError("image is required"));
      var description = maintain[0]['description']?? (throw ArgumentError("description is required"));
      print('157   :  $statuscode');
      var maintain_type = maintain[0]['maintain_type']?? (throw ArgumentError("maintain_type is required"));
      if(maintain_type == '0' || maintain_type == 0){
        print("1671   : $maintain_type");

        getReseller(context);

      }
      else if(maintain_type == 1 || maintain_type == "1") {
        print("1672   : $maintain_type");
        openCustomDialogClose(context,image,description,maintain_type);
      }
      else{
        openCustomDialog(context,image,description,maintain_type);
      }

    } else{
      //  print("FALSE  123     ");
      ShowDialogs().showAlertDialog(context, status['errors'] as String);
    }

  }catch(e) {
    ShowDialogs().showAlertDialog(context, e.toString());
  }
}



void openCustomDialog(context,image,description,maintain_type) {
   print('openCustomDialog  174   :');
   bool visibilityTag = false;
   showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context) {
         return AlertDialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.all(
               Radius.circular(
                 20.0,
               ),
             ),
           ),
           contentPadding: EdgeInsets.only(
             top: 10.0,
           ),

           content: Container(
             child: SingleChildScrollView(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.all(0.0),
                     child:SizedBox(
                         height:100,width:100,
                        // child:Image.asset("assets/images/logo.png")
                         child:Image.network(Config().BASE_URL+image)
                     ),
                   ),
                   Container(
                     alignment: Alignment.center,
                     padding: const EdgeInsets.fromLTRB(10,10,10,0),
                     child:SizedBox(
                       child: Text(description,textAlign: TextAlign.justify,),
                     )

                   ),


               Container(
                 height: 50,
                 width: double.infinity,
                 margin: new EdgeInsets.fromLTRB(0, 30, 0, 25),
                 child:Row(
                     children:<Widget>[
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                               // Navigator.of(context).pop();
                                SystemNavigator.pop();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:ColorUtility().colorNo,
                                 fixedSize: Size(MediaQuery.of(context).size.width, 40),
                              ),
                              child: Text(
                                "No",
                              ),
                            ),
                          ),
                        ),



                        Expanded(
                          flex: 5,
                         child: Center(
                             child: Visibility(
                                visible: true,
                                 child: ElevatedButton(
                               onPressed: () {
                               //  Navigator.of(context).pop();
                                 if(maintain_type == 2 || maintain_type == "2"){
                                   //Warning
                                   // Future.delayed(Duration(seconds: 1), () async {
                                   //   Navigator.pushReplacement(context, MaterialPageRoute(
                                   //       builder: (context){
                                   //         return IntroScreen();
                                   //       }));
                                   // });


                                   getReseller(context);
                                 }
                                 else if(maintain_type == 3 || maintain_type == "3"){
                                    // Updation
                                   // Future.delayed(Duration(seconds: 1), () async {
                                   //   Navigator.pushReplacement(context, MaterialPageRoute(
                                   //       builder: (context){
                                   //         return IntroScreen();
                                   //       }));
                                   // });
                                   getReseller(context);
                                 }
                                 // else {
                                 //   // Updation
                                 //   Future.delayed(Duration(seconds: 1), () async {
                                 //     Navigator.pushReplacement(context, MaterialPageRoute(
                                 //         builder: (context){
                                 //           return IntroScreen();
                                 //         }));
                                 //   });
                                 // }

                               },
                               style: ElevatedButton.styleFrom(
                                 primary: ColorUtility().colorYes,
                                 fixedSize: Size(MediaQuery.of(context).size.width, 40),
                               ),

                               child: Text(
                                 "Yes",
                               ),
                             ))

                         ),
                       )
                     ]
                 )

               )






                 ],
               ),
             ),
           ),
         );
       });





}

void openCustomDialogClose(context,image,description,maintain_type) {
  print('openCustomDialogClose  174   :');
  bool visibilityTag = false;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),

          content: Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0.0),
                    child:SizedBox(
                        height:100,width:100,
                        // child:Image.asset("assets/images/logo.png")
                        child:Image.network(Config().BASE_URL+image)
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                      child:SizedBox(
                        child: Text(description,textAlign: TextAlign.justify,),
                      )

                  ),

                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(20,20,20,30),
                      child:SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              SystemNavigator.pop();

                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorUtility().colorNo,
                               //fixedSize: Size(double.infinity, 40),
                            ),
                            child: Text(
                              "Close",
                            ),
                          )
                      )

                  ),



                ],
              ),
            ),
          ),
        );
      });





}


void checkOnlineAlert(context) {
  print('openCustomDialog  174   :');
  bool visibilityTag = false;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),

          content: Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0.0),
                    child:SizedBox(
                        height:100,width:100,
                        // child:Image.asset("assets/images/logo.png")
                         child:Image.asset("assets/images/wifi_router.png")

                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10,20,10,0),
                      child:SizedBox(
                        child: Text(Config().msg_check_internet,textAlign: TextAlign.center,),
                      )

                  ),


                  Container(
                      height: 50,
                      width: double.infinity,
                      margin: new EdgeInsets.fromLTRB(0, 30, 0, 25),
                      child:Row(
                          children:<Widget>[
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                    SystemNavigator.pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:ColorUtility().colorNo,
                                    fixedSize: Size(100, 40),
                                  ),
                                  child: Text(
                                    "Close",
                                  ),
                                ),
                              ),
                            ),



                            Expanded(
                              flex: 5,
                              child: Center(
                                  child: Visibility(
                                      visible: true,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                         // checkInterNet(context);
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new SplashScreen()),);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorUtility().colorYes,
                                          fixedSize: Size(100, 40),
                                        ),
                                        child: Text(
                                          "Retry",
                                        ),
                                      ))

                              ),
                            )
                          ]
                      )

                  )






                ],
              ),
            ),
          ),
        );
      });





}