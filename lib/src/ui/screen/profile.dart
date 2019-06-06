import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:learnigo/src/sqlite/model/word.dart';
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

class _ProfileScreenState extends State<ProfileScreen> {
  final dbHelper = SqliteManager.instance;
  String _succesCount = "0";
  String _unsuccesCount = "0";
  List<Widget> _successList;
  List<Widget> _failList;

  bool _switchValue;

  @override
  void initState() {
    super.initState();
    _successList = new List<Widget>();
    _failList = new List<Widget>();
    _switchValue =
        DynamicTheme.of(context).brightness == Brightness.light ? false : true;
    getUserInformation();
    dbHelper.queryAllRaws().then(dbAllItems);
  }

  dbAllItems(List<Map<String, dynamic>> val) {
    final allDatas = UserWordInformation.fromListMap(val).objectList;
    for (var item in allDatas) {
      if (item.know == 0)
        _successList.add(ListTile(
            title: Text(item.word),
            trailing: Icon(Icons.check_circle_outline)));
      else
        _failList.add(ListTile(
            title: Text(item.word), trailing: Icon(Icons.error_outline)));
    }
  }

  getUserInformation() async {
    final __succesCount = (await dbHelper.queryRowKnowCount(true));
    final __unsuccesCount = (await dbHelper.queryRowKnowCount(false));
    setState(() {
      _succesCount = __succesCount.toString();
      _unsuccesCount = __unsuccesCount.toString();
    });
  }

  void _onSwitchChanged(bool value) {
    _switchValue = value;
    print(_switchValue);
    DynamicTheme.of(context)
        .setBrightness(!_switchValue ? Brightness.light : Brightness.dark);
  }

  void showModalBottom(bool val) {
    showModalBottomSheet(
        builder: (context) {
          return SafeArea(
            child: Container(
                height: 300,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: val ? _successList.length : _failList.length,
                        itemBuilder: (context, index) {
                          return val ? _successList[index] : _failList[index];
                        },
                      ),
                    )
                  ],
                )),
          );
        },
        context: context);
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
                unsuccess: this._unsuccesCount,
                onSuccess: () => showModalBottom(true),
                onFail: () => showModalBottom(false),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text("Change app theme"),
              subtitle: Text(_switchValue ? "Dark" : "Light"),
              trailing: Switch(
                value: _switchValue,
                onChanged: _onSwitchChanged,
              ),
            ),
            Expanded(
              child: SignoutButttonWidget(onPress: () async {
                final __succesCount = (await dbHelper.queryRowListKnowDatas(true));
              }),
            )
          ],
        ),
      ),
    );
  }
}
