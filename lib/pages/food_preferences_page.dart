import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/pages/period_info_page.dart';
import 'package:smartwatch_application_sih/pages/retrival_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/color_constants.dart' as colors;

class FoodPreferences extends StatefulWidget {
  const FoodPreferences({Key? key}) : super(key: key);

  @override
  State<FoodPreferences> createState() => _FoodPreferencesState();
}

class _FoodPreferencesState extends State<FoodPreferences> {
    void save_data(String food_pref, String food_type)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('food prefs', food_pref);
    prefs.setString('food type', food_type);
    prefs.setBool('is login', true);
  }
  var food_type = 'South';
  var food_preference = 'Non Vegan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('Food Preferences?',style: kHeaderStyle,textAlign: TextAlign.center,),
                        ),
                        Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Text('Using this information, Our AI will make a personalized diet plan for you',textAlign: TextAlign.center,style: kSubtitleStyle,),
                        ),
                        const Divider(),
                                    const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Do you like North Indian or South Indian Food',style: kTileHeaderStyle,),
              ),
                        Padding(
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
                child: ListTile(  
                  title: Text('North Indian',style: kNameStyle,),  
                  leading: Radio(  
                    value: 'North',  
                    groupValue: food_type,  
                    onChanged: ( value) {  
                      setState(() {  
                        food_type = value.toString(); 
                      });  
                    },  
                  ),  
                ),
              ), 
              Padding(
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
                child: ListTile(  
                  title: Text('South Indian',style: kNameStyle,),  
                  leading: Radio(  
                    value: 'South',  
                    groupValue: food_type,  
                    onChanged: ( value) {  
                      setState(() {  
                        food_type = value.toString(); 
                      });  
                    },  
                  ),  
                ),
              ),
              const SizedBox(height: 25,),
              const Divider(),
              const SizedBox(height: 25,),                      
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('what you would like non-vegan or vegan',style: kTileHeaderStyle,),
              ),
                        Padding(
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
                child: ListTile(  
                  title: Text('Vegan',style: kNameStyle,),  
                  leading: Radio(  
                    value: 'Vegan',  
                    groupValue: food_preference,  
                    onChanged: ( value) {  
                      setState(() {  
                        food_preference = value.toString(); 
                      });  
                    },  
                  ),  
                ),
              ), 
              Padding(
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
                child: ListTile(  
                  title: Text('Non Vegan',style: kNameStyle,),  
                  leading: Radio(  
                    value: 'Non Vegan',  
                    groupValue: food_preference,  
                    onChanged: ( value) {  
                      setState(() {  
                        food_preference = value.toString(); 
                      });  
                    },  
                  ),  
                ),
              ),
              SizedBox(height:90),
                      InkWell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,0, 8,10),
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: colors.kprimaryGreenColor , borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text('NEXT',style: kButtonStyle))),
          ),
          onTap: () {
            save_data(food_preference,food_type);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
                  
              return RetrivalPoint();
            }));
          })
              ]
          ),
        ),
      ),
    );
  }
}