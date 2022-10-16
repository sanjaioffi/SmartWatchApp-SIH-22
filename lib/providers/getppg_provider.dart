import 'package:flutter/material.dart';

class getppg_listner with ChangeNotifier{
  bool _getppg = false;
  bool get getppg => _getppg;


    void getPpgData(bool get){
    _getppg = get;
    notifyListeners();
  }
}