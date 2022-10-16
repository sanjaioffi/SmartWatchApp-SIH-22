import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/body.dart';
import 'package:smartwatch_application_sih/pages/food_preferences_page.dart';
import 'package:smartwatch_application_sih/pages/mainpage.dart';
import 'package:smartwatch_application_sih/pages/retrival_page.dart';
import 'package:smartwatch_application_sih/widgets/custom_button.dart';
import 'package:smartwatch_application_sih/color_constants.dart' as colors;
import 'textstyles.dart';


class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  void save_data() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('activity', selected_option);
  }
  int selected_option = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:[
              Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Your level of activity?',style: kHeaderStyle,textAlign: TextAlign.center,),
                    ),
                    Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text('Using this information, we can lead you safely and promptly to your fitness goal.',textAlign: TextAlign.center,style: kSubtitleStyle,),
                    ),
                    const Divider(),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selected_option = 1;
                            print(selected_option);
                          });
                        },
                        child: Card(
                                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(48, 158, 158, 158),
                          ),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                              child: ListTile(
                                selectedColor: kprimaryGreenColor,
                                selectedTileColor: kprimaryGreenColor,
                                visualDensity: VisualDensity(vertical: 3),
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Icon(Icons.chair,color: kprimaryGreenColor,),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Little or No Activity',style: selected_option == 1?kTileSelectedStyle:kTileHeaderStyle,),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Mostly sitting through the day (eg. Desk Job, Bank Teller)', style: selected_option==1? kSelectedSubtitleStyle:kSubtitleStyle),
                                ),
                              ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selected_option = 2;
                            print(selected_option);
                          });
                        },
                        child: Card(
                                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(48, 158, 158, 158),
                          ),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                              child: ListTile(
                                selectedColor: kprimaryGreenColor,
                                selectedTileColor: kprimaryGreenColor,
                                visualDensity: VisualDensity(vertical: 3),
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Icon(Icons.chair,color: kprimaryGreenColor,),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Lightly Active',style: selected_option == 2?kTileSelectedStyle:kTileHeaderStyle,),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Mostly standing through the day (eg. Sales Associate, Teacher)', style: selected_option==2? kSelectedSubtitleStyle:kSubtitleStyle),
                                ),
                              ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selected_option = 3;
                            print(selected_option);
                          });
                        },
                        child: Card(
                                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(48, 158, 158, 158),
                          ),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                              child: ListTile(
                                selectedColor: kprimaryGreenColor,
                                selectedTileColor: kprimaryGreenColor,
                                visualDensity: VisualDensity(vertical: 3),
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Icon(Icons.chair,color: kprimaryGreenColor,),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Moderately Active',style: selected_option == 3?kTileSelectedStyle:kTileHeaderStyle,),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Mostly walking or doing physical activities through the day (eg. Tour Guide, Waiter)', style: selected_option==3? kSelectedSubtitleStyle:kSubtitleStyle),
                                ),
                              ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selected_option = 4;
                            print(selected_option);
                          });
                        },
                        child: Card(
                                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(48, 158, 158, 158),
                          ),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                              child: ListTile(
                                selectedColor: kprimaryGreenColor,
                                selectedTileColor: kprimaryGreenColor,
                                visualDensity: VisualDensity(vertical: 3),
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Icon(Icons.chair,color: kprimaryGreenColor,),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Very Active',style: selected_option == 4?kTileSelectedStyle:kTileHeaderStyle,),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Mostly doing heavy physical activities through the day (eg. Gym Instructor, Construction Worker)', style: selected_option==4? kSelectedSubtitleStyle:kSubtitleStyle),
                                ),
                              ),
                            ),
                      ),
                    ),
                    
                    

                    SizedBox(height:10),
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
          save_data();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return FoodPreferences();
          }));
        })
                 
            ]
          ),
        ),
      )),
    );
  }
}

