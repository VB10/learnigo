import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:learnigo/src/sqlite/model/word.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/src/ui/widget/box/fitted_column.dart';
import 'package:learnigo/src/ui/widget/card/main.dart';
import 'package:learnigo/src/ui/widget/icon/icon_text.dart';
import 'package:learnigo/styles/colors.dart';
import 'package:learnigo/styles/text.dart';

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
    _getItem();
    super.initState();
  }

  _getItem() async {
    // first call
    if (this._data.isNotEmpty) return;

    setState(() {
      _data = bloc.getEnglishWord(1);
    });
    await imageBloc.fetchImage(this._data);
  }

  void _succesOnPress() {
    final model = UserWordInformation();
    model.word = this._data;
    model.know = 1;
    print(dbHelper.insert(model.toMap()));
    // getItem();
  }

  void _fabOnPress() {
    // Alert(context: this.context, title: "RFLUTTER", desc: "Flutter is awesome.")
    //     .show();
    print("right");
  }

  void _failOnPress() {
    final model = UserWordInformation();
    model.word = this._data;
    model.know = 0;
    print(dbHelper.insert(model.toMap()));
    // getItem();
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
      backgroundColor: backgroundColor,
      body: MovieCardWidget(
        child: WordCard(
          word: this._data,
          fabPress: this._fabOnPress,
        ),
        onRightPress: this._succesOnPress,
        onRight: FittedColumnWidget(
          child: IconTextWidget(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.black,
            ),
            text: "Bilmiyorum",
          ),
        ),
        onLeftPress: this._failOnPress,
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

  _buildShowDialog(BuildContext context) {
    // Navigator.pop(context);
    //TODO add buttons and fix button cancel error.
    // Alert(
    //   context: context,
    //   title: "Türkçe",
    //   type: AlertType.none,
    //   buttons: DialoB,
    //   content: WordConvertStream(
    //     word: this._data,
    //     key: Key("DialogWord"),
    //   ),
    // ).show();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
