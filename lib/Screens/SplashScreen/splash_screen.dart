import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/Screens/WelcomeSlider/welcomeintroslider.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  int splashtime = 5;

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return IntroScreen();
          }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child:Text("Best shopping experience ever.", style: TextStyle(
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