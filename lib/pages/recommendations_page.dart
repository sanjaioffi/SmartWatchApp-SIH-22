import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart';
import 'package:smartwatch_application_sih/pages/exercise_page_main.dart';
import 'package:smartwatch_application_sih/pages/food_page_main.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/pages/yoga_page_main.dart';

import '../providers/screen_provider.dart';
import '../widgets/elevated_card.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat("dd MMMM, yyyy").format(DateTime.now());
    return Scaffold(

      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  context.read<Screen_listner>().nextScreen(10);
                },
                child: SizedBox(
                   height: 150,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    child: Row(
                      children: [
                        Image.asset('assets/ayush.png',height: 80,width: 80,),
                        Column(
                          children: [
                            Text('AYUSH Recommendations',style: kNameStyle,),
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
                onTap: (){
                  context.read<Screen_listner>().nextScreen(20);
                },
                child: SizedBox(
                   height: 150,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    child: Row(
                      children: [
                        Image.asset('assets/fitness.png',height: 80,width: 80,),
                        Column(
                          children: [
                            Text('General Recommendations',style: kNameStyle,),
                            Text(currentDate,style: kTimeStyle,)
                
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            
          ]
        ),
      )
    );
  }
}

