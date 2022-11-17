import 'package:flutter/material.dart';
import 'package:neo/Screens/Home/home_activity.dart';
import 'package:neo/Screens/Login/login_page.dart';
import 'package:neo/Screens/Login/loginpage.dart';
import 'package:neo/Screens/Register/signup_page.dart';
import '../../constants.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     //context, MaterialPageRoute(builder: (context) => Login()/*DrawerActivity()*/));
        //     context, MaterialPageRoute(builder: (context) => LoginPage()/*DrawerActivity()*/));

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()
            ),
            (route) => false
        );

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
  Widget _logo() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
          children: <Widget>[
            Container(
              child:SizedBox(
                  height:200,width:200,
                  child:Image.asset("assets/images/logo.png")
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Welcome Back',style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );

  }
  Widget _discription() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          text: 'Let us get started, be ready to activate your account. This application will advantage you in many ways and also makes your works done effortlessly.',style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [PrimaryColor, PrimaryLightColor])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logo(),
              _title(),
              SizedBox(
                height: 20,
              ),
              _discription(),
              SizedBox(
                height: 30,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              // _signUpButton(),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
