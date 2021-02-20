import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class Addtsk extends StatefulWidget {
  @override
  _AddtskState createState() => _AddtskState();
}

String _title;
String _title1;
final _formKey = GlobalKey<FormState>();
// final _formKey1 = GlobalKey<FormState>();
FocusNode myFocusNode = new FocusNode();
FocusNode myFocusNode1 = new FocusNode();

DateTime selectedDate = DateTime.now();
TimeOfDay time = new TimeOfDay.now();
TimeOfDay time2 = new TimeOfDay.now();
TimeOfDay t;
int _hr;
double _minute;
//double h = ScreenUtil().setHeight(0);

class _AddtskState extends State<Addtsk> {
  @override
  void initState() {
    super.initState();
    //double h = ScreenUtil().setHeight(0);
    double _doubleyourTime =
        time2.hour.toDouble() + (time2.minute.toDouble() / 60);
    double _doubleNowTime =
        time.hour.toDouble() + (time.minute.toDouble() / 60);

    double _timeDiff = _doubleyourTime - _doubleNowTime;

    _hr = _timeDiff.truncate();
    _minute = ((_timeDiff - _timeDiff.truncate()) * 60).toDouble();
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    print(_minute);
    print(_hr);
    if (_hr >= 0 && _minute > 0) {
      if (form.validate()) {
        form.save();
        //createRecord();
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Secondpage()));
        setState(() {
        //  h = ScreenUtil().setHeight(0);
        });

        return true;
      } else {
        setState(() {
     //     h = ScreenUtil().setHeight(50);
        });

        return false;
      }
    } else {
      print("Data lost");
    }
  }

  // DateTime selectedDate = DateTime.now();
  // TimeOfDay time = new TimeOfDay.now();
  // TimeOfDay time2 = new TimeOfDay.now();
  // TimeOfDay t;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate:
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context, int x) async {
    if (x == 1) {
      t = time;
      print(time);
    } else {
      t = time2;
      print(time2);
    }
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != t) {
      print('Time selected: ${t.toString()}');
      setState(() {
        t = picked;
        if (x == 1) {
          time = t;
          print(time);
        } else {
          time2 = t;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            color: Color(0xFFFFF9EC),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  backgroundColor: Colors.blue[300],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  // title: Appbr(),
                  pinned: true,
                  expandedHeight: ScreenUtil().setHeight(800) ,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(60)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil().setHeight(200),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Create new task",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(90),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(25),
                                bottom: ScreenUtil().setHeight(25)),
                            child: TextFormField(
                              focusNode: myFocusNode,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              // maxLines: 2,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'Title',
                                  labelStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(50),
                                      color: myFocusNode.hasFocus
                                          ? Colors.black
                                          : Colors.black)),
                              onSaved: (String value) {
                                if (_title == null) {
                                  _title = value;
                                } else {
                                  value = _title;
                                }
                              },
                              validator: (value) => value.isEmpty
                                  ? 'Please enter Title of task'
                                  : null,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(15)),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 0),
                                            child: Text("Date"),
                                          )),
                                      TextFormField(
                                        enabled: false,
                                        focusNode: myFocusNode1,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 3),
                                            labelText:
                                                ("${selectedDate.toLocal()}"
                                                    .split(' ')[0]),
                                            labelStyle: TextStyle(
                                                // height: 3,
                                                fontSize:
                                                    ScreenUtil().setSp(50),
                                                color: myFocusNode.hasFocus
                                                    ? Colors.black
                                                    : Colors.black)),
                                        onSaved: (String value) {
                                          if (_title1 == null) {
                                            _title1 = value;
                                          } else {
                                            value = _title1;
                                          }
                                        },
                                        validator: (value) => value.isEmpty
                                            ? 'Please enter Title of task'
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: SizedBox(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(60)),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF309397),
                                    radius: ScreenUtil().setSp(80),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Clocks(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(50),
                            vertical: ScreenUtil().setHeight(20)),
                        child: TextFormField(
                          // focusNode: myFocusNode,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          maxLines: 3,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: 'Description',
                              labelStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(50),
                                  color: myFocusNode.hasFocus
                                      ? Colors.black
                                      : Colors.black)),
                          onSaved: (String value) {
                            if (_title == null) {
                              _title = value;
                            } else {
                              value = _title;
                            }
                          },
                          validator: (value) => value.isEmpty
                              ? 'Please enter Title of task'
                              : null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(50),
                            vertical: ScreenUtil().setHeight(20)),
                        child: RaisedButton(
                          splashColor: Colors.grey,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(200.0),
                              side: BorderSide(color: Colors.blue)),
                          onPressed: () {
                            validateAndSave();
                          },
                          child: Text(
                            "Add task",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(70)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Clocks extends StatefulWidget {
  Clocks({Key key}) : super(key: key);

  @override
  _ClocksState createState() => _ClocksState();
}

class _ClocksState extends State<Clocks> {
  Future<Null> _selectTime(BuildContext context, int x) async {
    if (x == 1) {
      t = time;
      print(time);
    } else {
      t = time2;
      print(time2);
    }
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != t) {
      print('Time selected: ${t.toString()}');
      setState(() {
        t = picked;
        if (x == 1) {
          time = t;
          print(time);
        } else {
          time2 = t;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(30),
          vertical: ScreenUtil().setHeight(30)),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              int x = 1;
              await _selectTime(context, x);
              print(time.format(context));
            },
            child: Container(
              color: Color(0xFFFFF9EC),
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text("Start time"),
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    focusNode: myFocusNode1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 3),
                        // labelText: ("${selectedDate.toLocal()}".split(' ')[0]),
                        labelText: time.format(context),
                        labelStyle: TextStyle(
                            // height: 3,
                            fontSize: ScreenUtil().setSp(50),
                            color: myFocusNode.hasFocus
                                ? Colors.black
                                : Colors.black)),
                    onSaved: (String value) {
                      if (_title1 == null) {
                        _title1 = value;
                      } else {
                        value = _title1;
                      }
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Title of task' : null,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(),
          ),
          GestureDetector(
            onTap: () async {
              int x = 2;
              await _selectTime(context, x);
              print(time.format(context));
              print(time2.format(context));
              double _doubleyourTime =
                  time2.hour.toDouble() + (time2.minute.toDouble() / 60);
              double _doubleNowTime =
                  time.hour.toDouble() + (time.minute.toDouble() / 60);

              double _timeDiff = _doubleyourTime - _doubleNowTime;

              _hr = _timeDiff.truncate();
              _minute = ((_timeDiff - _timeDiff.truncate()) * 60).toDouble();

              print('Here your Happy $_hr Hour and $_minute min');
            },
            child: Container(
              color: Color(0xFFFFF9EC),
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text("End time"),
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    focusNode: myFocusNode1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        contentPadding: EdgeInsets.only(left: 3),
                        // labelText: ("${selectedDate.toLocal()}".split(' ')[0]),
                        // labelText: time2.format(context),
                        labelText: time2.format(context),
                        labelStyle: TextStyle(
                            // height: 3,
                            fontSize: ScreenUtil().setSp(50),
                            color: myFocusNode.hasFocus
                                ? Colors.black
                                : Colors.black)),
                    onSaved: (String value) {
                      if (_title1 == null) {
                        _title1 = value;
                      } else {
                        value = _title1;
                      }
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Title of task' : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}