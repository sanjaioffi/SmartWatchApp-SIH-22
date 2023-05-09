import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListenNotifications extends StatefulWidget {
  const ListenNotifications({Key? key}) : super(key: key);

  @override
  State<ListenNotifications> createState() => _ListenNotificationsState();
}

class _ListenNotificationsState extends State<ListenNotifications> {
  StreamSubscription<ServiceNotificationEvent>? _subscription;
  List<ServiceNotificationEvent> events = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('notification listner'),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // getting permission from user to listen notifications

                  TextButton(
                    onPressed: () async {
                      final res =
                          await NotificationListenerService.requestPermission();
                      print("Is enabled: $res");
                    },
                    child: const Text("Request Permission"),
                  ),
                  const SizedBox(height: 20.0),

                  // checking if the user enabled the permission
                  TextButton(
                    onPressed: () async {
                      print('pressed');
                      final bool res = await NotificationListenerService
                          .isPermissionGranted();
                      print("Is enabled: $res");
                    },
                    child: const Text("Check Permission"),
                  ),
                  const SizedBox(height: 20.0),

                  // listening notifications

                  TextButton(
                    onPressed: () {
                      _subscription = NotificationListenerService
                          .notificationsStream
                          .listen((event) {
                        setState(() {
                          events.add(event);
                          savethis();
                        });
                        // events.forEach((item) {

                        //   print(item.title);
                        // });
                        print(
                            '>>>>>>>>>>>>>>>>>>>>>list:/n${events.toString()}>>>>>>>>>>>>>>>>>>>>>list:/n');
                      });
                    },
                    child: const Text("Start Stream"),
                  ),
                  const SizedBox(height: 20.0),

                  // disabling listening notifications

                  TextButton(
                    onPressed: () {
                      _subscription?.cancel();
                    },
                    child: const Text("Stop Stream"),
                  ),
                  TextButton(
                    onPressed: () async {
                      delete();
                    },
                    child: const Text("Delete"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    onTap: () async {
                      try {
                        await events[index].sendReply("1");
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    trailing: events[index].hasRemoved!
                        ? const Text(
                            "Removed",
                            style: TextStyle(color: Colors.red),
                          )
                        : const SizedBox.shrink(),
                    leading: Image.memory(
                      events[index].appIcon!,
                      width: 35.0,
                      height: 35.0,
                    ),
                    title: Text(events[index].title ?? "No title"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          events[index].content ?? "no content",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        events[index].canReply!
                            ? const Text(
                                "Replied with: This is an auto reply",
                                style: TextStyle(color: Colors.purple),
                              )
                            : const SizedBox.shrink(),
                        events[index].haveExtraPicture!
                            ? Image.memory(
                                events[index].extrasPicture!,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  savethis() async {
    var prefs = await SharedPreferences.getInstance();
    int? num = prefs.getInt('no_of_notifications');
    int number = num ?? 0;
    // print(number);
    prefs.setInt('no_of_notifications', number + 1);
  }

  delete() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('no_of_notifications');
  }
}
