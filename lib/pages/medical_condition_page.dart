import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/activity_page.dart';
import 'package:smartwatch_application_sih/pages/mainpage.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/widgets/custom_button.dart';
import 'package:smartwatch_application_sih/color_constants.dart' as colors;


class MedicalConditionPage extends StatefulWidget {
  const MedicalConditionPage({Key? key}) : super(key: key);

  @override
  State<MedicalConditionPage> createState() => _MedicalConditionPageState();
}

List<String> tags = [];

  // list of string options
  List<String> options = [
    'Diabetes',
    'Heart Patient',
    'Blood Pressure',
    'Cholesterol',
    'Stress',
    'Sleep issues',
    'Depression',
    'Anger issues',
    'Hypertension',
    'PCOS',
    'Thyroid',
    'Physical Injury',
    'Excessive stress/anxiety',
    'Lonliness',
    'Relationship stress',
  ];

  void save_data()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('medical condition', tags);
  }


class _MedicalConditionPageState extends State<MedicalConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    
              
              children: [
                 Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('Any medical issues that we need to be aware of?',style: kHeaderStyle,textAlign: TextAlign.center,),
                ),
                Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text('Using this information, we can lead you safely and promptly to your fitness goal.',textAlign: TextAlign.center,style: kSubtitleStyle,),
                ),
                SizedBox(height: 50,),
                const Divider(),
                
                      
                      ChipsChoice<String>.multiple(
                        value: tags,
                        onChanged: (val) => {setState(() => tags = val)},
                        choiceItems: C2Choice.listFrom<String, String>(
                          source: options,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        choiceStyle: C2ChoiceStyle(
                          color: kprimaryTextColor,
                          borderColor: ktextfieldBorderColor,
                        ),
                        wrapped: true,
                        textDirection: TextDirection.ltr,
                      
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
          print(tags.toString());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return ActivityPage();
          }));
        })
      
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}