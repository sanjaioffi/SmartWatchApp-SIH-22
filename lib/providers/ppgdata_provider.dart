import 'package:flutter/material.dart';

class ppgdata_listner with ChangeNotifier{
  List<int> _ppg_data = [321,343,325,321,232,643];
  List<int> get ppg_data => _ppg_data;

    void save_ppg_data(int ppg){
    _ppg_data.add(ppg);
    notifyListeners();
  }


}