import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:learnigo/src/sqlite/model/word.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/src/ui/stream/word_convert_builder.dart';
import 'package:learnigo/src/ui/widget/box/fitted_column.dart';
import 'package:learnigo/src/ui/widget/card/main.dart';
import 'package:learnigo/src/ui/widget/icon/icon_text.dart';
import 'package:learnigo/styles/colors.dart';
import 'package:learnigo/styles/text.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TranslateScreen extends StatefulWidget {
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen>
    with AutomaticKeepAliveClientMixin<TranslateScreen> {
  final kTransparentImage = "lib/assets/placeImage.png";
  String _data = "";
  final dbHelper = SqliteManager.instance;

  @override
  initState() {
    super.initState();
    _getItem();
  }

  _getItem() async {
    String localData = await bloc.getEnglishWord(1);
    // first call
    setState(() {
      _data = localData;
    });
    if (this._data.isEmpty) return;

    await imageBloc.fetchImage(this._data);
  }

  Future _succesOnPress() async {
    final model = UserWordInformation();
    model.word = this._data;
    model.know = 1;

    //if already answered update database value.
    bool isAnswerData = await dbHelper.queryIsTableHaveData(model.word);
    if (isAnswerData) {
      dbHelper.queryUpdateRowItemKnow(model.word, true);
    } else {
      dbHelper.insert(model.toMap());
    }
    await _getItem();
  }

  void _fabOnPress() {
    Alert(
      context: this.context,
      title: "Çeviri",
      type: AlertType.info,
      content: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          Text(this._data),
          Icon(Icons.compare_arrows),
          WordConvertStream(
            word: this._data,
            key: Key("DialogWord"),
          )
        ],
      ),
    ).show();
  }

  void _failOnPress() {
    final model = UserWordInformation();
    model.word = this._data;
    model.know = 0;
    print(dbHelper.insert(model.toMap()));
    _getItem();
  }
  // The easiest way for creating RFlutter Alert

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        toolbarOpacity: 0,
        backgroundColor: backgroundColor,
        title: Row(
          children: <Widget>[
            Text("Learnigo", style: appBarTitleStyle),
            SizedBox(width: 30),
            Text("- Learn english best way", style: subTitleStyle)
          ],
        ),
      ),
      body: MovieCardWidget(
        child: WordCard(
          word: this._data,
          fabPress: this._fabOnPress,
        ),
        onRightPress: this._failOnPress,
        onRight: FittedColumnWidget(
          child: IconTextWidget(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.black,
            ),
            text: "Bilmiyorum",
          ),
        ),
        onLeftPress: this._succesOnPress,
        onLeft: FittedColumnWidget(
          child: IconTextWidget(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.pink,
            ),
            text: "Biliyorum",
          ),
        ),
      ),
    );
  }

//User save current state..
  @override
  bool get wantKeepAlive => true;
}
