import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class WorApiProvider extends InheritedWidget {
  WorApiProvider({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  static WorApiProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(WorApiProvider)
        as WorApiProvider);
  }

  @override
  bool updateShouldNotify(WorApiProvider oldWidget) {
    return true;
  }
}
