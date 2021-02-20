import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton({this.title,this.colour,@required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,height: 1920,width: 1080,allowFontScaling: true);
    return Padding(
      padding: EdgeInsets.symmetric(vertical:ScreenUtil().setWidth(35)),
      child: Material(
        elevation: ScreenUtil().setHeight(10),
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.white,fontSize:ScreenUtil().setHeight(35)),
              ),
              Padding(
                padding:  EdgeInsets.only(left:ScreenUtil().setWidth(30)),
                child: Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
    );
  }
}