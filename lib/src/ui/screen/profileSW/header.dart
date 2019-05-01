import 'package:flutter/material.dart';
import 'package:learnigo/styles/colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        top: 100,
        bottom: 100,
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
