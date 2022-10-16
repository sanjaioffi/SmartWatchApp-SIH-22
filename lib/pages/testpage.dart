import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartwatch_application_sih/notifications_config.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;


class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
     DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        int remainingDays(fromDate){
    var currentDate = DateTime.now();
    int remaining_days = currentDate.difference(fromDate).inDays;
    print('done');
    return remaining_days;
  }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: (){
            foodNotification('Good Morning🥪', 'Start your day with our Personalized food diet');
          }, child: Text('Food Notification')),
          TextButton(onPressed: (){
            waterNotification('Drink water and stay hydrated🥛', 'Becoz Life starts with water');
          }, child: Text('Water Remainder Notification')),
          TextButton(onPressed: (){
            insulinNotification('Insulin Remainder💉', 'Dont\'t Forget to take your insulin');
          }, child: Text('Insulin Remainder Notification')),
          TextButton(onPressed: (){
            MedicineIntakeNotification('Dont\'t Forget To Take Medicines💊', 'we love you more than you love yourself.');
          }, child: Text('Medicine Intake Remainder Notification')),
          TextButton(onPressed: (){
            MedicineIntakeNotification('Period Remainder👧', 'we Expect that your next period will be in ${globals.period_length - remainingDays(dateFormat.parse(globals.last_period_date))} days ');
          }, child: Text('Period Remainder')),
          
          
        ],
      ),
    );
  }
}