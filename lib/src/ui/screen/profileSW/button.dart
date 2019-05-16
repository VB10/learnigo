import 'package:flutter/material.dart';
import 'package:learnigo/styles/text.dart';

class SignoutButttonWidget extends StatelessWidget {
  const SignoutButttonWidget({Key key, @required this.onPress})
      : super(key: key);

  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Expanded(
          flex: 8,
          child: RaisedButton(
            onPressed: this.onPress,
            child: Text("Signout", style: signoutStyle),
            elevation: 10,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
