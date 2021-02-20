import 'package:The_Mindfulness/Screen/AddTask.dart';
import 'package:The_Mindfulness/Screen/Cal.dart';
import 'package:The_Mindfulness/Screen/Home.dart';
import 'package:The_Mindfulness/ChatModule/chatrooms.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  static String id = "Tabs";
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentindex=0;
  final List<Widget> _children =[
    Home(),
    Addtsk(),
    Cal(),
    ChatRoom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("The Mindfulness"),
      ),

      body: _children[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        color:Colors.blue,
        buttonBackgroundColor: Color(0xFFe6e6e6),
        //backgroundColor: Color(0xff04033a),
        backgroundColor:Colors.white,
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 0,
        items:<Widget>[

          Icon(Icons.home,size: 25,color:Colors.black),
          Icon(Icons.date_range,size: 25,color:Colors.black),
          Icon(Icons.equalizer,size: 25,color:Colors.black),
          Icon(Icons.chat,size: 25,color: Colors.black,),

        ],
        onTap: (index){
          print("The current index is $index");
          setState(() {
            _currentindex = index;
          });

        },
      ),
    );
  }
}