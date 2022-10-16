import 'dart:async';
import 'dart:convert' show utf8;
import 'package:smartwatch_application_sih/funtionalities/globals.dart'as globals;
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:oscilloscope/oscilloscope.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({Key ?key}) : super(key: key);

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
   List<double> traceDust = [];
  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    Oscilloscope oscilloscope = Oscilloscope(
      showYAxis: true,
      padding: 0.0,
      backgroundColor: Colors.black,
      traceColor: Colors.white,
      yAxisMax: 3000.0,
      yAxisMin: 0.0,
      dataSet: traceDust,
    );

    return Scaffold(
        body: Container(
                    child: StreamBuilder<List<int>>(
                      stream: globals.sendCharacteristic.value.listen,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<int>> snapshot) {
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');

                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          var currentValue = _dataParser(snapshot.data!);
                          traceDust.add(double.tryParse(currentValue) ?? 0);

                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Current value from Sensor',
                                          style: TextStyle(fontSize: 14)),
                                      Text('${currentValue} ug/m3',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24))
                                    ]),
                              ),
                              Expanded(
                                flex: 1,
                                child: oscilloscope,
                              )
                            ],
                          ));
                        } else {
                          return Text('Check the stream');
                        }
                      },
                    ),
                  ));
      
  }
}