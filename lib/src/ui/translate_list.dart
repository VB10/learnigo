import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/image_bloc.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/ui/card/word.dart';
import 'package:learnigo/src/ui/widget/fit.dart';
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
    bloc.getEnglishWord(1);

    bloc.getWord.listen((val) {
      imageBloc.fetchImage(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    getItem();
    Widget imageStreamBuilder = StreamBuilder(
      stream: imageBloc.getImage,
      builder: (BuildContext context, AsyncSnapshot<UnSplashModel> snapshot) {
        if (snapshot.hasData) {
          return FadeInImage.assetNetwork(
            placeholder: this.kTransparentImage,
            width: 300,
            image: snapshot.data.results[0].urls.full,
          );
        } else if (snapshot.hasError) {
          return Image.asset(kTransparentImage);
        }
        return Center(child: LinearProgressIndicator());
      },
    );

    var wordStream = StreamBuilder(
      stream: bloc.getWord,
      initialData: "",
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        this.data = snapshot.data ?? "-";
        return Container(
          child: new WordCard(
              imageStreamBuilder: imageStreamBuilder,
              word: snapshot.data ?? "-"),
        );
      },
    );

    succesOnPress() {}
    failOnPress() {}
    floatinOnPress() {}

    return Scaffold(
        appBar: AppBar(
          title: Text("Learnigo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildShowDialog(context);
            bloc.fetchallTranslate(this.data);
          },
          tooltip: "Translate",
          child: Icon(Icons.search),
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Expanded(
            flex: 1,
            child: wordStream,
          ),
          //TODO button add children property HAVE ERROR FIX IT!!!
          Expanded(flex: 1, child: ExpandedColumnWidget(data: this.data,context: this.context))
        ]));
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StreamBuilder(
            stream: bloc.allTranslates,
            builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
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
  }
}
