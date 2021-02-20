import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:The_Mindfulness/Components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'RegistrationScreen.dart';
import 'LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {

  static  String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);

    return Scaffold(
        body:Padding(
          padding:  EdgeInsets.only(top:ScreenUtil().setHeight(180)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(

                  child: Center(
                      child: Image.asset("images/logo.png")
                  ),
                  height:ScreenUtil().setHeight(600),
                ),
              ),
              Center(child: Text("Mind Peace",style: (TextStyle(fontWeight:FontWeight.w500)))),
              Padding(
                padding:  EdgeInsets.only(top:ScreenUtil().setWidth(100.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(

                      child: TypewriterAnimatedTextKit(
                        speed: Duration(milliseconds:200),
                        text: [' Welcome '],
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setHeight(110),
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:ScreenUtil().setHeight(40),
                    left:ScreenUtil().setWidth(70),
                    right:ScreenUtil().setWidth(70)),
                child: RoundedButton(title: 'Login',
                  onPressed: (){
                   Navigator.pushNamed(context, LoginScreen.id);
                  },
                  colour: Colors.lightBlue,),
              ),
              Padding(
                padding: EdgeInsets.only(top:ScreenUtil().setHeight(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Are you a Doctor ? "),
                    InkWell(
                      child: Text("Register here", style: TextStyle(color: Colors.lightBlue,fontWeight:FontWeight.w800),),
                      onTap: (){
                      Navigator.pushNamed(context, RegistrationScreen.id);
                      },

                    ),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}
