import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/funtionalities/exercise_reccomendation.dart';
import 'package:smartwatch_application_sih/pages/finished_page.dart';
import 'package:smartwatch_application_sih/providers/exercise_data_provider.dart';
import 'package:smartwatch_application_sih/providers/screen_provider.dart';


class ExerciseMianPage extends StatefulWidget {
  const ExerciseMianPage({Key? key}) : super(key: key);

  @override
  State<ExerciseMianPage> createState() => _ExerciseMianPageState();
}

class _ExerciseMianPageState extends State<ExerciseMianPage> {



  List Exercises= generate_exercise();

  late int  _duration;
  final CountDownController _controller = CountDownController();




  @override
  Widget build(BuildContext context) {
      int exercise_position = context.watch<Exercise_listner>().currentExercise;
    TextStyle Value = const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20);
    TextStyle Header = const TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
    Color darkColor = Colors.black87;
    _duration = int.parse(globals.exercise_data[Exercises[exercise_position]]!['duration'].toString());
       void next(){
  {if(exercise_position < Exercises.length-1)
                {
                  context.read<Exercise_listner>().nextExercise();

                _controller.reset();
                _controller.start();
                }
                else if(exercise_position == Exercises.length-1){
                 context.read<Screen_listner>().nextScreen(19);
                }}}
        return Scaffold(
          
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(Exercises[exercise_position],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
              ),
              Image.asset(globals.exercise_data[Exercises[exercise_position]]!['asset'].toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(globals.exercise_data[Exercises[exercise_position]]!['description'].toString(),style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),),
              ),
              
              TextButton(onPressed: () {
                next();
              } , child: const Text('Skip')),
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
              textStyle: TextStyle(
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
              },
              
              // This Callback will execute when the Countdown Ends.
              // onChange: (value) {
              //   if(value == _duration.toString()){
              //     next();
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
          style:TextStyle(color: kbuttonTextColor),
        ),
      ),
    );
  }

