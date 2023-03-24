import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:neo/Screens/Stocks/report_stock.dart';

import '../../helper/colorutility.dart';
import '../../helper/config.dart';
import '../../helper/sharedprefhelper.dart';
import '../../helper/showDialogs.dart';
import 'SockReportListModel.dart';
import 'package:http/http.dart' as http;

class StockEditController extends GetxController {
  SockReportListModel stockModel = SockReportListModel();
  int index =0;
  TextEditingController textMrpController = TextEditingController();
  TextEditingController textQtyController = TextEditingController();
}

class StockEdit extends StatefulWidget{

  int pos;
  SockReportListModel model;
  StockEdit({required this.model,required this.pos});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StockEdit();
  }

}

class _StockEdit extends State<StockEdit>{

  initState(){
    final controller = Get.put(StockEditController());
    controller.stockModel  = widget.model;
    controller.index  = widget.pos;

    controller.textQtyController.text = (widget!.model?.data?[widget.pos].curQty).toString();
    controller.textMrpController.text = Config.priceFormate((widget!.model?.data?[widget.pos].stkMrp).toString());

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
          )
        ),
        body: Center(child : getBody())
    );
  }

  Widget getBody(){
    return Stack(
        children: <Widget>[
          new Card(
            elevation: 2,
            shadowColor: Colors.black,
            color: Colors.white,
            child: Container(

              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        color: Colors.white,
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[

                                        Product(),
                                        Category(),
                                        SubCategory(),
                                        Mrp(),
                                        Quatity(),
                                        buttons()

                                      ]
                                  )
                              )
                          )
                      )





                    ]
                  )
              )
            )
          )
        ]
    );
  }

  Widget Product(){
    return Container(
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,15,4,10),
                    child:Text("Product", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              ),

              Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(4,15,4,10),
                  child:Text(":", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
              ),

              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,15,4,10),
                    child:Text(""+(widget.model?.data?[widget.pos].product).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              )
            ]
        )
    );
  }

  Widget Category(){
    return Container(
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              ),

              Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(4,0,4,10),
                  child:Text(":", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
              ),

              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text(""+(widget.model?.data?[widget.pos].category).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              )
            ]
        )
    );
  }

  Widget SubCategory(){
    return Container(
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text("Subcatogory", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              ),

              Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(4,0,4,10),
                  child:Text(":", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
              ),

              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text(""+(widget.model?.data?[widget.pos].subCategory).toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              )
            ]
        )
    );
  }

  Widget Mrp(){
    final controller = Get.put(StockEditController());
    return Container(
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text("MRP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              ),

              Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(4,0,4,10),
                  child:Text(":", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
              ),

              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,4),

                  child : SizedBox(
                      width: 200.0,
                      height: 40,
                      child:TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 0.5)
                          ),
                          hintText: 'MRP',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorUtility().colorAppbar,width: 0.5
                              )
                          ),
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black),
                        textAlign: TextAlign.left,
                        controller: controller.textMrpController,
                      )
                  )

                ),
              )
            ]
        )
    );
  }

  Widget Quatity(){
    final controller = Get.put(StockEditController());
    return Container(

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),
                    child:Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
                ),
              ),

              Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(4,0,4,10),
                  child:Text(":", style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black))
              ),

              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(4,0,4,10),

                  child : SizedBox(
                      width: 200.0,
                      height: 40,
                      child:TextFormField(

                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                          LengthLimitingTextInputFormatter(5),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 0.5)
                          ),
                          hintText: 'Quantity',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorUtility().colorAppbar,width: 0.5
                              )
                          ),
                        ),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: MediaQuery.of(context).size.width * 0.04,letterSpacing: .1,color: Colors.black),
                        controller: controller.textQtyController,
                        textAlign: TextAlign.left,
                      )
                  )

                ),
              )
            ]
        )
    );
  }

  Widget buttons(){
    return Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
        padding: const EdgeInsets.fromLTRB(4,0,4,10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded( // Place `Expanded` inside `Row`
                child : SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ColorUtility().colorAppbar, // background
                          onPrimary: Colors.white
                      ),
                      child: Text('RESET'),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          final controller = Get.put(StockEditController());
                          controller.textQtyController.text = (widget.model?.data?[widget.pos].curQty).toString();
                          controller.textMrpController.text = Config.priceFormate((widget!.model?.data?[widget.pos].stkMrp).toString());
                        });
                      },
                    )
                )
            ),
            Container(
              width: 20,
            ),
            Expanded( // Place 2 `Expanded` mean: they try to get maximum size and they will have same size
              child : SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorUtility().colorAppbar, // background
                      onPrimary: Colors.white
                  ),
                  child: Text('SUBMIT'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    validator();
                  },
                )
              )

            )
          ],
        )
    );
  }

  Future<void> validator() async {

    final controller = Get.put(StockEditController());
    if(controller.textMrpController.text.isEmpty){
      validateMessage(context,"Enter valid MRP");
    }else if(controller.textQtyController.text.isEmpty){
      validateMessage(context,"Enter valid Quantity");
    }else{
      print("Success");
      var users = await editStockReport(widget.model?.data?[widget.pos].stockId,controller.textMrpController.text.toString(), controller.textQtyController.text.toString(), context);
    }
  }

  void validateMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content:  Text(''+message,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      backgroundColor: ColorUtility().colorWarning,
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: '',
        onPressed: () async {
          // Some code to undo the change.

        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> editStockReport(stockId,stk_mrp,cur_qty,BuildContext context ) async {

    try{
      print(stk_mrp+'    11254   '+cur_qty);

      ShowDialogs().showProgressDialog(context,"Loading....",true);
      var headers = {'Content-Type': 'application/json'};
      var product_id = (widget.model?.data?[widget.pos].productId).toString();
      var category_id = (widget.model?.data?[widget.pos].categoryId).toString();
      var sub_category_id = (widget.model?.data?[widget.pos].subCategoryId).toString();
      var created_by = (widget.model?.data?[widget.pos].createdBy).toString();
      var paymentMethod = (widget.model.data?[widget.pos].paymentMethod);

      var bodyString = {"product":"$product_id","category":"$category_id","sub_category":"$sub_category_id","payment_method":"$paymentMethod",
        "stk_mrp":"$stk_mrp","cur_qty":"$cur_qty","created_by":"$created_by","cancel_by":"$created_by","updated_by":"$created_by"};
     // print(bodyString);
      var request = http.Request('PUT', Uri.parse(Config().BASE_URL+'/seller_api/stock_purchase/'+'$stockId/'));
      request.body = json.encode(bodyString);
      //  request.body = json.encode({"product":"$product_id","category":"$category_id","sub_category":"$sub_category_id","stk_mrp":"$stk_mrp","cur_qty":"$cur_qty","created_by":"$created_by","cancel_by":"$created_by","updated_by":"$created_by"});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final res = await response.stream.bytesToString();


      ShowDialogs().showProgressDialog(context,"Loading....",false);
      print("editStockReport  319     "+res.toString());
      final status =jsonDecode(res);
      final statuscode = status['success'] as bool;
      final errors = status['errors'] as String;
      final message = status['message'] as String;

      ShowDialogs().showProgressDialog(context,"Loading....",false);
      if(statuscode==true){
        String Username = await SharedPreferencesHelper.getAgent_mobile_number();
        print(statuscode);
        //  print(status['data']['id']);
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => MPINVerification(text: Username)
        //     ), (route) => false
        // );

        showSuccesseAlertDialog(context, message.toString());
      }else{

        print(statuscode);
        // showSuccessAlertDialog(context, Username);
        showFaliureAlertDialog(context, errors.toString());
      }
    }catch(e){
      ShowDialogs().showProgressDialog(context,"Loading....",false);
      showFaliureAlertDialog(context, e.toString());
    }


  }

  void showSuccesseAlertDialog(BuildContext context, String succesMessage) {
    final controller = Get.put(StockEditController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //Navigator.pop(context);
        Navigator.of(context,rootNavigator: true).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ReportStock()),
        ).then((value) => setState(() {}));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("EDIT STOCK ",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
      content: Text(succesMessage,style : TextStyle( color: Colors.grey),textAlign:TextAlign.center),
      actions: [
        okButton,
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showFaliureAlertDialog(BuildContext context, String errorMsg) {
    final controller = Get.put(StockEditController());
    Widget okButton = TextButton(
      child: Text("OK",style: TextStyle(color: ColorUtility().colorAppbar,fontWeight: FontWeight.bold)),
      onPressed: () {
        //Navigator.pop(context);
        Navigator.of(context,rootNavigator: true).pop(); // 25-01-2023 ==== 2:35
        controller.textQtyController.text = (controller?.stockModel!.data?[controller.index].curQty).toString();
        controller.textMrpController.text = (controller?.stockModel!.data?[controller.index].stkMrp).toString();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("EDIT STOCK ",style :TextStyle( color: Colors.black),textAlign:TextAlign.center),
      content: Text(errorMsg,style : TextStyle( color: Colors.grey),textAlign:TextAlign.center),
      actions: [
        okButton,
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}