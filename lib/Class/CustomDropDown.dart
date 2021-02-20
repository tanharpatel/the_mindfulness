import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {

  CustomDropDown({@required this.text, this.items});
  Text text;
  List<Item> items;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  Item selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Item>(
              hint: widget.text,
              value: selectedValue,
              onChanged: (Item value) {
                setState(() {
                  selectedValue = value;
                });
              },
              items: widget.items.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Text(user.name, style: TextStyle(color: Colors.black),),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  const Item(this.name);
  final String name;
}