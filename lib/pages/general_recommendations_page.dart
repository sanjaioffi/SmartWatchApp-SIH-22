import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';

class GeneralRecommendationsPage extends StatefulWidget {
  const GeneralRecommendationsPage({Key? key}) : super(key: key);

  @override
  State<GeneralRecommendationsPage> createState() => _GeneralRecommendationsPageState();
}

class _GeneralRecommendationsPageState extends State<GeneralRecommendationsPage> {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat("dd MMMM, yyyy").format(DateTime.now());
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    context.read<Screen_listner>().nextScreen(3);
                  },
                  child: SizedBox(
                     height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Image.asset('assets/workout.png',height: 80,width: 80,),
                          Column(
                            children: [
                              Text('Exercise recommendations',style: kNameStyle,),
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
                    context.read<Screen_listner>().nextScreen(4);
                  },
                  child: SizedBox(
                    height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/yoga.png',height: 80,width: 80,),
                          ),
                          Column(
                            children: [
                              Text('Yoga recommendations',style: kNameStyle,),
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
                  onTap: (){context.read<Screen_listner>().nextScreen(5);},
                  child: SizedBox(
                     height: 150,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/diet.png',height: 80,width: 80,),
                          ),
                          Column(
                            children: [
                              Text('Food recommendations',style: kNameStyle,),
                              Text(currentDate,style: kTimeStyle,)
                  
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}