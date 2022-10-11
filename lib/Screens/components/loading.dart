import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/mpin_set_page.dart';
import 'package:neo/constants.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        Container(
          child: Lottie.asset('assets/loading.json'),
        ),
        Text('Loading ...',
          style: TextStyle(
            fontSize: 16.0,
          ),),
      ],
    );
  }
}

