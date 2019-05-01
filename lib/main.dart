import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/deafult_tabbar.dart';
import 'package:learnigo/src/ui/screen/profile.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: "/profile",
      routes: {
        '/': (context) => DefaultTabbar(),
        '/profile': (context) => ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
