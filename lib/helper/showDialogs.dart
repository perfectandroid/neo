import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo/Screens/Home/home_page.dart';
import 'package:overlay_progress_indicator/overlay_progress_indicator.dart';

import 'colorutility.dart';
class ShowDialogs {



  showAlertDialog(BuildContext context,String messsage) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),

      content: Text(""+messsage),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  showProgressDialog(BuildContext context,String msg,bool isLoading) {

    if(isLoading){
      OverlayProgressIndicator.show(
        context: context,
        backgroundColor: Colors.black45,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Center(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(50),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[

                                              Center(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    width: MediaQuery.of(context).size.width * 0.8,
                                                    child:SizedBox(
                                                        height:100,width:100,
                                                        child:Image.asset("assets/images/spinner.gif")
                                                    ),

                                                  )
                                              ),

                                              Center(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                                    alignment: Alignment.center,
                                                    child:Text(""+msg, style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.03,letterSpacing: .1,color: ColorUtility().colorAppbar),),

                                                  )
                                              ),

                                            ]
                                        )
                                    )

                                )
                            ),




                          ]
                      )
                  ),
                )
              ]

          ),
        ),
      );
    }
    else{
      OverlayProgressIndicator.hide();
    }

  }

  void Warning(context, String heading, String message, HomePage homePage) {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.all(15.0),
                        child: Text(message, style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                      ),



                    ]
                ),
              ),
            ),
          ),
        );
      },
    );

    // Widget okButton = FlatButton(
    //   child: Text("OK"),
    //   onPressed: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => homePage,));
    //   },
    // );  // set up the AlertDialog
    // AlertDialog alert = AlertDialog(
    //   title: Text(""+heading),
    //   content: Text(""+message),
    //   actions: [
    //     okButton,
    //   ],
    // );  // show the dialog
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );

    // Widget okButton = TextButton(
    //   child: Text("OK"),
    //   onPressed: () {
    //     // Navigator.pop(context,true);
    //     //   Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => homePage,));
    //   },
    // );
    // AlertDialog alert = AlertDialog(
    //   title: Text(heading),
    //   content: Text(message),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );

  }

}
