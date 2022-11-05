import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SetReminder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _SetReminder();
  }
}

class _SetReminder extends State<SetReminder>{

  TextEditingController Notification_title = TextEditingController();
  TextEditingController Notification_descrp = TextEditingController();

  @override
  initState(){
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  final future = _hasPermission().then(_retrieveCalendars);
    return Container();
  }

  // Future<void> _hasPermission() async {
  //   var permissionsGranted = await DeviceCalendarPlugin().hasPermissions();
  //
  //   if (permissionsGranted.isSuccess && permissionsGranted.data) {
  //     return;
  //   }
  //   else if (permissionsGranted.isSuccess && !permissionsGranted.data) {
  //     permissionsGranted = await DeviceCalendarPlugin().requestPermissions();
  //     if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
  //       throw 'User has not granted app calendar access permission';
  //     }
  //   } else
  //     throw 'App does not have calendar access permission';
  // }
  //
  // Future<UnmodifiableListView<Calendar>> _retrieveCalendars(_) async {
  //   return (await DeviceCalendarPlugin().retrieveCalendars()).data;
  // }
}