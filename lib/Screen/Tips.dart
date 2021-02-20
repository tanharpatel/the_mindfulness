import 'package:The_Mindfulness/Class/CustomListView.dart';
import 'package:The_Mindfulness/Screen/TipsDesc.dart';
import 'package:The_Mindfulness/Util/TipsList.dart';
import 'package:flutter/material.dart';

class Tips extends StatefulWidget {

  static final String id = 'Tips';

  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Tips", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: tips.length,
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TipsDesc(desc: tipsDesc[index],))),
            child: CustomListView(title: tips[index], subtitle: ""),
          );
        },
      ),
    );
  }
}