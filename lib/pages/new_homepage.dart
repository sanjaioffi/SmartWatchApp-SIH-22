import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartwatch_application_sih/funtionalities/climatic_recommendations.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart' as globals;
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../color_constants.dart';
import '../providers/healthdata_provider.dart';
import '../providers/screen_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Horizon',
);
final Uri _url = Uri.parse('https://esanjeevaniopd.in/Home');

      Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }}
     List dataValues = context.watch<healthdata_listner>().health_data;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
     
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            height: MediaQuery.of(context).size.height / 2 ,
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Center(
                              child: Image.asset(globals.gender == 'Male'?'assets/PIC_MALE.png':'assets/PIC_FEMALE.png')
                            ),
                            Column(children: [
                              Center(
                              child: Text(
                                globals.name,
                                style: kValueStyle
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Height',style: kHintStyle,),
                                      Text('${globals.height.toString()} mtrs',style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 17,fontWeight: FontWeight.w600,color:kprimaryTextColor,
                    ),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Weight',style: kHintStyle,),
                                      Text('${globals.weight.toString()} kgs',style:  TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 17,fontWeight: FontWeight.w600,color:kprimaryTextColor,
                    ),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('BMI',style: kHintStyle,),
                                      Text('${globals.bmi.round().toString()}',style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 17,fontWeight: FontWeight.w600,color:kprimaryTextColor,
                    ),)
                                    ],
                                  ),
                                  
                                  
                                ],
                              ),
                            )
                            ],)
                          ]),
                    ),
                  ),
                              ),
                            ),
                          ),
      
            Row(
              children: [
                Expanded(
                  child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            height: MediaQuery.of(context).size.width / 2,
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          const Center(
                            child: Icon(
                              FontAwesomeIcons.heartPulse,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          Column(children: [
                            Center(
                            child: Text(
                              'Heart rate',
                              style: kValueStyle
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: RichText(
                                  text: TextSpan(
                                      text: dataValues[1],
                                      style: kValueStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' Bpm',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                )),
                          ),
                          ],)
                        ]),
                  ),
                              ),
                            ),
                          ),
                ),
                Expanded(
                  child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            height: MediaQuery.of(context).size.width / 2,
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Center(
                              child: Image.asset('assets/oxygen-saturation.png',
                                  width: 30, height: 30)),
                       
                          Column(
                            children: [
                                Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'spo2',
                              style: kValueStyle
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: RichText(
                                  text: TextSpan(
                                      text: dataValues[2],
                                      style: kValueStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' %',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                )),
                          ),
                        ]),
              ]),
                            
                          )
                              ),
                            ),
                          ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                             height: MediaQuery.of(context).size.width / 2,
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Image.asset('assets/hypertension.png',
                                  width: 30, height: 30)),
                          Column(
                            children: [Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Blood Pressure',
                              style: TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 17,fontWeight: FontWeight.w600,color:kprimaryTextColor,
)
                            ),
                          ),
                          
                          Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: RichText(
                                  text: TextSpan(
                                      text: '${dataValues[3]}/${dataValues[4]}',
                                      style: kValueStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' mmHg',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                )),
                          ),],
                          )
                        ]),
                  ),
                              ),
                            ),
                          ),
                ),
                Expanded(
                  child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showEcgAlertDialog(context);
                          context.read<Screen_listner>().nextScreen(1);
                          // context.read<getppg_listner>().getPpgData(true);
                          // print(context.watch<getppg_listner>().getppg);
                        },
                              child: Container(
                                height: MediaQuery.of(context).size.width / 2,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:  Center(
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                              
                              Center(
                                  child: Image.asset('assets/cardiogram.png',
                                      width: 40, height: 40)),
                                      Column(
                                        children: [
                                          Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ECG ',
                                  style: kValueStyle
                                ),
                              ),
                              Center(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: RichText(
                                      text: const TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Click here to check >',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ]),
                                    )),
                              ),
                                        ],
                                      )
                                                      ]),
                                        ),
                                      ),
                                                ),
                            )
                              ),
                            ),
                  
                
              ],
            ),

            TextButton(onPressed: (){showAlertDialog(context);}, child: Text('alert')),
            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: _launchUrl,
                              child: Container(
                              height: MediaQuery.of(context).size.width / 2,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/doctor.png'),
                                                    Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                
                                Column(
                                  
                                  children: [
                                   SizedBox(width:MediaQuery.of(context).size.width/2.5,child: AutoSizeText('To get free ayush consultations',style: kTileValueStyle,)),
                                   SizedBox(height:30),
                                  AnimatedTextKit(
                                          animatedTexts: [
                                            ColorizeAnimatedText(
                                              'Click Here...',
                                              textStyle: kValueStyle,
                                              colors: colorizeColors,
                                            ),]),
                                           
                                
                                ],)
                              ]),
                                                  ],
                                                ),
                                              ),
                                ),
                              ),
                            ),
                          ),

          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = TextButton(  
    child: Text("OK"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Heart Abnormality Alert"),  
    content: Text(""),  
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  



showEcgAlertDialog(BuildContext context) {  
  // Create button  
  Widget okButton = TextButton(  
    child: Text("OK",style: kHeaderStyle,),  
    onPressed: () {  
      context.read<Screen_listner>().nextScreen(1);
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text("Steps to be Followed Before Testing ECG"),  
    content: Text('''
1. Rest your arms on a table or in your lap 
2. Place your index  finger on the right side of the watch 
3. Wait until the recording is done 
4. Once it is ready, View your ECG''',style: kNameStyle,),  
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  