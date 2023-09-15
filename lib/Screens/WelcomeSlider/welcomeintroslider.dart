import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:neo/Screens/Welcome/welcome_page.dart';
import 'package:neo/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Stock Management',
        body: 'This app manages and tracks your product stock and control inventory',
        image: Center(
          child: Image.asset('assets/images/introslider2.png'),
        ),
        decoration: const PageDecoration(
          // pageColor: Colors.blue,
            titleTextStyle: TextStyle(
              fontSize: 25.0,color:Colors.black,
              fontWeight: FontWeight.bold,
            )
        )
       /* footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 8
            ),
            onPressed: () {},
            child: const Text("Let's Go", style: TextStyle(fontSize: 20)),
          ),
        ),*/

    ),
    PageViewModel(
        title: 'Stock Report',
        body: 'Stock report will helps sellers to know product sales and fast moving products',

     /*   footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 8
            ),
            onPressed: () {},
            child: const Text("Why to wait!", style: TextStyle(fontSize: 20),),
          ),
        ),*/
        image: Center(
          child: Image.asset('assets/images/introslider3.png'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,color:Colors.black,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Stock Status',
        body: 'Sellers can get the status of current stock once get an order',
       /* footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 8
            ),
            onPressed: () {},
            child: const Text("Let's Start", style: TextStyle(fontSize: 20)),
          ),
        ),*/
        image: Center(
          child: Image.asset('assets/images/introslider1.png'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0, color:Colors.black,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar: AppBar(
        title: const Text('Flutter on Boarding UI'),
        centerTitle: true,
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10,10),
            color: PrimaryColor,
            activeSize: Size.square(15),
            activeColor:PrimaryLightColor,
          ),
          showDoneButton: true,
          done: const Text('Done', style: TextStyle(fontSize: 20),),
          showSkipButton: true,
          skip: const Text('Skip', style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()));
  }
}