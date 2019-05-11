import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnigo/styles/colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
          gradient: LinearGradient(
            colors: profileGradientColors, // whitish to gray
            tileMode: TileMode.repeated,
          ),
        ),
      ),
      Positioned.fill(
        top: ScreenUtil.getInstance().setHeight(100),
        bottom: ScreenUtil.getInstance().setHeight(100),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            "lib/assets/profile.png",
          ),
        ),
      )
    ]);
  }
}
