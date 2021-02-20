import 'package:The_Mindfulness/Class/CustomCard.dart';
import 'package:The_Mindfulness/Screen/Breathe.dart';
import 'package:The_Mindfulness/Screen/MusicList.dart';
import 'package:The_Mindfulness/Screen/Tips.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class Home extends StatefulWidget {

  static final String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(text: "images/breath.jpg", screenToStart: Breathe(),),
                  CustomCard(text: "images/calm.jpg", screenToStart: MusicList('music/calm/songs','Calm'),),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(text: "images/meditaiton.jpeg", screenToStart: MusicList('music/meditation/songs','Meditatiton'),),
                  CustomCard(text: "images/hapiness.jpg", screenToStart: MusicList('music/happiness/songs','Happiness'),),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(text: "images/selflove.jpg", screenToStart: MusicList('music/selfLove/songs','Self Love'),),
                  CustomCard(text: "images/tips.jpg", screenToStart: Tips(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}