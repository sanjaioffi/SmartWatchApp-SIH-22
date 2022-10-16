import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/new_homepage.dart';
import 'package:smartwatch_application_sih/pages/recommendations_page.dart';
import 'package:smartwatch_application_sih/pages/reminders_page.dart';
import 'package:smartwatch_application_sih/pages/setting_page.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget currentWidget = const HomePage();
  int _currentIndex = 0;

  

  @override
  void initState() {
    
    
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

          showUnselectedLabels: false,
          selectedItemColor: kprimaryGreenColor,
          unselectedItemColor: Colors.grey,
          
          currentIndex: _currentIndex,
          onTap: (value) {
            if (value == 0) {
              setState(() {
                currentWidget = const HomePage();
              });
            } else if (value == 1) {
              setState(() {
                currentWidget = const RecommendationsPage();
              });
            } else if (value == 2) {
              setState(() {
                currentWidget = const RemindersPage();
              });
            }else if (value == 3) {
              setState(() {
                currentWidget = MyApp();
              });
            }

            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
              
                icon: Icon(Icons.notification_add_outlined),
                label: 'Recommendations',),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_chart),
                label: 'Remainders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings')
          ]),
      body: currentWidget,
    );
  }
}
