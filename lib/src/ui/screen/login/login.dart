import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnigo/src/blocs/signin_bloc.dart';
import 'package:learnigo/src/ui/stream/user_builder.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({Key key}) : super(key: key);

  @override
  _GoogleLoginScreenState createState() => _GoogleLoginScreenState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  _handleSignIn() {
    signinBloc.fetchUser();
  }

  @override
  void initState() {
    super.initState();
    signinBloc.getDisplayName.listen((onData) {
      if (onData.isNotEmpty) {
        Navigator.of(context).pushNamed("/");
      } else {
        print("data is null");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.games),
                onPressed: this._handleSignIn,
              ),
              UserLoginStream(
                homeConext: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
