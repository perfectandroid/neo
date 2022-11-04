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
    return Container();
  }
}