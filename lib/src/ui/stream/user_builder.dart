import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/signin_bloc.dart';

class UserLoginStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: signinBloc.getDisplayName,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Text("Welcome ${snapshot.data}");
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
