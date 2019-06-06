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

  Future controlUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(SharedState.username.toString()) != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/tab", ModalRoute.withName('/'));
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/login", ModalRoute.withName('/'));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
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
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset("lib/assets/work_chat.png"),
        ),
      ),
    );
  }
}
