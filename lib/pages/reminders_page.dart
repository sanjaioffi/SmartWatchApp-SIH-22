import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/pages/medicine_page_main.dart';
import 'package:smartwatch_application_sih/pages/water_page_main.dart';
import 'package:smartwatch_application_sih/widgets/elevated_card.dart';

import '../providers/screen_provider.dart';
import 'textstyles.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat("dd MMMM, yyyy").format(DateTime.now());
    return Scaffold(
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){context.read<Screen_listner>().nextScreen(7);},
                  child: SizedBox(
                     height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/water.png',height: 80,width: 80,),
                          ),
                          Column(
                            children: [
                              Text('Water Remainder',style: kNameStyle,),
                              Text(currentDate,style: kTimeStyle,)
                  
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){context.read<Screen_listner>().nextScreen(8);},
                  child: SizedBox(
                    height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/medicine.png',height: 80,width: 80,),
                          ),
                          Column(
                            children: [
                              Text('Medicine Remainder',style: kNameStyle,),
                              Text(currentDate,style: kTimeStyle,)
                  
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              globals.period_length != null?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){context.read<Screen_listner>().nextScreen(9);},
                  child: SizedBox(
                    height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/periods.png',height: 80,width: 80,),
                          ),
                          Column(
                            children: [
                              Text('Period Remainder',style: kNameStyle,),
                              Text(currentDate,style: kTimeStyle,)
                  
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ):Text(''),
             
              
            ]
          ),
        ),
      )
    );
      
  }
}