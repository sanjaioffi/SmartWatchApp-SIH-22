import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/funtionalities/bmi.dart';
import 'package:smartwatch_application_sih/funtionalities/climatic_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/exercise_reccomendation.dart';
import 'package:smartwatch_application_sih/pages/body.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:weather/weather.dart';


class RetrivalPoint extends StatefulWidget {
  const RetrivalPoint({Key? key}) : super(key: key);

  @override
  State<RetrivalPoint> createState() => _RetrivalPointState();
}


class _RetrivalPointState extends State<RetrivalPoint> {

  Future<void> weather_data()async{
  double lat = 9.528590;
  double lon = 76.821896;
  String key = "6b0c2b5306c6a3cf78bd205b8a305ac7";
  WeatherFactory wf = WeatherFactory(key);
  var w = await wf.currentWeatherByLocation(lat, lon);
  print(w.areaName);
  print(w.weatherConditionCode);
  
  setState(() {
    globals.weather = w.weatherConditionCode;
  });}

String Season(){
  var month = DateTime.now().month;
  print(month);
  if (month == 12 || month == 1 ){
    return "Winter";
  }else if (month == 2 || month <= 3){
    return "Spring";
  }else if (month >= 4 && month <= 6){
    return "Summer";
  }else if (month >= 7 && month <= 9){
    return "Monsoon";
  }else{
    return 'Autumn';
  }
}






        



  void RetriveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.gender = prefs.getString('gender');
      globals.name = prefs.getString('name');
      globals.age = prefs.getInt('age');
      globals.gender = prefs.getString('gender');
      globals.height = prefs.getDouble('height')!/100;
      globals.weight = prefs.getDouble('weight');
      globals.isdiabetic = prefs.getStringList('medical condition')!.contains('Diabetes');
      globals.hasCholesterol = prefs.getStringList('medical condition')!.contains('Cholesterol');
      globals.isHeartPatient = prefs.getStringList('medical condition')!.contains('Heart Patient');    
      globals.hasBP = prefs.getStringList('medical condition')!.contains('Blood Pressure'); 
      globals.food_type = prefs.getString('food type');
      globals.food_preference = prefs.getString('food prefs');
      globals.period_length = prefs.getInt('period lenghth');
      globals.last_period_date = prefs.getString('last_period_date');
      globals.season = Season();
     
      
      
      
    });
    print('saved');
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RetriveData();
    weather_data();
    // globals.spo2_oxygen = context.watch<healthdata_listner>().health_data[2];
    // globals.systolic = context.watch<healthdata_listner>().health_data[3];
    // globals.diastolic = context.watch<healthdata_listner>().health_data[4];

Timer(Duration(seconds: 2), (){
  globals.calorie_required = calculate_calories(globals.height, globals.weight, globals.age, globals.gender);

    bmi_calculation();
    
    });
    
    

  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), (){
      Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
                
            return Body();
          }));
              globals.weather!=null?Fluttertoast.showToast(
        msg: generate_c_advices(globals.weather),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ):null
    ;
    });
    return Scaffold(
      body: Center(
        child: Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    // const SizedBox(width: 20.0, height: 100.0),
    // const Text(
    //     'Be',
    //     style: TextStyle(fontSize: 43.0),
    // ),
    // const SizedBox(width: 20.0, height: 100.0),
    DefaultTextStyle(
        style: const TextStyle(
          fontSize: 40.0,
          fontFamily: 'Horizon',
        ),
        child: AnimatedTextKit(
          pause:const Duration(milliseconds: 1),
          totalRepeatCount: 5,
          animatedTexts: [
            RotateAnimatedText('HEALTH',textStyle: kHeaderStyle),
            RotateAnimatedText('RECOMMENDATIONS',textStyle: kHeaderStyle),
            RotateAnimatedText('REMINDERS',textStyle:kHeaderStyle),
            RotateAnimatedText('HEALHER',textStyle:kHeaderStyle),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
    ),
  ],
),
      )
    );
  }
}