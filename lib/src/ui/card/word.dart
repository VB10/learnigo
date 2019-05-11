import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/stream/image_builder.dart';
import 'package:learnigo/styles/card.dart';
import 'package:learnigo/styles/text.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key key,
    @required this.word,
    @required this.fabPress,
  }) : super(key: key);

  final String word;
  final VoidCallback fabPress;
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
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageCustomStream(word: this.word),
                      )),
                  Container(
                    color: wordBackground,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.orangeAccent),
                            Text(
                              this.word,
                              style: wordStyle,
                            ),
                          ],
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: this.fabPress,
                        child: Icon(Icons.translate),
                        mini: true,
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
