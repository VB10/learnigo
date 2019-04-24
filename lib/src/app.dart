import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/translate_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: TranslateList(),
    );
  }
}
