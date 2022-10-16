import 'dart:convert';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;

// function will be call in another class
  writeData(String data) async {
    if (globals.sendCharacteristic == null) return;
    List<int> bytes = utf8.encode(data);
    await globals.sendCharacteristic?.write(bytes);
    print('done');
  }