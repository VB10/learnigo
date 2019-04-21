import 'package:flutter/material.dart';
import 'package:learnigo/src/blocs/translate_bloc.dart';
import 'package:learnigo/src/models/item_model.dart';

class TranslateList extends StatelessWidget {
  Future getItem() async {
    await bloc.fetchallTranslate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate Text"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getItem(),
        tooltip: "Translate",
        child: Icon(Icons.search),
      ),
      body: StreamBuilder(
        stream: bloc.allTranslates,
        builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            print("aaa ${snapshot.data.results.first}");
            return Text(snapshot.data.results.first);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("err");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
