import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart'as globals;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
  
}

class _WeatherState extends State<Weather> {
@override
  void initState() {
    weather_data();
    // TODO: implement initState
    super.initState();
  }
  
  String? Weathers;
Future<void> weather_data()async{
  double lat = 55.0111;
  double lon = 15.0569;
  String key = "6b0c2b5306c6a3cf78bd205b8a305ac7";
  String cityName = 'Kongens Lyngby';
  WeatherFactory wf = WeatherFactory(key);
  var w = await wf.currentWeatherByLocation(lat, lon);
  print(w.weatherConditionCode);
  
  setState(() {
    globals.weather = w.weatherConditionCode;
  });

}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text(Weathers == null ? 'loading':Weathers!)),
    );
  }
}