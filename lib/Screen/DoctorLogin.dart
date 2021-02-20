import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:The_Mindfulness/Class/Tabs.dart';
import 'package:The_Mindfulness/Components/decorations.dart';
import 'package:The_Mindfulness/Components/rounded_button.dart';
import "package:The_Mindfulness/helper/helperfunctions.dart";
import 'package:The_Mindfulness/services/auth.dart';
import 'package:The_Mindfulness/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:The_Mindfulness/ChatModule/chatrooms.dart';

class DoctorLogin extends StatefulWidget {
  @override
  static String id= 'doctor_login';
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {


 TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null)  {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getDoctorInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Tabs()), (route) => false);
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
 

  Widget build(BuildContext context) {

    final screenSize=MediaQuery.of(context).size;

    
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
                          height: screenSize.height/5.5,
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
                            height: screenSize.height/6,
                          ),
                        ),
                        Center(child: Text('Mind Peace',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: ScreenUtil().setHeight(30)),)),
                        Padding(
                          padding: EdgeInsets.only(left:ScreenUtil().setWidth(70),top: ScreenUtil().setHeight(100)),
                          child: Text('Welcome Doctor :)',style: TextStyle(fontSize:ScreenUtil().setHeight(80),fontWeight: FontWeight.w900),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:ScreenUtil().setHeight(40),left:ScreenUtil().setWidth(70),right:ScreenUtil().setWidth(50)),
                          child: Text('To login into your verified account,Use email and password provided during verification',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:ScreenUtil().setHeight(35)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(70),
                        ),
                             Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 10),
                                    child: TextFormField(
                                      validator: (val) {
                                        return RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val)
                                            ? null
                                            : "Please Enter Correct Email";
                                      },
                                      controller: emailEditingController,
                                      style: simpleTextStyle(),
                                      decoration: textFieldInputDecoration("email"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:30.0,vertical:8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      validator: (val) {
                                        return val.length > 6
                                            ? null
                                            : "Enter Password 6+ characters";
                                      },
                                      style: simpleTextStyle(),
                                      controller: passwordEditingController,
                                      decoration: textFieldInputDecoration("password"),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                        Padding(
                          padding:  EdgeInsets.only(left: ScreenUtil().setWidth(50),right: ScreenUtil().setWidth(50)),
                          child: RoundedButton(title: "Login as Doctor",colour: Colors.lightBlue,
                          onPressed: (){
                            signIn();
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
