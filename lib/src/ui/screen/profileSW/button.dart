import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/card/status_card.dart';
import 'package:learnigo/styles/text.dart';

class SignoutButttonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Expanded(
          flex: 8,
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {},
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
