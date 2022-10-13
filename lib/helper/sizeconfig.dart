import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {

  late double screenWidth;
  late double screenHeight;

  void init(BuildContext context){

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

  }


}