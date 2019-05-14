import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          isExtended: false,
        ),
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
            // onTap: (val) {
            //   print(val);
            //   if (val == 1)
            //     return;
            //   else {
            //     setState(() {
            //       initVal = val > 0 ? val - 1 : val;
            //     });
            //   }
            // },
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TranslateScreen(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ProfileScreen(),
            )
          ],
        ),
      ),
    );
  }
}
