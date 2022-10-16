import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/funtionalities/ayush_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/cholestral_recommendation.dart';
import 'package:smartwatch_application_sih/funtionalities/diabetic_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/heart_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/safesex_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/weather_recommendations.dart';
import 'package:smartwatch_application_sih/pages/CholestrolPage.dart';
import 'package:smartwatch_application_sih/pages/DiabeticPage.dart';
import 'package:smartwatch_application_sih/pages/GeneralPage.dart';
import 'package:smartwatch_application_sih/pages/HeartPage.dart';
import 'package:smartwatch_application_sih/pages/SeasonPage.dart';
import 'package:smartwatch_application_sih/pages/ayush_page_main.dart';
import 'package:smartwatch_application_sih/pages/ecg_page.dart';
import 'package:smartwatch_application_sih/pages/exercise_page_main.dart';
import 'package:smartwatch_application_sih/pages/food_page_main.dart';
import 'package:smartwatch_application_sih/pages/general_recommendations_page.dart';
import 'package:smartwatch_application_sih/pages/generated_ecg_screen.dart';
import 'package:smartwatch_application_sih/pages/generated_ppg_screen.dart';
import 'package:smartwatch_application_sih/pages/medicine_page_main.dart';
import 'package:smartwatch_application_sih/pages/recommendations_page.dart';
import 'package:smartwatch_application_sih/pages/sensor_page.dart';
import 'package:smartwatch_application_sih/pages/sex_page.dart';
import 'package:smartwatch_application_sih/pages/testpage.dart';
import 'package:smartwatch_application_sih/pages/value_receiving_page.dart';
import 'package:smartwatch_application_sih/pages/water_page_main.dart';
import 'package:smartwatch_application_sih/pages/yoga_page_main.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';
import '../app_bar.dart';
import 'Periods_main_page.dart';
import 'finished_page.dart';
import 'mainpage.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart'as globals;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List pages =  [MainPage(),EcgScreen(), GeneratedPpgPage(),ExerciseMianPage(),YogaMianPage(),FoodMainPage(),RecommendationsPage(),WaterPageMain(),MedicinePageMain(),PeriodsMainPage(),AyushPageMain(),GeneralPage(data: General_recommendation(),),DiabeticPage(data: dreturn_advice(),),CholestrolPage(data:creturn_advice()),HeartPage(data: heart_recommendations()),SeasonPage(data: generate_advices(globals.season)),SexPage(data: safe_sex()),SensorPage(),TestPage(),Finished(),GeneralRecommendationsPage(),ReceivingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity, 500), child: CustomAppBar()),
      body: pages[context.watch<Screen_listner>().currentScreen],
    );
    
  }
}