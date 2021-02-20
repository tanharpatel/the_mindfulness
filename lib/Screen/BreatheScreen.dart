import 'package:The_Mindfulness/Class/CupertinoBreathe.dart';
import 'package:The_Mindfulness/Class/CustomDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreatheScreen extends StatefulWidget {
  @override
  _BreatheScreenState createState() => _BreatheScreenState();
}

class _BreatheScreenState extends State<BreatheScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Column(
          children: <Widget>[
            Text("Breathe", style: TextStyle(fontSize: 25),),
            Text("Calm Down", style: TextStyle(fontSize: 15),),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: SizedBox(
                width: 800.0/MediaQuery.of(context).devicePixelRatio,
                height: 800.0/MediaQuery.of(context).devicePixelRatio,
                child: CupertinoBreathe(),
              ),
            ),
            Container(
              width: 800/MediaQuery.of(context).devicePixelRatio,
              height: 100/MediaQuery.of(context).devicePixelRatio,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                            child: Text("Cycle", style: TextStyle(fontSize: 20,),),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text("Duration", style: TextStyle(fontSize: 20,),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: CustomDropDown(text: Text("Cycle"),
                            items: <Item>[
                              const Item('4'),
                              const Item('5'),
                              const Item('6'),
                              const Item('7'),
                              const Item('8'),
                              const Item('9'),
                              const Item('10'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: CustomDropDown(text: Text("Duration"),
                            items: <Item>[
                              const Item('4 sec'),
                              const Item('5 sec'),
                              const Item('6 sec'),
                              const Item('7 sec'),
                              const Item('8 sec'),
                              const Item('9 sec'),
                              const Item('10 sec'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
