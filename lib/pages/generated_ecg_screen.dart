// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:smartwatch_application_sih/funtionalities/ecg.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import '../providers/ppgdata_provider.dart';




// class GeneratedEcgPage extends StatefulWidget {
//   const GeneratedEcgPage({Key? key, }) : super(key: key);
//   @override
//   _GeneratedEcgPageState createState() => _GeneratedEcgPageState();
// }

// class _GeneratedEcgPageState extends State<GeneratedEcgPage> {
//   late List<LiveData> chartData;
//   late ChartSeriesController _chartSeriesController;


//   @override
//   void initState() {
//     List ecg_value = plot_ecg(context.watch<ppgdata_listner>().ppg_data);
//     chartData = [];

//     for (int i = 0; i < ecg_value.length; i++){
//       chartData.add(LiveData(i, ecg_value[i]));
//     }

//     // Timer.periodic(const Duration(seconds: 10), updateDataSource);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List data = context.watch<ppgdata_listner>().ppg_data;
//     return SafeArea(
//         child: Scaffold(
//             body: Container(
//               width: double.infinity,
//               height: 300,
//               child: SfCartesianChart(
//                   series: <LineSeries<LiveData, int>>[
//           LineSeries<LiveData, int>(
//               onRendererCreated: (ChartSeriesController controller) {
//                 _chartSeriesController = controller;
//               },
//               dataSource: chartData,
//               color: const Color.fromRGBO(192, 108, 132, 1),
//               xValueMapper: (LiveData sales, _) => sales.time,
//               yValueMapper: (LiveData sales, _) => sales.speed,
//           )
//         ],
//                   primaryXAxis: NumericAxis(
//                     isVisible: false,
//                       // majorGridLines: const MajorGridLines(width: 0),
//                       // edgeLabelPlacement: EdgeLabelPlacement.shift,
//                       // interval: 9,
//                       // title: AxisTitle(text: 'Time (seconds)')
//                       ),
//                   primaryYAxis: NumericAxis(
//                     isVisible: false,
//                       // axisLine: const AxisLine(width: 10),
//                       // majorTickLines: const MajorTickLines(size: 0),
//                       // title: AxisTitle(text: 'Internet speed (Mbps)')
//                       )),
//             )));
//   }

// }

// class LiveData {
//   LiveData(this.time, this.speed);
//   final int time;
//   final num speed;
// }

    