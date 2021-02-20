import 'package:flutter/material.dart';
import 'package:The_Mindfulness/Class/Tabs.dart';
import 'package:The_Mindfulness/Components/GoogleSignInButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:The_Mindfulness/Components/rounded_button.dart';
import 'package:The_Mindfulness/Screen/DoctorLogin.dart';
import 'package:The_Mindfulness/Components/sign_in_sign_out.dart';
import 'package:The_Mindfulness/services/database.dart';
import 'package:The_Mindfulness/helper/helperfunctions.dart';

class LoginScreen extends StatefulWidget {
  @override
  static String id= 'login_screen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();


  signUpWithGoogle () async{

    await signInWithGoogle();

    Map<String,String> userDataMap = {
      "userName" : name,
      "userEmail" : email
    };

    String docID = email.substring(0,email.lastIndexOf('@'));
    databaseMethods.addUserInfo(userDataMap,docID);


    HelperFunctions.saveUserLoggedInSharedPreference(true);
    HelperFunctions.saveUserNameSharedPreference(name);
    HelperFunctions.saveUserEmailSharedPreference(email);

//              Navigator.pushReplacement(context, MaterialPageRoute(
//                  builder: (context) => MeditationApp()
//              ));

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Tabs()), (route) => false);

  }



  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: ScreenUtil().setHeight(500),
                          width: double.infinity,
                          child: Image.asset(
                            'images/waves.png',
                            fit: BoxFit.fill,
                          ),
                        ),

                        Hero(
                          tag: 'logo',
                          child: Container(
                            child: Image.asset('images/logo.png'),
                            height: ScreenUtil().setHeight(500),
                          ),
                        ),
                        Center(child: Text('Mind Peace',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: ScreenUtil().setHeight(30)),)),
                        Padding(
                          padding: EdgeInsets.only(left:ScreenUtil().setWidth(70),top: ScreenUtil().setHeight(100)),
                          child: Text('Welcome Back :)',style: TextStyle(fontSize:ScreenUtil().setHeight(80),fontWeight: FontWeight.w900),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:ScreenUtil().setHeight(40),left:ScreenUtil().setWidth(70),right:ScreenUtil().setWidth(50)),
                          child: Text('To remain connected with us, Please login with your personal email account',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:ScreenUtil().setHeight(35)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(70),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: ScreenUtil().setWidth(50),right: ScreenUtil().setWidth(50)),
                          child: GoogleSignInButton(title:"Sign In using Google",colour:Colors.lightBlue,
                            onPressed: (){
                              signUpWithGoogle();
                            },),
                        ),
                        Padding(
                            padding:  EdgeInsets.only(left: ScreenUtil().setWidth(50),right: ScreenUtil().setWidth(50)),
                            child: RoundedButton(title: "Login as Doctor",colour: Colors.lightBlue,
                              onPressed: (){
                                Navigator.pushNamed(context, DoctorLogin.id);
                              },
                            )
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

