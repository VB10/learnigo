import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/deafult_tabbar.dart';
import 'package:learnigo/src/ui/screen/login/login.dart';
import 'package:learnigo/src/ui/screen/profile.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:learnigo/src/ui/screen/splash.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  runApp(App());
}

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
            initialRoute: "/",
            routes: {
              '/': (context) => SplashView(),
              '/profile': (context) => ProfileScreen(),
              '/login': (context) => GoogleLoginScreen(),
              '/tab': (context) => DefaultTabbar()
              // '/temp': (context) => MovieCardWidget()
            },
          );
        });
  }
}
