import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/styles/text.dart';

class TranslateList extends StatelessWidget {
  get kTransparentImage => "lib/assets/placeImage.png";
  Future getItem() async {
    // await bloc.fetchallTranslate(textFC.text);
    await imageBloc.fetchImage("car");
  }

  @override
  Widget build(BuildContext context) {
    getItem();
    var imageStreamBuilder = StreamBuilder(
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

    var column2 = new WordCard(imageStreamBuilder: imageStreamBuilder);

    Widget card = Card(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        elevation: 10,
        child: column2);
    return Scaffold(
      appBar: AppBar(
        title: Text("Learnigo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getItem(),
        tooltip: "Translate",
        child: Icon(Icons.search),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: card,
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: FittedBox(
                                child: IconButton(
                          icon: Icon(Icons.check),
                          color: Colors.green,
                          onPressed: () {},
                        ))),
                        Expanded(
                            child: FittedBox(
                                child: IconButton(
                          icon: Icon(Icons.cancel),
                          color: Colors.red,
                          onPressed: () {},
                        ))),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
