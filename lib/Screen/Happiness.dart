import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:flutter/material.dart';

class Happiness extends StatefulWidget {

  static final String id = 'Happiness';
  
  @override
  _HappinessState createState() => _HappinessState();
}

class _HappinessState extends State<Happiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Happiness", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: CustomListView(title: "Feeling Happy", subtitle: "Extended Breathe",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Healing", subtitle: "Equal Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Our Memories", subtitle: "Extended Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "The Town of Our Youth", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Victory", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}