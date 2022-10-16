import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/notifications_config.dart';
import 'package:smartwatch_application_sih/pages/personal_details_page.dart';
import 'package:smartwatch_application_sih/pages/retrival_page.dart';
import 'package:smartwatch_application_sih/providers/exercise_data_provider.dart';
import 'package:smartwatch_application_sih/providers/getppg_provider.dart';
import 'package:smartwatch_application_sih/providers/healthdata_provider.dart';
import 'package:smartwatch_application_sih/providers/ppgdata_provider.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/services.dart';
// 141414 color - background color

// dark grey
// mild white shadow

import 'package:workmanager/workmanager.dart';

  void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    waterNotification('Drink water and stay hydrated🥛', 'Becoz Life starts with water');
    print("Task executing :" + taskName);
    return Future.value(true);
    
  });
}



   void Morning() async{
  foodNotification('Good Morning🥪', 'Start your day with our Personalized food diet');
  SharedPreferences  prefs = await SharedPreferences.getInstance(); 
  prefs.setInt('notificationId', 1); 
}

void Afternoon() async{
  SharedPreferences  prefs = await SharedPreferences.getInstance(); 
  foodNotification('Good AfterNoon🤞', 'Don\'t Miss your Lunch,We created a personalized diet for you  ');
  prefs.setInt('notificationId', 2);
}

void Night() async{
  SharedPreferences  prefs = await SharedPreferences.getInstance(); 
  foodNotification('Good Night🌉', 'End Your day with our personalized diet');
  prefs.setInt('notificationId', 0);
}


// 
void main() async{
  
  
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      
        playSound: true,
        channelKey: 'basic channel',
        channelName: 'test notification',
        channelDescription: 'test',
        importance: NotificationImportance.High,
        defaultColor: Colors.green,
        channelShowBadge: true)
  ]);
  WidgetsFlutterBinding.ensureInitialized();

  
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Workmanager().initialize(callbackDispatcher);
  await AndroidAlarmManager.initialize();
  // await MongoDatabase.connect();
   SharedPreferences  prefs = await SharedPreferences.getInstance(); 
  //  prefs.getInt('notificationId')??
   prefs.getInt('notificationId')??prefs.setInt('notificationId', 0);
   final cron = Cron();

  // Breakfast Notification
   cron.schedule(Schedule.parse('0  7-10	*	*	*'), () async{
        foodNotification('Good Morning🥪', 'Start your day with our Personalized food diet');
      print('BreakFast called');
    });

  // Lunch Notification
  cron.schedule(Schedule.parse('0	 13-15  *	*	*'), () async{
        foodNotification('Good AfterNoon🤞', 'Don\'t Miss your Lunch,We created a personalized diet for you  ');
      print('Lunch called');
    });

  // Dinner Notific`a`tion
  cron.schedule(Schedule.parse('0	 19-21  *	*	*'), () async{
         foodNotification('Good Night🌉', 'End Your day with our personalized diet');
      print('Dinner called');
    });

  // cron.schedule(Schedule.parse('12	 16-21  *	*	*'), () async{
  //        foodNotification('Good Night🌉', 'End Your day with our personalized diet');
  //     print('Dinner called');
  //   });


    // cron.schedule(Schedule.parse('55 14 25 8 5'), () async{
    //   foodNotification('Good Night🌉', 'End Your day with our personalized diet');
    //   print(DateTime.now());
    // });

        
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (_) => Screen_listner()),
    
    ChangeNotifierProvider(create: (_) => healthdata_listner()),
    ChangeNotifierProvider(create: (_)=> Exercise_listner()),
    ChangeNotifierProvider(create: (_) => ppgdata_listner()),
    ChangeNotifierProvider(create: (_) => getppg_listner())
    ],
    
    
   child: MaterialApp(
        
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
    inputDecorationTheme:  InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: ktextfieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: kprimaryGreenColor),
      ),
    ),),
            home: Scaffold(
              // appBar: PreferredSize(preferredSize: Size(double.infinity, 500), child: CustomAppBar()),
              
              body: prefs.getBool('is login') == true ?RetrivalPoint():PersonalDetailsPage(),
            ))));
            const int helloAlarmID = 0;
            int currentYear = DateTime.now().year;
            int currentMonth = DateTime.now().month;
            int currentDay = DateTime.now().day;
            List times = [10,13,21];
            List notifications = [DateTime(currentYear,currentMonth,currentDay,10,20),DateTime(currentYear,currentMonth,currentDay,10,16),DateTime(currentYear,currentMonth,currentDay,10,18)];
            List type = [Morning,Afternoon,Night];

            Workmanager().registerPeriodicTask("WaterRemainder","Water", frequency: const Duration(minutes: 15),);
             
  

}
                 

