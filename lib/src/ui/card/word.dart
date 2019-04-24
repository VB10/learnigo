import 'package:flutter/material.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/styles/text.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key key,
    @required this.imageStreamBuilder,
  }) : super(key: key);

  final StreamBuilder<UnSplashModel> imageStreamBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Expanded(flex: 1, child: imageStreamBuilder),
                Container(
                  color: Colors.black26,
                  height: 1,
                ),
                FittedBox(
                  child: Container(
                    child: Text(
                      "Car",
                      style: lightStyle,
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
