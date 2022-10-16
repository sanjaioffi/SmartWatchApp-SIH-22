// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:smartwatch_application_sih/pages/medical_condition_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
// import 'package:smartwatch_application_sih/providers/getppg_provider.dart';
import 'package:smartwatch_application_sih/providers/healthdata_provider.dart';
import 'package:smartwatch_application_sih/providers/ppgdata_provider.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';
import 'package:smartwatch_application_sih/widgets/showsnackbar.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'funtionalities/write_data.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}




class _CustomAppBarState extends State<CustomAppBar> {

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
   AwesomeNotifications().isNotificationAllowed().then((is_allowed){
    if(!is_allowed){
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: const Text('Allow Notification'),
        content: const Text('Our app would like to send notifications'),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);    }, child: const Text("Don't Allow")),
          TextButton(onPressed: (){AwesomeNotifications().requestPermissionToSendNotifications().then((value) => Navigator.pop(context));   }, child: const Text("Allow"))
        ],
      ));
    }
   });
  }
  
  //bluetooth device constants
  final String SERVICE_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9f";
  final String CHARACTERISTIC_UUID = "6e400003-b5a3-f393-e0a9-e50e24dcca9f";
  // final String CHARACTERISTIC_UUID_RX = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
  final String TARGET_DEVICE_NAME = "SG smartWatch";


Future<bool> _checkDeviceBluetoothIsOn() async {
    return await flutterBlue.isOn;
  }


  // initializing flutter blue
  FlutterBlue flutterBlue = FlutterBlue.instance;

  // initializing variables
  StreamSubscription<ScanResult>? scanSubScription;
  BluetoothDevice? targetDevice;
  // BluetoothCharacteristic? sendCharacteristic;
  BluetoothCharacteristic? receiveCharacteristic;

  // variables will be change
  String connectionText = "disconnected";



   // scanning for ble devices
  startScan() async{
    if (await _checkDeviceBluetoothIsOn()){
      ShowSnackbar(context, "Start Scanning");

    scanSubScription = flutterBlue.scan().listen((scanResult) {
      if (scanResult.device.name == TARGET_DEVICE_NAME) {
        
        stopScan();
        
          ShowSnackbar(context, "Device Found");
        
        targetDevice = scanResult.device;
        connectToDevice();
        
      }
    }, onDone: () => stopScan());
    }
    
      
    
  }

// stop scanning
  stopScan() async{
    flutterBlue.stopScan();
    await scanSubScription?.cancel();
    
      
    scanSubScription = null;
   
    
    ShowSnackbar(context, "Scanning Stopped");
  }

  // connecting to scanned devices
  connectToDevice() async {
    if (targetDevice == null) return;
    
      ShowSnackbar(context, "Device Connecting");
    await targetDevice?.connect();
    ShowSnackbar(context, "Device Connected");
                       
                          var minute = DateTime.now().minute;
                          var second = DateTime.now().second;
                           var hour = DateTime.now().hour;
                         
                          var data = ('Time,$hour $minute $second').toUpperCase() ;
    
    writeData(data);
    print('data written successfully - $data');
    discoverServices();
    
  }

  
// scanning for available services present in connected device 
  discoverServices() async {
    print('discovering services');
    
    
    if (targetDevice == null) return;
    print('target device');

    List<BluetoothService>? services = await targetDevice?.discoverServices();
    services?.forEach((service) {
        print("***********service ${service.uuid.toString()}");
      // do something with service--
      if (service.uuid.toString() == SERVICE_UUID) {
        print("service ${service.uuid.toString()}");
        for (var characteristic in service.characteristics) {
          // if (characteristic.uuid.toString() == CHARACTERISTIC_UUID_TX) {
          //   setState(() {
          //     globals.sendCharacteristic = characteristic;
          //   });
          //   // print('send characteristics present');
          // }
          print('characteristic ${characteristic.uuid.toString()}');
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            print('receive characteristics present');
            setState(() {
              globals.sendCharacteristic = characteristic;
            });
            receiveCharacteristic = characteristic;
            receiveCharacteristic?.setNotifyValue(!characteristic.isNotifying);
            print('notify value set');
              characteristic.value.listen((event) {    
              var value = utf8.decode(event); 
              print(value);
              var deValue = value.split(','); 
              if (deValue.length > 1 && deValue[0] == 'A'){
                context.read<healthdata_listner>().save_health_data(deValue);
                setState(() {
                  globals.health_data = deValue;
                });
              }
              if (deValue.length > 1 && deValue[0] == 'B' && deValue.length < 512){
                context.read<ppgdata_listner>().save_ppg_data((int.parse(deValue[1]).abs()));
              
              }}
               
              // print(deValue);
            );
          }
        }
      }
    });
  }

// function will be call in another class
  // writeData(String data) async {
  //   if (globals.sendCharacteristic == null) return;
  //   List<int> bytes = utf8.encode(data);
  //   await globals.sendCharacteristic?.write(data);
  //   print(data);
  //   print('done');
  // }


  disconnectFromDevice() {
    if (targetDevice == null) return;
    targetDevice?.disconnect();
    setState(() {
         ShowSnackbar(context, "Device Disconnected");
    });
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    // if (context.watch<getppg_listner>().getppg){
    //   writeData('c');
    // }

    
    int currentScreen = context.watch<Screen_listner>().currentScreen;
    return Container(
      height: 80,
      color: Colors.white,
      child:SafeArea(
        child: Row(
                    children: [
                      
                      currentScreen != 0?
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            
                              context.read<Screen_listner>().nextScreen(0);
                            
                            // if(currentScreen == 1){
                            //   context.read<Screen_listner>().nextScreen(0);
                            // }
                            // if(currentScreen >= 2 && currentScreen<=5){
                            //   context.read<Screen_listner>().nextScreen(0);
                            // }
                          },
                          child: const Icon(Icons.arrow_back,color: Colors.black,)),
                      ):const Text(''),
                      const SizedBox(width: 10,),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'HEALHER',
                            
                            style: kHeaderStyle,
                          )),
                          
                          InkWell(
                        child:  
                        Icon(
                          Icons.bluetooth,
                          color: targetDevice != null?Colors.blue:Colors.red,
                        ),
                        onLongPress: () {
                          stopScan();
                          // disconnectFromDevice();
                        },
                        // onTapCancel: () {
                        //   stopScan();
                        // },
                        onTap: () { 

                          startScan();
                        },),
                        const SizedBox(width: 20),
                       InkWell(
                        onTap: () { 
                          context.read<Screen_listner>().nextScreen(18);
                          } ,
                        child: const Icon(                         
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                      ),
                      

                      const SizedBox(width: 20),
                      InkWell(
                        child: const Icon(Icons.person_outline,color: Colors.black,),
                        onTap: () {
                           var second = DateTime.now().second;
                          var minute = DateTime.now().minute;
                          var hour = DateFormat('HH').format(DateTime.now());
                          var day = DateTime.now().day;
                          var month = DateTime.now().month;
                          var year = DateTime.now().year;
                            var data = 'Time,$second,$minute,$hour,$day,$month,$year';
                           writeData(data);
                           writeData('C');
                          context.read<ppgdata_listner>().save_ppg_data(int.parse('300'));
                        },
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
      ),);
  }
}