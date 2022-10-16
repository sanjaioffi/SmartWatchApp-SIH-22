import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/funtionalities/food%20recommendation.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  State<FoodMainPage> createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  @override
  void initState() {
    // diet_plan_generate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List diet = diet_plan_generate();
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            child: Image.asset('assets/breakfast.png',height: 80,width: 80,),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            
                            child: Column(
                              children: [
                                Text('Breakfast',style: kNameStyle),
                                SizedBox(height: 30,),
                                AutoSizeText(diet[0],style: kTileValueStyle,)
                  
                              ],
                            ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/lunch.png',height: 80,width: 80,),
                          ),
                           SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              children: [
                                Text('Lunch',style: kNameStyle,),
                                SizedBox(height: 30,),
                                AutoSizeText(diet[1],style: kTileValueStyle,)
                                            
                              ],
                            ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/dinner.png',height: 80,width: 80,),
                          ),
                           SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              children: [
                                Text('Dinner',style: kNameStyle,),
                                SizedBox(height: 30,),
                                AutoSizeText(diet[2],style: kTileValueStyle,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
      
      
          ],
        ),
      ),
    );
  }
}

