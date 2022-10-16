import 'package:flutter/material.dart';

class Exercise_listner with ChangeNotifier{
  int _currentExercise = 0;
  int get currentExercise => _currentExercise;



  void nextExercise(){
    _currentExercise++;
    notifyListeners();
  }
}