import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {

  String title, subtitle;
  CustomListView({@required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Text(subtitle),
            trailing: Wrap(
              children: <Widget>[
                Icon(Icons.arrow_forward, color: Colors.blue, size: 40,),
              ],
            ),
          ),
          SizedBox(
            height: 2,
            width: double.infinity,
            child: Container(
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }
}