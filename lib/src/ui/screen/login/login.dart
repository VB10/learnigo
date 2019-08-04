import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnigo/src/blocs/signin_bloc.dart';
import 'package:learnigo/src/resources/enum/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({Key key}) : super(key: key);

  @override
  _GoogleLoginScreenState createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  _handleSignIn() {
    signinBloc.fetchUser();
  }

  final double _padding = 30;
  final double _radius = 20;

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

  Widget get _stackBackground => Positioned.fill(
          child: FlareActor(
        "lib/assets/loading.flr",
        animation: "idle",
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_stackBackground, _stackLoginButton],
    ));
  }

  Widget get _stackLoginButton => Positioned(
      bottom: _padding,
      right: _padding,
      left: _padding,
      child: Column(
        children: <Widget>[
          _loginButton(
              text: "Hızlı Oyna",
              backgroundColor: Colors.pink,
              icon: Icons.fast_forward,
              onPress: () {}),
          _loginButton(
              text: "Google ile Giriş Yap",
              backgroundColor: Colors.blue,
              icon: FontAwesomeIcons.google,
              onPress: () => signinBloc.fetchUser()),
        ],
      ));

  Widget _loginButton(
      {String text,
      VoidCallback onPress,
      IconData icon,
      Color backgroundColor}) {
    return RaisedButton.icon(
      icon: Icon(icon, color: Colors.white),
      color: backgroundColor,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
      onPressed: onPress,
      label: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  void dispose() {
    signinBloc.dispose();
    super.dispose();
  }
}
