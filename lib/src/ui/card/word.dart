import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/stream/image_builder.dart';
import 'package:learnigo/styles/text.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key key,
    @required this.word,
  }) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(flex: 1, child: ImageCustomStream(word: this.word)),
                  Container(
                    color: Colors.black26,
                    height: 1,
                  ),
                  FittedBox(
                    child: Container(
                      child: Text(
                        this.word,
                        style: lightStyle,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
