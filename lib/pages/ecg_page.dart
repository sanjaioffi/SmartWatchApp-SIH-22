import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/providers/ppgdata_provider.dart';
import 'package:smartwatch_application_sih/funtionalities/write_data.dart';

import '../providers/screen_provider.dart';


class EcgScreen extends StatefulWidget {
  const EcgScreen({Key? key}) : super(key: key);

  @override
  State<EcgScreen> createState() => _EcgScreenState();
}

class _EcgScreenState extends State<EcgScreen> {
  
  @override
  Widget build(BuildContext context) {
    bool getting_values  = false;
      List ppgValues = context.watch<ppgdata_listner>().ppg_data;

    return SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Center(
                  child: TextButton(onPressed: (){
                      context.read<Screen_listner>().nextScreen(21);
                      writeData('C');
                      
                        // i want to call the write function here
                  }, child:  Text('ready',style: kHeaderStyle,)),
                ),
           

                ],
            ),
          ),
        ),
      )
    ;


  }
}