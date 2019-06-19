import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnigo/src/resources/enum/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    controlUser();
  }

  void controlUser() {
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      SharedPreferences.getInstance().then(_prefOnComplete).catchError(onError);
    });
  }

  void _prefOnComplete(SharedPreferences pref) {
    if (pref.getString(SharedState.username.toString()) != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/tab", (Route route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/login", ModalRoute.withName('/splash'));
    }
  }

  void onError(val) {
    print(val);
    Crashlytics.instance.log(val);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset("lib/assets/workChat.png"),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Kontrol Ediliyor...",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
