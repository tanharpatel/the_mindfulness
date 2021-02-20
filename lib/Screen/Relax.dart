import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:flutter/material.dart';

class Relax extends StatefulWidget {

  static final String id = 'Relax';
  
  @override
  _RelaxState createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Relax", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: CustomListView(title: "In the Light", subtitle: "Equal Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Relaxing Green Nature", subtitle: "Extended Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "In the Moment", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Tranquility", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "The soft lullaby", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}