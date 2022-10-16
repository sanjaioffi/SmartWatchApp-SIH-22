import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class Dailer extends StatefulWidget {
  const Dailer({Key? key}) : super(key: key);

  @override
  State<Dailer> createState() => _DailerState();
}

class _DailerState extends State<Dailer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return TextButton(
              onPressed: _callNumber,
              child: Builder(
                builder: (context) {
                  return const Text('Call Number');
                }
              ),
            );
          }
        ),
      ),
    );
  }
}

_callNumber() async {
  const number = '+919095289742'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
