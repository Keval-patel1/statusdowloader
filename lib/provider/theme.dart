import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier{
  static bool _isDark  =true;
  ThemeData currentTheme(){
    return _isDark?ThemeData.dark():ThemeData.light();
  }
  void switchTheme(){
    _isDark = !_isDark;
    notifyListeners();
    notifyListeners();

  }
}