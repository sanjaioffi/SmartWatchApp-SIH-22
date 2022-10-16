import 'dart:convert';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/funtionalities/yoga_recommendation.dart';
import 'package:smartwatch_application_sih/pages/finished_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';


class YogaMianPage extends StatefulWidget {
  const YogaMianPage({Key? key}) : super(key: key);

  @override
  State<YogaMianPage> createState() => _YogaMianPageState();
}

class _YogaMianPageState extends State<YogaMianPage> {



  List Yoga= generate_yoga();
  
  int Yoga_position = 0;
  late int  _duration;
  final CountDownController _controller = CountDownController();


  void next(){
  {if(Yoga_position < Yoga.length-1)
                {
                  setState(() {
                  Yoga_position++;
                }
                );
                _controller.reset();
                _controller.start();
                }
                else if(Yoga_position == Yoga.length-1){
                  Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                    
                return Finished();
              }));
                }}}

  @override
  Widget build(BuildContext context) {
    TextStyle Value = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20);
    TextStyle Header = TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
    Color darkColor = Colors.black87;
    _duration = int.parse(globals.yoga_exercise[Yoga[Yoga_position]]!['duration'].toString());
        return Scaffold(
          
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(Yoga[Yoga_position],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
              ),
              Image.asset(globals.yoga_exercise[Yoga[Yoga_position]]!['asset'].toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(globals.yoga_exercise[Yoga[Yoga_position]]!['description'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),),
              ),
              
              TextButton(onPressed: () {
                print(Yoga.length);
                next();
              } , child: Text('Skip')),
              CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: _duration,
              
              
              // Countdown initial elapsed Duration in Seconds.
              initialDuration: 0,
              
              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,
              
              // Width of the Countdown Widget.
              width: MediaQuery.of(context).size.width / 3,
              
              // Height of the Countdown Widget.
              height: MediaQuery.of(context).size.height / 3,
              
              // Ring Color for Countdown Widget.
              ringColor: Colors.grey[300]!,
              
              // Ring Gradient for Countdown Widget.
              ringGradient: null,
              
              // Filling Color for Countdown Widget.
              fillColor: kprimaryGreenColor,
              
              // Filling Gradient for Countdown Widget.
              fillGradient: null,
              
              // Background Color for Countdown Widget.
              backgroundColor: Colors.green,
              
              // Background Gradient for Countdown Widget.
              backgroundGradient: null,
              
              // Border Thickness of the Countdown Ring.
              strokeWidth: 20.0,
              
              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,
              
              // Text Style for Countdown Text.
              textStyle:  TextStyle(
                fontSize: 33.0,
                color: kprimaryTextColor,
                fontWeight: FontWeight.bold,
              ),
              
              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.S,
              
              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: true,
              
              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: true,
              
              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,
              
              // Handles the timer start.
              autoStart: true,
              
              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                debugPrint('Countdown Started');
              },
              
              // This Callback will execute when the Countdown Ends.
              // onChange: (value) {
              //   if(value == '0'){
              //     print('test 0');
              //     next();
              //   }
              //   else{
              //     print(value);
              //     print('tese 1');
              //   }
              // },
              
              
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // _button(
            //   title: "Start",
            //   onPressed: () => _controller.start(),
            // ),
            const SizedBox(
              width: 10,
            ),
            _button(
              title: "Pause",
              onPressed: () => _controller.pause(),
            ),
            const SizedBox(
              width: 10,
            ),
            _button(
              title: "Resume",
              onPressed: () => _controller.resume(),
              
            ),
        
             
        
          ],
              ),
          ]),
        ),
      ),
      
    );
  }}

    Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kprimaryGreenColor),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: kButtonStyle,
        ),
      ),
    );
  }

