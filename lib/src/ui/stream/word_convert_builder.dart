import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/models/item_model.dart';

class WordConvertStream extends StatelessWidget {
  const WordConvertStream({Key key, @required this.word}) : super(key: key);

  final String word;
  get kTransparentImage => "lib/assets/placeImage.png";

  @override
  Widget build(BuildContext context) {
    bloc.fetchallTranslate(this.word);
    return StreamBuilder(
      stream: bloc.allTranslates,
      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.results.first ?? "");
        } else if (snapshot.hasError) {
          return Text("error");
        } else {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
