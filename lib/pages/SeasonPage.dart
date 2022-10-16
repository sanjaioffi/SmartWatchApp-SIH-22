import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/pages/textstyles.dart';
import 'package:smartwatch_application_sih/funtionalities/globals.dart'as globals;


class SeasonPage extends StatefulWidget {
  const SeasonPage({Key? key,required this.data}) : super(key: key);

  final data;

  @override
  State<SeasonPage> createState() => _SeasonPageState();
}

class _SeasonPageState extends State<SeasonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer_outlined),
                              Text(' Current Season: ',style: kTimeStyle,),
                              Text(globals.season,style: kTimeStyle,),
                            ],
                          )
                          
                        ],
                      ),
                    ),
                  ),
                ),
            SizedBox(
              height:  MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}