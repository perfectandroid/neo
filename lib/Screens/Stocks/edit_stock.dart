

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/colorutility.dart';

class EditStock extends StatefulWidget{

  // EditStock({required this.email, required this.pass});
  //
  // final String email;
  // final String pass;
  // //SockReportListModel sockReportListModel = SockReportListModel();

  String id;
  String status;
  EditStock({required this.id,required this.status});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditStock();
  }
}

class _EditStock extends State<EditStock>{
  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtility().colorAppbar,
          title: Text("Stock Edit"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,true);
            },
            icon: Icon(Icons.arrow_back),
          ),

        ),

        body: Center(child : getBody())


    );
  }

  Widget getBody(){
    return Stack(
        children: <Widget>[
          new Container(

          )
        ]
    );
  }

}