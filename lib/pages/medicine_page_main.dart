import 'package:flutter/material.dart';

class MedicinePageMain extends StatefulWidget {
  const MedicinePageMain({Key? key}) : super(key: key);

  @override
  State<MedicinePageMain> createState() => _MedicinePageMainState();
}

class _MedicinePageMainState extends State<MedicinePageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Medicine page'),
    );
  }
}