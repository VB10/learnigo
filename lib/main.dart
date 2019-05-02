import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/deafult_tabbar.dart';
import 'package:learnigo/src/ui/screen/profile.dart';
import 'package:learnigo/src/ui/screen/temp/carddrag.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: "/temp",
      routes: {
        '/': (context) => DefaultTabbar(),
        '/profile': (context) => ProfileScreen(),
        '/temp': (context) => MyHomePage(title: "veli",)
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
