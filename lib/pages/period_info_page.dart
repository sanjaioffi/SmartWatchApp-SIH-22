import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/pages/medical_condition_page.dart';
import 'package:smartwatch_application_sih/pages/medication_details_page.dart';
import 'package:smartwatch_application_sih/pages/retrival_page.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart'; //this is an external package for formatting date and time

class PeriodDetails extends StatefulWidget {
  @override
  _PeriodDetailsState createState() => _PeriodDetailsState();
}

class _PeriodDetailsState extends State<PeriodDetails> {
  DateTime? _selectedDate;



  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
      helpText: 'Set Your Last Period Date',
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
    
  }




  @override
  Widget build(BuildContext context) {
    
    TextEditingController? period_length = TextEditingController();
    var currentDate = DateTime.now();

        void save_details()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('period lenghth', int.parse(period_length.text));
      var date = (_selectedDate!.day).toString().length < 2?'0'+_selectedDate!.day.toString():_selectedDate!.day.toString() ;
      var month = (_selectedDate!.month).toString().length < 2?'0'+_selectedDate!.month.toString():_selectedDate!.month.toString() ;
      prefs.setString('last_period_date', '${_selectedDate!.year}-$month-$date ');
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    
              
              children: [
                 Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('Period Details',style: kHeaderStyle,textAlign: TextAlign.center,),
                ),
                Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text('Using this information, we can Remind you the expected period date and also the Fertility Window.',textAlign: TextAlign.center,style: kSubtitleStyle,),
                ),
                SizedBox(height: 50,),
                const Divider(),
                        Padding(
                           padding: const EdgeInsets.fromLTRB(8,0, 8,24),
                          child: TextField(
                            autofocus: true,
                            style: kTileValueStyle,
                            controller: period_length,
                            decoration: InputDecoration(
                              labelStyle: kHintStyle,
                              hintStyle: kHintStyle,
                              
                              hintText: 'Enter your Period Length',
                              labelText: 'Days',
                              prefixIcon: const Icon(Icons.female),
                              suffix: const Text('Days'),
                              border: const OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                          ),
                        ),

                        TextButton(onPressed: (){
                              _pickDateDialog();
                        }, child: Text('Set Your Last Period Date')),
                
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,0, 8,10),
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kprimaryGreenColor , borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('NEXT',style: kButtonStyle))),
        ),
                 onTap: () {
          
            save_details();

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
                  
              return RecommendationDetailsPage();
            }));
          })
      
                    
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
          // Padding(
          //                  padding: const EdgeInsets.fromLTRB(8,0, 8,24),
          //                 child: TextField(
          //                   autofocus: true,
          //                   style: kTileValueStyle,
          //                   controller: period_length,
          //                   decoration: InputDecoration(
          //                     labelStyle: kHintStyle,
          //                     hintStyle: kHintStyle,
                              
          //                     hintText: 'Enter your Period Length',
          //                     labelText: 'Days',
          //                     prefixIcon: const Icon(Icons.female),
          //                     suffix: const Text('Days'),
          //                     border: const OutlineInputBorder(),
          //                   ),
          //                   textInputAction: TextInputAction.done,
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
    //       const SizedBox(height: 20),
          
    //               InkWell(
    //       child: Padding(
    //         padding: const EdgeInsets.fromLTRB(8,0, 8,10),
    //         child: Container(
    //             height: 60,
    //             width: MediaQuery.of(context).size.width,
    //             decoration: BoxDecoration(
    //                 color: kprimaryGreenColor , borderRadius: BorderRadius.circular(10)),
    //             child: Center(child: Text('NEXT',style: kButtonStyle))),
    //       ),

        
    //     ],
    //   ),
    // );
  }
}

