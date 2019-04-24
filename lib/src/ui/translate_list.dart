import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/styles/text.dart';
import 'package:english_words/english_words.dart';
import 'package:learnigo/util/enum/snapshot_type.dart';
import 'package:connectivity/connectivity.dart';

class TranslateList extends StatefulWidget {
  @override
  _TranslateListState createState() => _TranslateListState();
}

class _TranslateListState extends State<TranslateList> {
  final kTransparentImage = "lib/assets/placeImage.png";
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  String data;
  @override
  void initState() {
    super.initState();
    //TODO Real devices test.
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((vla) {
      if (vla != ConnectivityResult.none) {
        getItem();
      } else {}
    });
  }

  Future getItem() async {
    // await bloc.fetchallTranslate(textFC.text);
    await imageBloc.fetchImage("car");
    bloc.getEnglishWord(1);
  }

  streamWidget(SnapshotType type, {UnSplashModel model: null}) {
    switch (type) {
      case SnapshotType.success:
        return FadeInImage.assetNetwork(
          placeholder: this.kTransparentImage,
          width: 300,
          image: model.results[0].urls.full,
        );
      case SnapshotType.error:
        return Image.asset(kTransparentImage);
      case SnapshotType.loading:
        return Center(
          child: LinearProgressIndicator(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    getItem();
    Widget imageStreamBuilder = StreamBuilder(
      stream: imageBloc.getImage,
      builder: (BuildContext context, AsyncSnapshot<UnSplashModel> snapshot) {
        if (snapshot.hasData) {
          return streamWidget(SnapshotType.success, model: snapshot.data);
        } else if (snapshot.hasError) {
          return streamWidget(SnapshotType.error);
        } else {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return streamWidget(SnapshotType.loading);
          } else {
            return streamWidget(SnapshotType.error);
          }
        }
      },
    );

    var val = StreamBuilder(
      stream: bloc.getWord,
      initialData: "s",
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        this.data = snapshot.data ?? "-";
        return Container(
          child: new WordCard(
              imageStreamBuilder: imageStreamBuilder,
              word: snapshot.data ?? "-"),
        );
      },
    );

    Widget wordCard =
        new WordCard(imageStreamBuilder: imageStreamBuilder, word: "car");
    return Scaffold(
      appBar: AppBar(
        title: Text("Learnigo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return StreamBuilder(
                  stream: bloc.allTranslates,
                  builder: (BuildContext context,
                      AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: LinearProgressIndicator(),
                      );
                    } else {}
                    return Container(
                      child: Text(snapshot.data.results.first ?? ""),
                    );
                  },
                );
              });
          bloc.fetchallTranslate(this.data);
        },
        tooltip: "Translate",
        child: Icon(Icons.search),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: val,
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
