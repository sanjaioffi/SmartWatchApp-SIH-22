import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';


class Finished extends StatefulWidget {
  const Finished({Key? key}) : super(key: key);

  @override
  State<Finished> createState() => _FinishedState();
  
}




class _FinishedState extends State<Finished> {

  @override
  Widget build(BuildContext context) {
  return Stack(children:[Scaffold(body: Center(child: Text('Congratulations \nYou Finished Up Today ',style: kHeaderStyle,)))])
    
;
  }
}