import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:flutter/material.dart';

class Focusing extends StatefulWidget {

  static final String id = 'Focusing';
  
  @override
  _FocusingState createState() => _FocusingState();
}

class _FocusingState extends State<Focusing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Focus", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: CustomListView(title: "Earth Resonance", subtitle: "Extended Breathe",),
            onPressed: (){_playAudio();},
          ),
          FlatButton(
            child: CustomListView(title: "Meditation Classic", subtitle: "Equal Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Postitive", subtitle: "Extended Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Deep Meditation", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
          FlatButton(
            child: CustomListView(title: "Mindfulness", subtitle: "Box Breathing",),
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  void _playAudio() {
    
  }
}