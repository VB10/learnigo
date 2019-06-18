import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnigo/src/blocs/signin_bloc.dart';
import 'package:learnigo/src/resources/enum/preferences.dart';
import 'package:learnigo/styles/colors.dart';
import 'package:learnigo/styles/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    signinBloc.getDisplayName.listen((onData) async {
      if (onData.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(SharedState.username.toString(), onData);
        Navigator.of(context).pushNamed("/tab");
      } else {
        print("data is null");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            toolbarOpacity: 0,
            backgroundColor: backgroundColor,
            title: Row(
              children: <Widget>[
                Text("Learnigo", style: appBarTitleStyle),
                SizedBox(width: 30),
                Text("- Login and Play Learn..", style: subTitleStyle)
              ],
            ),
          ),
          body: Stack(
            children: <Widget>[
              Positioned.fill(
                child: FlareActor(
                  "lib/assets/loading.flr",
                  animation: "idle",
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: _handleSignIn,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 30,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Image.asset(
                                "lib/assets/google.png",
                                height: 24,
                              ),
                            ),
                            Text(
                              "Google ile Giriş Yap",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ),
              )
            ],
          )),
    );
  }
}
