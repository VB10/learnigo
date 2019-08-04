import 'package:flutter/material.dart';

class StatusButttonWidget extends StatelessWidget {
  const StatusButttonWidget(
      {Key key,
      @required this.success,
      @required this.unsuccess,
      @required this.onSuccess,
      @required this.onFail})
      : super(key: key);

  final String success;
  final String unsuccess;
  final VoidCallback onSuccess;
  final VoidCallback onFail;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            height: 60,
            child: RaisedButton(
              onPressed: this.onSuccess,
              color: Colors.green[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Başarılı",
                  ),
                  Text(this.success),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            padding: EdgeInsets.all(5),
            child: RaisedButton(
              onPressed: this.onFail,
              color: Colors.red[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hatalı",
                  ),
                  Text(this.unsuccess),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
