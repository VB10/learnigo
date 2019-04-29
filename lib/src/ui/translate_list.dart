import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/src/ui/stream/word_convert_builder.dart';
import 'package:learnigo/src/ui/widget/column_row_fit.dart';

class TranslateList extends StatefulWidget {
  @override
  _TranslateListState createState() => _TranslateListState();
}

class _TranslateListState extends State<TranslateList> {
  final kTransparentImage = "lib/assets/placeImage.png";
  String _data;
  @override
  initState() {
    super.initState();
    getItem();
  }

  getItem() async {
    this._data = bloc.getEnglishWord(1);
    await imageBloc.fetchImage(this._data);
  }

  succesOnPress() {}
  failOnPress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learnigo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buildShowDialog(context),
        tooltip: "Translate",
        child: Icon(Icons.search),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: WordCard(word: this._data),
          ),
          Expanded(
            flex: 1,
            child: ExpandedColumnWidget(
              children: <Widget>[
                Expanded(
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      color: Colors.red,
                      onPressed: succesOnPress(),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      color: Colors.red,
                      onPressed: failOnPress(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return WordConvertStream(
            word: this._data,
            key: Key("DialogWord"),
          );
        });
  }
}
