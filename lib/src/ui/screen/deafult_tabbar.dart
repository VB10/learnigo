import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/profile.dart';
import 'game.dart';

class DefaultTabbar extends StatefulWidget {
  @override
  _DefaultTabbarState createState() => _DefaultTabbarState();
}

class _DefaultTabbarState extends State<DefaultTabbar> {
  final defaultWidget = [TranslateScreen(), ProfileScreen()];
  var initVal = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.gamepad,
                size: 30,
                color: Color(0xFF191660),
              )),
              InkWell(
                onTap: () => print('hello'),
                child: new Container(
                  //width: 100.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                    color: Colors.blueAccent,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFf37335), Color(0xFFfdc830)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: new BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: FittedBox(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              Tab(
                  icon: Icon(
                Icons.person_outline,
                size: 30,
                color: Color(0xFF191660),
              )),
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.transparent,
            onTap: (val) {
              print(val);
              if (val == 1)
                return;
              else {
                setState(() {
                  initVal = val > 0 ? val - 1 : val;
                });
              }
            },
          ),
        ),
        body: this.defaultWidget[initVal],
      ),
    );
  }
}
