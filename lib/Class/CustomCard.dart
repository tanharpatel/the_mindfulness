import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  String text;
  var screenToStart;
  CustomCard({@required this.text, this.screenToStart});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        child: Card(
          borderOnForeground: true,
          elevation: 10,
          color: Colors.blue[100],
          child: Image.asset(text),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        ),
        onPressed: (){
          Route route = MaterialPageRoute(builder: (context) => screenToStart);
          Navigator.push(context, route);
        },
      ),
    );
  }
}