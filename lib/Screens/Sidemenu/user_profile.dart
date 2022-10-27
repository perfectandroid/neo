import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/colorutility.dart';

class UserProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _UserProfile();
  }
}

class _UserProfile extends State<UserProfile>{

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,

                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Center(
                           child: Container(
                               width: MediaQuery.of(context).size.height/5,
                               height: MediaQuery.of(context).size.height/5,
                               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/15),
                               padding: EdgeInsets.all(1),
                               decoration: new BoxDecoration(
                                   borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height/10),
                                   boxShadow: [new BoxShadow(
                                     color: Colors.grey,
                                   )]
                               ),

                               child: CircleAvatar(
                                   backgroundColor: Colors.white,
                                   radius: MediaQuery.of(context).size.height/15,
                                   child: Image.asset('assets/images/logo.png',width: MediaQuery.of(context).size.height/6,height: MediaQuery.of(context).size.height/6,))//Text
                           )
                         ),
                         Center(
                             child: Container(
                               margin: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height/25,0,0),
                               padding: const EdgeInsets.fromLTRB(0,0,0,0),
                               alignment: Alignment.center,
                               child:Text("Perfect Software Solutions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.025,letterSpacing: .1,color: ColorUtility().colorBlack1))

                             )
                         ),
                         Center(
                             child: Container(
                               margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,0,0),
                               padding: const EdgeInsets.fromLTRB(0,0,0,0),
                               alignment: Alignment.center,
                               child:Divider( color: ColorUtility().colorBlack1,height: 1)

                             )
                         ),
                         Container(
                             margin: EdgeInsets.fromLTRB(0,0,0,0),
                             padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/10,0,0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                               Icon(Icons.location_on_outlined, color: Colors.grey ,size: 24),
                               Flexible(
                                 child: new Container(
                                   padding: new EdgeInsets.only(right: 0),
                                   child: new Text("19/1194, Dialysis Center, Chalappuram, Kozhikode, Kerala 673002",
                                     style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                         letterSpacing: .1,color: Colors.grey),maxLines: 3)
                                 ),
                               )

                               ],
                             )

                         ),
                         Container(
                             margin: EdgeInsets.fromLTRB(0,0,0,0),
                             padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,0,0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Icon(Icons.phone_iphone_rounded, color: Colors.grey, size: 24),
                                 Flexible(
                                   child: new Container(
                                       padding: new EdgeInsets.only(right: 0),
                                       child: new Text("93872 22047",
                                         style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                             letterSpacing: .1,color: Colors.grey),maxLines: 3)
                                   ),
                                 )

                               ],
                             )

                         ),
                         Container(
                             margin: EdgeInsets.fromLTRB(0,0,0,0),
                             padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8,MediaQuery.of(context).size.height/50,0,0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Icon(Icons.email_outlined, color: Colors.grey, size: 24),
                                 Flexible(
                                   child: new Container(
                                       padding: new EdgeInsets.only(right: 0),
                                       child: new Text("contact@perfectlimited.com",
                                         style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.height * 0.02,
                                             letterSpacing: .1,color: Colors.grey),maxLines: 3)
                                   ),
                                 )

                               ],
                             )

                         )


                       ]
                   )




                  )
                ]
            )

          )),
    );
  }


}