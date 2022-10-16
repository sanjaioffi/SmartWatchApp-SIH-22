import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';

class ReceivingPage extends StatefulWidget {
  const ReceivingPage({Key? key}) : super(key: key);

  @override
  State<ReceivingPage> createState() => _ReceivingPageState();
}

class _ReceivingPageState extends State<ReceivingPage> {
 
  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 60), (){
        context.read<Screen_listner>().nextScreen(2);
     });
    return Scaffold(
      body:SafeArea(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: LoadingAnimationWidget.beat(
                         color: kprimaryGreenColor,
                         size: 200,
                       ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Follow the instructions properly otherwise it may be any fluctuation in the ecg graph',style: kValueStyle,),
                 )
          ],
        ),
      ) ,
    );
  }
}