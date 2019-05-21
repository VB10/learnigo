import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/deafult_tabbar.dart';
import 'package:learnigo/src/ui/screen/login/login.dart';
import 'package:learnigo/src/ui/screen/profile.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme,
            initialRoute: "/google",
            routes: {
              '/': (context) => DefaultTabbar(),
              '/profile': (context) => ProfileScreen(),
              '/google': (context) => GoogleLoginScreen(),
              // '/temp': (context) => MovieCardWidget()
            },
          );
        });
  }
}
