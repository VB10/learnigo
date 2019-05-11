import 'package:flutter/material.dart';

class FittedColumnWidget extends StatelessWidget {
  const FittedColumnWidget({Key key, @required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: this.child,
      ),
    );
  }
}
