import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnigo/styles/text.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({Key key, @required this.icon, @required this.text})
      : super(key: key);

  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: this.icon,
        ),
        Text(
          this.text,
          style: likeButtonStyle(ScreenUtil.instance),
        )
      ],
    );
  }
}
