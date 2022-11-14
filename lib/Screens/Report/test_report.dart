import 'dart:convert';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/colorutility.dart';
import '../Home/home_activity.dart';

class BankListDataModel{
  String bank_name;
  String bank_logo;
  BankListDataModel(this.bank_name,this.bank_logo);
}

class TestReport extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestReport();
  }
}

class _TestReport extends State<TestReport>{

  late BankListDataModel _bankChoose;
  List<BankListDataModel> bankDataList=[
    BankListDataModel("SBI","https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
    BankListDataModel("HDFC","https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png"),
    BankListDataModel("ICICI","https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png"),
    //BankListDataModel("Canara","https://bankforms.org/wp-content/uploads/2019/10/Canara-Bank.png")
  ];

   List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  @override
  initState(){
    super.initState();
    _bankChoose = bankDataList[0];
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.07,
              automaticallyImplyLeading: true,
              backgroundColor: ColorUtility().colorAppbar,
              title: Text("Order Report"),
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context,true);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrawerActivity()
                      ),
                          (route) => false
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),

            ),


            body: Center(child : getBody())




        )
    );


  }

  Widget getBody(){
    return Stack(

        children: <Widget>[
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/5,
                                // child :TextField(
                                //   onTap: () {
                                //     //Your code here
                                //
                                //   },
                                // )

                             // child: Text(_roles.toString()),


                                padding: EdgeInsets.all(16),
                                child: Column(
                                    children: [
                                      TextDropdownFormField(
                                        options: ["Male", "Female"],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                            labelText: "Gender"),
                                        dropdownHeight: 120,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      DropdownFormField<Map<String, dynamic>>(
                                        onEmptyActionPressed: () async {},
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                            labelText: "Access"),
                                        onSaved: (dynamic str) {
                                        },
                                          onChanged: (dynamic str) {
                                          print(str);
                                        },
                                        validator: (dynamic str) {},
                                        displayItemFn: (dynamic item) => Text(
                                          (item ?? {})['name'] ?? '',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        findFn: (dynamic str) async => _roles,
                                        selectedFn: (dynamic item1, dynamic item2) {
                                          if (item1 != null && item2 != null) {
                                            return item1['name'] == item2['name'];
                                          }
                                          return false;
                                        },
                                        filterFn: (dynamic item, str) =>
                                        item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
                                        dropdownItemFn: (dynamic item, int position, bool focused,
                                            bool selected, Function() onTap) =>
                                            ListTile(
                                              title: Text(item['name']),
                                              subtitle: Text(
                                                item['desc'] ?? '',
                                              ),
                                              tileColor:
                                              focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                                              onTap: onTap,
                                            ),

                                      ),

                                      // InkWell(
                                      //   child: Text("Hello"),
                                      //   onTap: () {
                                      //
                                      //   },
                                      // )
                                    ]
                                )


                            )
                      ]
                  )




                //   child :Container(
                //       height: MediaQuery.of(context).size.height,
                //       width: double.infinity,
                //       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                //       padding: EdgeInsets.fromLTRB(0,0,0,0),
                //       child : FutureBuilder<UserModel>(
                //           future:  fetchData(context),
                //           builder: (context, snapshot) {
                //             return Container();
                //           }
                //       )
                //   )

              )
          )
        ]
    );
  }

  Future<bool> _onBackPressed() async  {
    return (await  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => DrawerActivity()
        ),
            (route) => false
    )) ??
        false;
  }


}