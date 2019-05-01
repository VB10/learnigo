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
                    color: Color.fromRGBO(25, 22, 96, 0.1),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 1,
                  ),
                  FittedBox(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star,color: Colors.orangeAccent,),
                          SizedBox(width: 5),
                          Text(
                            this.word,
                            style: const TextStyle(
                              color: const Color(0xff191660),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Google Sans",
                              fontStyle: FontStyle.normal,
                              fontSize: 25
                            ),
                          ),
                        ],
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
