import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const lightStyle = TextStyle(
  color: Colors.black,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w300,
  fontSize: 30.0,
);
const signoutStyle = TextStyle(
  color: Color(0xff191660),
  fontWeight: FontWeight.w500,
  fontFamily: "Google Sans",
  fontStyle: FontStyle.normal,
);

const profileTitleStyle = TextStyle(
    color: const Color(0xff191660),
    fontWeight: FontWeight.w500,
    fontFamily: "Google Sans",
    fontStyle: FontStyle.normal,
    fontSize: 30.5);

const appBarTitleStyle = TextStyle(
  color: const Color(0xff191660),
  fontWeight: FontWeight.w500,
  fontFamily: "Google Sans",
  fontStyle: FontStyle.normal,
);

const subTitleStyle = TextStyle(
  color: Colors.black54,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w300,
  fontSize: 15,
);

likeButtonStyle(ScreenUtil util) {
  return TextStyle(
      fontSize: util.setSp(12),
      color: Colors.black,
      fontFamily: "Poppins-Medium",
      letterSpacing: .5);
}

const wordStyle = TextStyle(
    color: const Color(0xff191660),
    fontWeight: FontWeight.w500,
    fontFamily: "Google Sans",
    fontStyle: FontStyle.normal,
    fontSize: 25);
