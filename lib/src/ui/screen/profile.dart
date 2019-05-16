import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:learnigo/src/ui/screen/profileSW/button.dart';
import 'package:learnigo/src/ui/screen/profileSW/buttons.dart';
import 'package:learnigo/src/ui/screen/profileSW/header.dart';
import 'package:learnigo/styles/colors.dart';
import 'package:learnigo/styles/text.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.darkThemeEnabled}) : super(key: key);
  final bool darkThemeEnabled;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final dbHelper = SqliteManager.instance;
  String _succesCount = "0";
  String _unsuccesCount = "0";

  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  getUserInformation() async {
    final __succesCount = (await dbHelper.queryAllKnow(true)).length.toString();
    final __unsuccesCount =
        (await dbHelper.queryAllKnow(false)).length.toString();
    setState(() {
      _succesCount = __succesCount;
      _unsuccesCount = __unsuccesCount;
    });
  }

  void _onSwitchChanged(bool value) {
    _switchValue = value;
    print(_switchValue);
    DynamicTheme.of(context)
        .setBrightness(!_switchValue ? Brightness.light : Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: profileBackgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: ProfileHeaderWidget()),
            SizedBox(
              height: 30,
            ),
            Text("Veli Bacık", style: profileTitleStyle),
            SizedBox(
              height: 30,
            ),
            Expanded(
                flex: 2,
                child: StatusButttonWidget(
                  success: this._succesCount,
                  unsuccess: "0",
                )),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text("Change app theme"),
              subtitle: Text("Dark"),
              trailing: Switch(
                value: _switchValue,
                onChanged: _onSwitchChanged,
              ),
            ),
            Expanded(
              child: SignoutButttonWidget(onPress: () {}),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
