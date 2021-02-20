import 'package:flutter/material.dart';

class TipsDesc extends StatelessWidget {
  String desc, img;
  TipsDesc({@required this.desc, this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text("Tips", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.network(img),
                ),
                Center(child: Text(desc, style: TextStyle(fontSize: 20),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}