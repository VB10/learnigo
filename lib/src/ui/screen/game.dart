import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/src/ui/widget/column_row_fit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TranslateScreen extends StatefulWidget {
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
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

  succesOnPress() {
    Alert(context: this.context, title: "RFLUTTER", desc: "Flutter is awesome.")
        .show();
  }

  failOnPress() {}
  // The easiest way for creating RFlutter Alert

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learnigo"),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildShowDialog(context),
        tooltip: "Translate",
        child: Icon(Icons.live_help),
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
                      onPressed: () => {},
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
}
