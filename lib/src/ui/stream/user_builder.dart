import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/signin_bloc.dart';

class UserLoginStream extends StatelessWidget {
  UserLoginStream({this.homeConext});
  final BuildContext homeConext;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: signinBloc.getDisplayName,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Text(
            "Welcome ${snapshot.data}",
            style: TextStyle(color: Colors.black),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Have error.");
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
