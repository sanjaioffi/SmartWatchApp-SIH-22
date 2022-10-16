import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BmiResultPage extends StatefulWidget {
  const BmiResultPage({Key? key, required this.bmi}) : super(key: key);
  final bmi;
  @override
  State<BmiResultPage> createState() => _BmiResultPageState();
}

class _BmiResultPageState extends State<BmiResultPage> {
  String bmiImage() {
    if (widget.bmi <= 24.9) {
      return 'assets/normal-results.json';
    } else if (widget.bmi >= 25 && widget.bmi <= 29.9) {
      return 'assets/overweight-result.json';
    } else if (widget.bmi >= 30 && widget.bmi <= 39.9) {
      return 'assets/obesity-result.json';
    }
    return 'assets/morbid-obesity-results.json';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        
        child: Column(children: [LottieBuilder.asset(bmiImage(),frameRate: FrameRate.max)])),
    );
  }
}
