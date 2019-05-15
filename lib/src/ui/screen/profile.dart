import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/app_bloc.dart';
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

class _ProfileScreenState extends State<ProfileScreen> {
  final dbHelper = SqliteManager.instance;
  String succesCount = "0";
  String unSuccesCount = "0";

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  getUserInformation() async {
    final _succesCount = (await dbHelper.queryAllKnow(true)).length.toString();
    final _unsuccesCount =
        (await dbHelper.queryAllKnow(false)).length.toString();
    setState(() {
      succesCount = _succesCount;
      unSuccesCount = _unsuccesCount;
    });
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
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
                  success: this.succesCount,
                  unsuccess: "0",
                )),
            SizedBox(
              height: 30,
            ),
            Switch(
              value: widget.darkThemeEnabled == null ? true : false,
              onChanged: (val) {
                // appBloc.changeTheme;
                changeBrightness();
                print("work");
              },
            ),
            Expanded(
              child: SignoutButttonWidget(
                onPress: () async {
                  // var model = UserWordInformation();
                  // model.word = "welcome";
                  // model.know = true ? 1 : 0;

                  // final id = await dbHelper.insert(model.toMap());
                  // print(id);
                  // final x = await dbHelper.queryAllModel();
                  // print(x);
                  // final x = await dbHelper.queryAllRaws();
                  // var k = UserWordInformation.fromListMap(x);

                  final x2 = await dbHelper.queryAllKnow(false);
                  print(x2);
                  // UserWordInformation datas =
                  //     UserWordInformation.fromMap(x.first);
                  // print(datas);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
