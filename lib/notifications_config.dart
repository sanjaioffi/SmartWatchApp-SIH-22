import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/color_constants.dart';

Future<void> foodNotification(String title, String body) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        
          id: 10,
          channelKey: 'basic channel',
          title: title,
          body: body,
          showWhen: true,
          wakeUpScreen: true,       
          criticalAlert: true,
          backgroundColor: kprimaryGreenColor,
          notificationLayout: NotificationLayout.Default),
          actionButtons: [
            NotificationActionButton(key: 'Done', label: 'Finished'),
            NotificationActionButton(key: 'Remind', label: 'Remind Me After Sometimes')
          ]
          );
          
}

Future<void> insulinNotification(String title, String body) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        
          id: 11,
          channelKey: 'basic channel',
          title: title,
          body: body,
          showWhen: true,
          wakeUpScreen: true,       
          criticalAlert: true,
          backgroundColor: kprimaryGreenColor,
          notificationLayout: NotificationLayout.Default),
          actionButtons: [
            NotificationActionButton(key: 'Done', label: 'Finished'),
            NotificationActionButton(key: 'Remind', label: 'Remind Me After Sometimes')
          ]
          );
          
}

Future<void> MedicineIntakeNotification(String title, String body) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        
          id: 12,
          channelKey: 'basic channel',
          title: title,
          body: body,
          showWhen: true,
          wakeUpScreen: true,       
          criticalAlert: true,
          backgroundColor: kprimaryGreenColor,
          notificationLayout: NotificationLayout.Default),
          actionButtons: [
            NotificationActionButton(key: 'Done', label: 'Finished'),
            NotificationActionButton(key: 'Remind', label: 'Remind Me After Sometimes')
          ]
          );
          
}

Future<void> waterNotification(String title, String body) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          category: NotificationCategory.Reminder,
          id: 11,
          channelKey: 'basic channel',
          title: title,
          body: body,
          showWhen: true,
          wakeUpScreen: true,
          criticalAlert: true,
          backgroundColor: kprimaryGreenColor,
          notificationLayout: NotificationLayout.Default));
          
}
