import 'package:flutter/material.dart';
import 'package:learnigo/styles/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplyButtonsWidget extends StatelessWidget {
  const ReplyButtonsWidget(this.onSignedOut, this.icon, this.text, {Key key})
      : super(key: key);
  final VoidCallback onSignedOut;
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return InkWell(
      onTap: this.onSignedOut,
      child: FittedBox(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: this.icon,
            ),
            Text(
              this.text,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(12),
                  fontFamily: "Poppins-Medium",
                  letterSpacing: .5),
            )
          ],
        ),
      ),
    );
  }
}
