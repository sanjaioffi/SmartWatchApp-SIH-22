import 'package:flutter/material.dart';

class Screen_listner with ChangeNotifier{
  int _currentScreen = 0;
  int get currentScreen => _currentScreen;



  void nextScreen(int screenIndex){
    _currentScreen = screenIndex;
    notifyListeners();
  }
}