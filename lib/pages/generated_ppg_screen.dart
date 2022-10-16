import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/funtionalities/ecg.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/ppgdata_provider.dart';




class GeneratedPpgPage extends StatefulWidget {
  const GeneratedPpgPage({Key? key, }) : super(key: key);
  @override
  _GeneratedPpgPageState createState() => _GeneratedPpgPageState();
}

class _GeneratedPpgPageState extends State<GeneratedPpgPage> {
   List<LiveData>? chartData;
  late ChartSeriesController _chartSeriesController;
    


@override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
        List data = generate_ecg(Provider.of<ppgdata_listner>(context,listen: false).ppg_data)[1];
print(data);
        
    chartData = [];

    for (int i = 0; i < data.length; i++){
      chartData!.add(LiveData(i, data[i]));
    }

    // Timer.periodic(const Duration(seconds: 10), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var val= generate_ecg(Provider.of<ppgdata_listner>(context,listen: false).ppg_data)[0];
print(val);
    // List data = context.watch<ppgdata_listner>().ppg_data;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('HealHer Detection: $val',style: kValueStyle,),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: SfCartesianChart(
                        series: <LineSeries<LiveData, int>>[
                      LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData!,
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                      )
                    ],
                        primaryXAxis: NumericAxis(
                          isVisible: false,
                            // majorGridLines: const MajorGridLines(width: 0),
                            // edgeLabelPlacement: EdgeLabelPlacement.shift,
                            // interval: 9,
                            // title: AxisTitle(text: 'Time (seconds)')
                            ),
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                            // axisLine: const AxisLine(width: 10),
                            // majorTickLines: const MajorTickLines(size: 0),
                            // title: AxisTitle(text: 'Internet speed (Mbps)')
                            )),
                  ),
                ],
              ),
            )));
  }

}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}

    