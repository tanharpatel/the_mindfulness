import 'dart:io';
import 'package:flutter/material.dart';
import 'package:The_Mindfulness/Components/CustomDialogAlert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:The_Mindfulness/Components/decorations.dart';
import 'package:The_Mindfulness/helper/helperfunctions.dart';
import 'package:The_Mindfulness/services/auth.dart';
import 'package:The_Mindfulness/services/database.dart';



class RegistrationScreen extends StatefulWidget {

  @override
  static String id = "registration_screen";
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

 bool check=false;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("test");

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

   singUp() async {

    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      await authService.signUpWithEmailAndPassword(emailController.text,
          passwordController.text).then((result){
        if(result != null){

          Map<String,String> userDataMap = {
            "userName" : nameController.text,
            "userEmail" : emailController.text
          };

          databaseMethods.addDoctorInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(nameController.text);
          HelperFunctions.saveUserEmailSharedPreference(emailController.text);

          check = true;







        }
      });

    }

  }



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,height: 1920,width: 1080,allowFontScaling: true);
    return Scaffold(

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: ScreenUtil().setHeight(565),
                          width: double.infinity,
                          child: Image.asset(
                            'images/waves.png',
                            fit: BoxFit.fill,
                          ),
                        ),






                        Padding(
                          padding:  EdgeInsets.only(left:ScreenUtil().setWidth(50),top:ScreenUtil().setHeight(130)),
                          child: Text('Welcome :)',style: TextStyle(fontSize:ScreenUtil().setHeight(79),fontWeight: FontWeight.w900),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:ScreenUtil().setHeight(30),left:ScreenUtil().setWidth(50),right:ScreenUtil().setWidth(80)),
                          child: Text('To apply, Please provide the information requested below and upload valid documents',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenUtil().setHeight(34)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:ScreenUtil().setHeight(73),left:ScreenUtil().setWidth(50)),
                          child: Text("Please enter your details:",style:TextStyle(fontSize: 16.0,fontWeight:FontWeight.w700),),
                        ),

                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
                                child: TextFormField(
                                  style: simpleTextStyle(),
                                  controller: nameController,
                                  validator: (val){
                                    return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                                  },
                                  decoration: textFieldInputDecoration("username"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                                child: TextFormField(
                                  controller: emailController,
                                  style: simpleTextStyle(),
                                  validator: (val){
                                    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                                    null : "Enter correct email";
                                  },
                                  decoration: textFieldInputDecoration("email"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                                child: TextFormField(
                                  obscureText: true,
                                  style: simpleTextStyle(),
                                  decoration: textFieldInputDecoration("password"),
                                  controller: passwordController,
                                  validator:  (val){
                                    return val.length < 6 ? "Enter Password 6+ characters" : null;
                                  },

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:ScreenUtil().setHeight(50),),
                        GestureDetector(
                          onTap: () async{
                            await singUp();
                            check ? showDialog(context: context,builder: (context) => CustomDialogAlert("Sucess","your application is submitted succesfully.\n We will contact you soon for verification","ok","images/XLpr.gif")) :
                            showDialog(context: context,builder: (context) => CustomDialogAlert("Failed","Please Fill corrrect details.","ok","images/cross 1.jpeg"));
                            emailController.clear();
                            nameController.clear();
                            passwordController.clear();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
                                )),
                            width: MediaQuery.of(context).size.width/2,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),


















                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: ScreenUtil().setHeight(90),
                      right: 0,
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: 'logo',
                            child: Container(
                              height: ScreenUtil().setHeight(500),
                              child: Image.asset(
                                'images/logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Center(child: Text('Mind Peace',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: ScreenUtil().setHeight(30)),)),
                        ],
                      ),

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