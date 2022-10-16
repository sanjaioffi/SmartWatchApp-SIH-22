import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/Periods_main_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import '../providers/screen_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AyushPageMain extends StatefulWidget {
  const AyushPageMain({Key? key}) : super(key: key);

  @override
  State<AyushPageMain> createState() => _AyushPageMainState();

  
}


class _AyushPageMainState extends State<AyushPageMain> {

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      int remainingDays(fromDate){
    var currentDate = DateTime.now();
    int remaining_days = currentDate.difference(fromDate).inDays;
    print('done');
    return remaining_days;
  }
  String FertilityWindow(){
    if (globals.last_period_date!=null){  int remaining_days = remainingDays(dateFormat.parse(globals.last_period_date));
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
      }return 'LOW';}
      return 'no';
  }
  @override
  Widget build(BuildContext context) {
    var period = PeriodsMainPage();
    return SingleChildScrollView(
      child: Column(
        children: [
          customTile(image: 'assets/ayush_general.png',title: 'General Recommendations',page: 11,),
          customTile(image: 'assets/Season.jpg',title: 'Seasonal Recommendations',page: 15,),
          ((FertilityWindow()=='LOW' || FertilityWindow() == 'HIGH') && globals.gender == 'Female') ? customTile(image: 'assets/ayush.png',title: 'Sex Recommendations',page: 16,):Text(''),
          globals.isHeartPatient == true? customTile(image: 'assets/ayush_heart.png',title: 'Heart Recommendations',page: 14,):Text(''),
          globals.isdiabetic== true? customTile(image: 'assets/ayushdiabetes.png',title: 'Diabetic Recommendations',page: 12,):Text(''),
          globals.hasCholesterol? customTile(image: 'assets/ayushcholestrol.png',title: 'Cholestrol Recommendations',page: 13,):Text(''),
        ],
      ),
    );
  }
}

class customTile extends StatelessWidget {
  const customTile({
     required this.title,
     required this.image,
     required this.page,
    Key? key,
  }) : super(key: key,);

  final title;
  final image;
  final page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){context.read<Screen_listner>().nextScreen(page);},
      child: Padding(
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
                              child: Image.asset(image,height: 80,width: 80,),
                            ),
                             SizedBox(width: 20,),
                            Container(width: MediaQuery.of(context).size.width-200,child: AutoSizeText(title,style: kTileValueStyle,))
                          ],
                        ),
                      ),
                    ),
                  ),
    );
    
  }
}