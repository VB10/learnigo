import 'package:flare_flutter/flare_actor.dart';
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
          gradient: LinearGradient(
            colors: profileGradientColors, // whitish to gray
            tileMode: TileMode.repeated,
          ),
        ),
      ),
      Positioned.fill(
          child: FlareActor(
        "lib/assets/Teddy.flr",
        animation: "idle",
      ))
    ]);
  }
}
