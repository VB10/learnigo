import 'package:flutter/material.dart';

class ReplyButtonsWidget extends StatelessWidget {
  const ReplyButtonsWidget(this.onSignedOut, this.icon, {Key key})
      : super(key: key);

  final VoidCallback onSignedOut;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: IconButton(icon: this.icon, onPressed: this.onSignedOut),
      ),
    );
  }
}
