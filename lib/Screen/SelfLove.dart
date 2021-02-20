import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:flutter/material.dart';

class SelfLove extends StatefulWidget {

  static final String id = 'SelfLove';
  
  @override
  _SelfLoveState createState() => _SelfLoveState();
}

class _SelfLoveState extends State<SelfLove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Self Love", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: CustomListView(title: "Flutes", subtitle: "Extended Breathe",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Deep Sleep", subtitle: "Equal Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Forest Vibes", subtitle: "Extended Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Nature Sound", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Tranquil", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}