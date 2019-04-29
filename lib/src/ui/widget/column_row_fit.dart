import 'package:flutter/material.dart';

class ExpandedColumnWidget extends StatelessWidget {
  const ExpandedColumnWidget({Key key, this.children}) : super(key: key);
  succesOnPress() {}
  failOnPress() {}
  final List<Widget> children;

  @override
  Widget build(context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(children: this.children),
        ),
      ],
    );
  }
}
//  Expanded(
//                 child: FittedBox(
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.check,
//                       color: Colors.green,
//                     ),
//                     color: Colors.red,
//                     onPressed: failOnPress(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: FittedBox(
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.cancel,
//                       color: Colors.red,
//                     ),
//                     color: Colors.red,
//                     onPressed: failOnPress(),
//                   ),
//                 ),
//               )
