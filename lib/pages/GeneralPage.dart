import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';


class GeneralPage extends StatefulWidget {
  
  const GeneralPage({Key? key,required this.data}) : super(key: key);
  

  final data;

  @override
  State<GeneralPage> createState() => _GeneralPageState();

  
}


class _GeneralPageState extends State<GeneralPage> {

  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:ListView.builder(
  itemCount: widget.data.length,
  itemBuilder: (BuildContext context, int index) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                   height: 150,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/target.png',height: 80,width: 80,),
                        ),
                         SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              AutoSizeText(widget.data[index],style: kTileValueStyle,)
                                          
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  },
),
    );
  }
}