import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:The_Mindfulness/Screen/BreatheScreen.dart';
import 'package:flutter/material.dart';

class Breathe extends StatefulWidget {

  static final String id = 'Breathe';

  @override
  _BreatheState createState() => _BreatheState();
}

class _BreatheState extends State<Breathe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: 
        Text("Breathe", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: CustomListView(title: "Calm Down", subtitle: "Extended Breathe",),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => BreatheScreen());
              Navigator.push(context, route);
            },
          ),
          FlatButton(
            child: CustomListView(title: "Clear the Mind", subtitle: "Equal Breathing",),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => BreatheScreen());
              Navigator.push(context, route);
            },
          ),
          FlatButton(
            child: CustomListView(title: "Relax Deeply", subtitle: "Extended Breathing",),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => BreatheScreen());
              Navigator.push(context, route);
            },
          ),
          FlatButton(
            child: CustomListView(title: "Relieve Stress", subtitle: "Box Breathing",),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => BreatheScreen());
              Navigator.push(context, route);
            },
          ),
          FlatButton(
            child: CustomListView(title: "Peace", subtitle: "Box Breathing",),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => Breathe());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
