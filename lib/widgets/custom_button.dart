import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwatch_application_sih/color_constants.dart' as colors;
import 'package:smartwatch_application_sih/pages/textstyles.dart';

class NextButton extends StatelessWidget {
  NextButton({
    Key? key,required this.nextpage,
    required this.text,
    required this.function
  }) : super(
          key: key,
        );

  Widget? nextpage;
  String? text;
  var function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,0, 8,10),
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: colors.kprimaryGreenColor , borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(text!,style: kButtonStyle))),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return nextpage!;
          }));
        });
  }
}
