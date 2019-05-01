import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/profile.dart';
import 'game.dart';

class DefaultTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SafeArea(
          child: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.gamepad,
                size: 30,
              )),
              Tab(
                  icon: Icon(
                Icons.settings,
                size: 30,
              )),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          children: <Widget>[TranslateScreen(), ProfileScreen()],
        ),
      ),
    );
  }
}
