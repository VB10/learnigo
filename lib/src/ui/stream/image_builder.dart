import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/models/image_model.dart';

class ImageCustomStream extends StatelessWidget {
  const ImageCustomStream({Key key, @required this.word}) : super(key: key);

  final String word;
  get kTransparentImage => "lib/assets/placeImage.png";

  @override
  Widget build(BuildContext context) {
    imageBloc.fetchImage(word);
    return StreamBuilder(
      stream: imageBloc.getImage,
      builder: (BuildContext context, AsyncSnapshot<UnSplashModel> snapshot) {
        if (snapshot.hasData) {
          return FadeInImage.assetNetwork(
            placeholder: kTransparentImage,
            width: 300,
            image: snapshot.data.results[0].urls.full,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Image.asset("lib/assets/placeImage.png");
        } else {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
