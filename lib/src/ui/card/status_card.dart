import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key key,
    @required this.text,
    @required this.right,
    @required this.color,
  }) : super(key: key);

  final String text;
  final Widget right;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.color,
      child: ListTile(
          title: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          ),
          trailing: this.right),
    );
  }
}
