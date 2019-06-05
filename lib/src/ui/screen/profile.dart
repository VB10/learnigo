import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/models/world_model.dart';
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

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final dbHelper = SqliteManager.instance;
  String _succesCount = "0";
  String _unsuccesCount = "0";
  List<Widget> _successList;
  List<Widget> _failList;

  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    _successList = new List<Widget>();
    _failList = new List<Widget>();
    getUserInformation();
  }

  dbAllItems(List<Map<String, dynamic>> val) {
    final allDatas = UserWordInformation.fromListMap(val).objectList;
    for (var item in allDatas) {
      if (item.know == 0)
        _failList.add(Text(item.word));
      else
        _successList.add(Text(item.word));
    }
  }

  getUserInformation() async {
    final __succesCount = (await dbHelper.queryAllKnow(true)).length.toString();
    dbHelper.queryAllRaws().then(dbAllItems);

    // print(x.cast<ItemModel>());
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

  void showModalBottom(bool val) {
    showModalBottomSheet(
        builder: (context) {
          return SafeArea(
            child: Container(
              height: 300,
              child: ListView.builder(
                itemCount: val ? _successList.length : _failList.length,
                itemBuilder: (context, index) {
                  return val ? _successList[index] : _failList[index];
                },
              ),
            ),
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
                unsuccess: "0",
                onSuccess: () {
                  showModalBottom(true);
                },
                onFail: () {
                  showModalBottom(false);
                },
              ),
            ),
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
              child: SignoutButttonWidget(onPress: () async {
                showModalBottomSheet(
                    builder: (context) {
                      return SafeArea(
                        child: Container(
                          child: ListView.builder(
                            itemCount: this._successList.length,
                            itemBuilder: (context, index) {
                              return this._successList[index];
                            },
                          ),
                        ),
                      );
                    },
                    context: context);
              }),
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
