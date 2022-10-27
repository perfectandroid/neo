import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/colorutility.dart';

class ContactUs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _ContactUs();
  }
}

class _ContactUs extends State<ContactUs>{
  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            // height: double.infinity,
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: ColorUtility().colorAppbar,
            // decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/images/loginbg.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    flex: 3,
                    child:  Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
                            boxShadow: [new BoxShadow(
                              color: ColorUtility().colorAppbar,
                            )]
                        ),




                    )
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.height/13),topRight: Radius.circular(MediaQuery.of(context).size.height/13)),
                            boxShadow: [new BoxShadow(
                              color: Colors.white,
                            )]
                        ),
                      
                      //Text
                    )
                  ),




                ],
              ),
            ),
          )),
    );
  }


}