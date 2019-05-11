import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/card/status_card.dart';

class StatusButttonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            child: StatusCard(
              text: "Başarılı",
              color: Colors.green[300],
              right: Text("25"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: StatusCard(
              text: "Hatalı",
              color: Colors.red[300],
              right: Text("30"),
            ),
          ),
        ),
      ],
    );
  }
}
