import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';

class CheckCovidPage extends StatefulWidget {
  const CheckCovidPage({Key? key}) : super(key: key);

  @override
  State<CheckCovidPage> createState() => _CheckCovidPageState();
}

class _CheckCovidPageState extends State<CheckCovidPage> {
  var sleep_distress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(  
          children:[  
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Here are some of the questions to be answered',style: kHeaderStyle,textAlign: TextAlign.center),
            ),
            //here are some of the questions to be answered (center)
            const SizedBox(height: 50,),
            Text('Do you undergo any kind of sleep distress',style: kTileHeaderStyle,),
        
            Padding(
              padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
              child: ListTile(  
                title: Text('Yes',style: kNameStyle,),  
                leading: Radio(  
                  value: true,  
                  groupValue: sleep_distress,  
                  onChanged: ( value) {  
                    setState(() {  
                      sleep_distress = true;  
                    });  
                  },  
                ),  
              ),
            ),  
            Padding(
              padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
              child: ListTile(  
                title: Text('No',style: kNameStyle,),  
                leading: Radio(  
                  value: false,  
                  groupValue: sleep_distress,  
                  onChanged: ( value) {  
                    setState(() {  
                      sleep_distress = false;  
                    });  
                  },  
                ),  
              ),
            ),  



            const SizedBox(height: 20,),
            const Divider(),
            const SizedBox(height: 20,),
            Text('Do you undergo any kind of sleep distress',style: kTileHeaderStyle,),
        
            Padding(
              padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
              child: ListTile(  
                title: Text('Yes',style: kNameStyle,),  
                leading: Radio(  
                  value: true,  
                  groupValue: sleep_distress,  
                  onChanged: ( value) {  
                    setState(() {  
                      sleep_distress = true;  
                    });  
                  },  
                ),  
              ),
            ),  
            Padding(
             padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/4),
              child: ListTile(  
                title: Text('No',style: kNameStyle,),  
                leading: Radio(  
                  value: false,  
                  groupValue: sleep_distress,  
                  onChanged: ( value) {  
                    setState(() {  
                      sleep_distress = false;  
                    });  
                  },  
                ),  
              ),
            ),
            
          ],  
            ),
        ),
      ) 
    );
    
  }
}