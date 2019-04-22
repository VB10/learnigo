import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/styles/text.dart';

class TranslateList extends StatelessWidget {
  var textFC = TextEditingController();
  Future getItem() async {
    // await bloc.fetchallTranslate(textFC.text);
    await imageBloc.fetchImage(",");
  }

  @override
  Widget build(BuildContext context) {
    textFC.text = "car";

    var imageStreamBuilder = StreamBuilder(
      stream: imageBloc.getImage,
      builder: (BuildContext context, AsyncSnapshot<UnSplashModel> snapshot) {
        if (snapshot.hasData && snapshot.data.total != 0) {
          print("aaa ${snapshot.data.total}");
          return Image.network(
            snapshot.data.results[0].urls.full,
            height: 100,
          );
        } else if (snapshot.hasError || snapshot.data.total == 0) {
          print(snapshot.error);
          return Image.asset("lib/assets/placeImage.png");
        }
        return Center(
          child: LinearProgressIndicator(),
        );
      },
    );

    var column2 = Row(
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
