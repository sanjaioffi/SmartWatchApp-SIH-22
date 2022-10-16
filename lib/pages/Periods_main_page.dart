import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;


class PeriodsMainPage extends StatefulWidget {
  const PeriodsMainPage({Key? key}) : super(key: key);

  @override
  State<PeriodsMainPage> createState() => _PeriodsMainPageState();
}

class _PeriodsMainPageState extends State<PeriodsMainPage> {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  
  @override
  Widget build(BuildContext context) {
    
    int remainingDays(fromDate){
    var currentDate = DateTime.now();
    int remaining_days = currentDate.difference(fromDate).inDays;
    print('done');
    return remaining_days;
  }

    DateTime NextPeriod(DateTime lastPeriodDate,periodLength,){
    DateTime nextPeriod = lastPeriodDate.add(Duration(days: 20));
    return nextPeriod;
  }

  String FertilityWindow(){
    int remaining_days = remainingDays(dateFormat.parse(globals.last_period_date));
    if (remaining_days == 1){
      return 'LOW';
    }else if (remaining_days<10){
      return 'LOW';
    }else if (remaining_days>10 && remaining_days < 13){
      return 'MEDIUM';
    }else if (remaining_days == 14){
      return 'HIGH';
    }else if (remaining_days==15 && remaining_days==16){
      return 'MEDIUM';
    }return 'LOW';
  }
    return Scaffold(
      body: Column(
        children:[
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            Text(' Last Period Date: ',style: kTimeStyle,),
                            Text(globals.last_period_date,style: kTimeStyle,),
                          ],
                        ),
                        
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.timeline),
                              Text('${globals.period_length.toString()} days', style: kTimeStyle,)
                            ],
                          ),
                        ),
                        
                        
                      ],
                    ),
                  ),
                ),
              ),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/left.png',height: 80,width: 80,),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/10,),
                        Column(
                          children: [
                            Text('Next Period',style: kNameStyle,),
                            SizedBox(height: 150/4,),
                            RichText(
                                  text: TextSpan(
                                      text: (globals.period_length - remainingDays(dateFormat.parse(globals.last_period_date))).toString(),
                                      style: kHeaderStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' Days LEFT',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                )
                
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/fertility window.png',height: 80,width: 80,),
                        ),
                         SizedBox(width: MediaQuery.of(context).size.width/10,),
                        Column(
                          children: [
                             Text('Fertility Window',style: kNameStyle,),
                             SizedBox(height: 150/4,),
                            Text(FertilityWindow(),style: kHeaderStyle,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
        ]
      ),
    );
  }
}