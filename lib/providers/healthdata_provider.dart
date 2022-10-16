import 'package:flutter/material.dart';

class healthdata_listner with ChangeNotifier{
  List _health_data = ['A','0','0','0','0'];
  List get health_data => _health_data;


    void save_health_data(List data){
    _health_data = data;
    notifyListeners();
  }
}