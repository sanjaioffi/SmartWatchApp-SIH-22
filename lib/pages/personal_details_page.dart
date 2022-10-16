import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/pages/medication_details_page.dart';
import 'package:smartwatch_application_sih/color_constants.dart' as colors;
import 'package:smartwatch_application_sih/pages/period_info_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import '../widgets/custom_button.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  final List<String> genderItems = [
  'Male',
  'Female',
  'others'
];

String? genderValue;


  void save_details()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name.value.text);
      prefs.setInt('age', int.parse(age.value.text));
      prefs.setDouble('height', double.parse(height.value.text));
      prefs.setDouble('weight', double.parse(weight.value.text));
      prefs.setString('gender', genderValue!);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                          child: Text('HEALHER',style: kMainHeaderStyle,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,8,0),
                          child: Text('The groundwork of all happiness is health.',style: kSubtitleStyle,),
                        )
                      ],
                    )
                  ],
                ),
                // Stack(
                //                   alignment: AlignmentDirectional.bottomEnd,
                //                   children: [
                //                     const CircleAvatar(
                //                       backgroundImage: AssetImage(
                //                           'assets/no dp-modified.png'),
                //                       radius: 50,
                //                     ),
                //                     Container(
                //                         width: 25,
                //                         height: 25,
                //                         decoration:  BoxDecoration(
                                          
                //                             color: colors.kprimaryGreenColor,
                //                             shape: BoxShape.circle),
                //                         child:  Icon(Icons.camera_alt,
                //                             color: Colors.white,size: 20,)),
                //                   ]),
              
                      
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,40, 8,15),
                  child: Text('What is your name ?',style: kTileHeaderStyle,),
                ),
                Padding(
                   padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                  child: TextField(
                    style: kTileValueStyle,
                    controller: name,
                    decoration: InputDecoration(
                      
                      hintStyle: kHintStyle,
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      labelStyle: kHintStyle,
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0, 8,15),
                        child: Text('How old are you ?',style: kTileHeaderStyle,),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                        child: TextField(
                          style: kTileValueStyle,
                          controller: age,
                          decoration: InputDecoration(
                            hintStyle: kHintStyle,
                            hintText: 'Enter your age',
                            labelText: 'Age',
                            labelStyle: kHintStyle,
                            prefixIcon: Icon(Icons.person),
                            suffix: Text('yrs'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.kprimaryGreenColor)
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                

                SizedBox(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                      padding: const EdgeInsets.fromLTRB(8,0, 8,15),
                        child: Text('What is your biological sex ?',style: kTileHeaderStyle,),
                      ),
                      Padding(
                  padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                  child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  isDense: false,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  ),
              ),
              isExpanded: true,
              hint: Text(
                  'Select Your Gender',
                  style: kHintStyle,
              ),
              icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,
              buttonPadding: const EdgeInsets.only(left: 20, right: 15),
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
              ),
              items: genderItems
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: kTileValueStyle
                    ),
                  ))
                  .toList(),
              validator: (value) {
                  if (value == null) {
                  return 'Please select gender.';
                  }
              },
              onChanged: (value) {
                setState(() {
                  if(value.toString()== 'others'){
                    genderValue = 'Male';
                  }else if (value.toString() == 'Female'){
                    genderValue = 'Female';
                  }else if (value.toString() == 'Male'){
                    genderValue = 'Male';
                  }
                  genderValue = value.toString();
                });
                  //Do something when changing the item if you want.
              },
              onSaved: (value) {
                  setState(() {
                    genderValue = value.toString();
                  });
              },
            ),
                ),
                    ],
                  ),
                ),
                
                SizedBox(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                      padding: const EdgeInsets.fromLTRB(8,0, 8,15),
                        child: Text('What is your Height ?',style: kTileHeaderStyle,),
                      ),
                      Padding(
                         padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                        child: TextField(
                          
                          style: kTileValueStyle,
                          controller: height,
                          decoration: InputDecoration(
                            
                            labelStyle: kHintStyle,
                            hintStyle: kHintStyle,
                            hintText: 'Enter your Height',
                            labelText: 'Height',
                            suffix: Text('cms'),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0, 8,15),
                        child: Text('what is your Weight ?',style: kTileHeaderStyle,),
                      ),
                      Padding(
                         padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                        child: TextField(
                          style: kTileValueStyle,
                          controller: weight,
                          decoration: InputDecoration(
                            labelStyle: kHintStyle,
                            hintStyle: kHintStyle,
                            hintText: 'Enter your weight',
                            labelText: 'Weight',
                            prefixIcon: Icon(Icons.person),
                            suffix: Text('kgs'),
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height:30),
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
          save_details();
          genderValue == 'Female'? Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return PeriodDetails();
          })):
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return RecommendationDetailsPage();
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

